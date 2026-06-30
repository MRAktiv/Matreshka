#!/usr/bin/env python3
# Matreshka — © 2026 MRAktiv. Все права защищены. Несанкционированное копирование запрещено.
"""Matreshka — official name extraction pipeline.

Pulls localized names straight from Blizzard's own client data via the
wago.tools DB2 CSV exports (enUS + ruRU for a given build) and compares the
result against the IDs already present in an addon Database file.

This is the addon's *own* data provenance: names are sourced from the official
client build, reproducibly, instead of being copied from another addon. Only
data that actually ships in the Classic client DB2 is reachable this way —
items (ItemSparse) and spells (SpellName); creature and quest text are
server-side in Classic and are not available here.

Usage:
    fetch_official_names.py <Table> <build> <NameColumn> <ru_db.lua> <en_db.lua> [out_prefix]

Example (items, TBC Anniversary 2.5.5):
    fetch_official_names.py ItemSparse 2.5.5.68101 Display_lang \
        Matreshka/Database/Items/ru.lua Matreshka/Database/Items/en.lua out/items
"""
import csv, io, os, re, sys, urllib.request

CSV_URL = "https://wago.tools/db2/{table}/csv?build={build}&locale={locale}"


def fetch_names(table, build, locale, name_col):
    """Stream the CSV export and return {id: name} for non-empty names."""
    url = CSV_URL.format(table=table, build=build, locale=locale)
    req = urllib.request.Request(url, headers={"User-Agent": "Matreshka-build/1.0"})
    names = {}
    with urllib.request.urlopen(req, timeout=240) as resp:
        reader = csv.reader(io.TextIOWrapper(resp, encoding="utf-8", newline=""))
        header = next(reader)
        id_at = header.index("ID")
        name_at = header.index(name_col)
        for row in reader:
            if not row:
                continue
            name = row[name_at].strip()
            if name:
                names[int(row[id_at])] = name
    return names


def existing_ids(path):
    """IDs already defined in a Matreshka Database file (lines like `[123]={...}`)."""
    ids = set()
    line_id = re.compile(r"^\[(\d+)\]=")
    with io.open(path, encoding="utf-8") as f:
        for line in f:
            m = line_id.match(line)
            if m:
                ids.add(int(m.group(1)))
    return ids


def lua_escape(s):
    return s.replace("\\", "\\\\").replace('"', '\\"').replace("\r", "").replace("\n", "\\n")


def write_entries(path, db_key, ids, names):
    with io.open(path, "w", encoding="utf-8", newline="\n") as f:
        f.write("Matreshka_DB = Matreshka_DB or {}\n")
        f.write('Matreshka_DB["%s"] = {\n' % db_key)
        for i in ids:
            f.write('[%d]={"%s"},\n' % (i, lua_escape(names[i])))
        f.write("}\n")


def main():
    if len(sys.argv) < 6:
        print(__doc__)
        sys.exit(1)
    table, build, name_col, ru_db, en_db = sys.argv[1:6]
    out_prefix = sys.argv[6] if len(sys.argv) > 6 else None

    print("fetching enUS ...", flush=True)
    en = fetch_names(table, build, "enUS", name_col)
    print("fetching ruRU ...", flush=True)
    ru = fetch_names(table, build, "ruRU", name_col)

    both = [i for i in ru if i in en]                 # need both to match live->translated
    have = existing_ids(ru_db)
    missing = sorted(i for i in both if i not in have)

    print("official enUS      : %d" % len(en))
    print("official ruRU      : %d" % len(ru))
    print("official en & ru   : %d" % len(both))
    print("already in addon   : %d" % len(have))
    print("missing from addon : %d" % len(missing))

    if missing:
        print("\nsample of missing (id -> official ru name):")
        for i in missing[:12]:
            print("  %-8d %s" % (i, ru[i]))

    if out_prefix and missing:
        os.makedirs(os.path.dirname(out_prefix) or ".", exist_ok=True)
        kind = "item" if table == "ItemSparse" else ("spell" if "Spell" in table else table.lower())
        write_entries(out_prefix + ".ru.lua", kind + ":ru", missing, ru)
        write_entries(out_prefix + ".en.lua", kind + ":en", missing, en)
        print("\nwrote %d new officially-sourced entries to %s.{ru,en}.lua" % (len(missing), out_prefix))


if __name__ == "__main__":
    main()
