-- Matreshka — внутриигровой русификатор WoW.
-- © 2026 MRAktiv. Все права защищены. Несанкционированное копирование и распространение запрещено.

-- Реплики NPC/боссов, которых нет в официальном дампе Blizzard (эскорт-выкрики, приветствия
-- по имени и т.п.) — ручной перевод. Именные строки хранятся с токеном $N: движок сворачивает
-- имя игрока к $N перед матчем, поэтому одна запись работает для любого персонажа.
-- Ключ = enUS-текст (collapse ws, $n->$N); значение = ru. Движок матчит с той же нормализацией.

Matreshka_Chat = Matreshka_Chat or {}
Matreshka_Chat.ru = Matreshka_Chat.ru or {}
local C = Matreshka_Chat.ru

C["Don't go too far away Seth. You know mommy doesn't like it when she can't hear you."]="Не уходи слишком далеко, Сет. Ты же знаешь, мамочка не любит, когда не слышит тебя."
C["Gimme my dolly!!"]="Отдай мою куколку!!"
C["Ok, I think I can make it on my own from here. Thank you so much for breaking me out of there!"]="Ладно, дальше, думаю, я и сам справлюсь. Огромное спасибо, что вытащил меня оттуда!"
C["You sure you're ready? Take a moment."]="Точно готов? Не спеши, соберись."
C["Incompetent fools! Auchindoun should've been ours... look at yourselves scrambling like rats!"]="Никчёмные глупцы! Аукиндон должен был стать нашим... а вы копошитесь, как крысы!"
C["Spare a copper, sir?"]="Не найдётся медяка, господин?"
C["Seize him! Seize the worthless criminal and his allies!"]="Схватить его! Схватить ничтожного преступника и его приспешников!"
C["$N, eh? Oy! Citizen $N, come 'ere. Highlord Bolvar Fordragon has requested that all able bodied heroes o' the Alliance meet with him at Stormwind Keep. You just been recruited, mate! Get a move on!"]="$N, значит? Эй! Гражданин $N, а ну поди сюда. Верховный лорд Болвар Фордрагон повелел, чтобы все крепкие герои Альянса явились к нему в крепость Штормграда. Тебя только что призвали на службу, приятель! Пошевеливайся!"
C["That one, Malagan. I know her. Dependable, brave, and trustworthy. $N is her name."]="Вон та, Малаган. Я её знаю. Надёжная, храбрая, верная. Её зовут $N."
C["That one, Malagan. I know him. Dependable, brave, and trustworthy. $N is his name."]="Вон тот, Малаган. Я его знаю. Надёжный, храбрый, верный. Его зовут $N."
C["The invisibility liquor is ready for you, $N."]="Настойка невидимости готова для тебя, $N."
C["Welcome to Honor Hold, $N. It's good to have you."]="Добро пожаловать в Оплот Чести, $N. Рады тебя видеть."
