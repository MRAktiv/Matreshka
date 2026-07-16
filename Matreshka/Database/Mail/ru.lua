-- Matreshka — внутриигровой русификатор WoW.
-- © 2026 MRAktiv. Все права защищены. Несанкционированное копирование и распространение запрещено.

-- Mail (letter) translations. Keyed by the English letter body the client shows, normalized like
-- gossip (collapse whitespace, fold the player name to $N). Mail bodies are server-sent with no
-- client id and no official ruRU, so values are machine-translated and proofread. The sender name
-- inside the signature is kept in English to match the untranslated "From" line.

Matreshka_Mail = Matreshka_Mail or {}
Matreshka_Mail.ru = Matreshka_Mail.ru or {}
local M = Matreshka_Mail.ru

M["Greetings my friend - though my arm is weary from the battle we continue to wage in the ruins of Lordaeron, it is always strong enough to pen this missive to a hero such as you. It pleases me to know the aid you lent us days ago continues to yield benefits, ones we try to enact upon on a daily basis. Should you find yourself in the Western Plaguelands soon, please stop by the camp. Your seasoned hand would be most welcomed in a cauldron run! For Stormwind! Commander Ashlam Valorfist"] =
"Приветствую, друг мой! Пусть рука моя и утомлена битвой, которую мы всё ещё ведём в руинах Лордерона, сил её всегда хватает, чтобы черкнуть пару строк такому герою, как ты. Мне отрадно знать, что помощь, оказанная тобой на днях, и поныне приносит плоды — те, что мы стараемся пожинать изо дня в день.\n\nЕсли окажешься в Западных Чумных землях, загляни в лагерь. Твоя опытная рука будет как нельзя кстати при варке в котле!\n\nЗа Штормград!\nCommander Ashlam Valorfist"
