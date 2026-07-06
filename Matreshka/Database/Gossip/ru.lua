-- Matreshka — внутриигровой русификатор WoW.
-- © 2026 MRAktiv. Все права защищены. Несанкционированное копирование и распространение запрещено.

-- Gossip (NPC dialogue) translations. Gossip has no client-side ID in TBC, so entries are keyed
-- by the English text the client shows, with runs of whitespace collapsed to single spaces and
-- case kept (the engine matches with the same normalization). Values keep their paragraph breaks.
-- Populated from the /mtscan corpus + machine translation.

Matreshka_Gossip = Matreshka_Gossip or {}
Matreshka_Gossip.ru = Matreshka_Gossip.ru or {}
local G = Matreshka_Gossip.ru

G["The Earthen are a synthesized race engineered by the Creators, functioning as one of the seed races in the initial population of the world designated as Azeroth. The Earthen were created to aid the Creators' efforts in shaping the deep regions of this world. They are a modification of the standard subterranean being matrix used on other worlds that the Creators have seeded. The construction of this prototype race created various anomalies that were observed after initial synthesis."] =
"Земельники — синтезированная раса, созданная Творцами и выполняющая роль одной из первичных рас при заселении мира, обозначенного как Азерот. Земельники были сотворены, чтобы помогать Творцам в формировании глубинных областей этого мира.\n\nОни представляют собой модификацию стандартной матрицы подземных существ, применявшейся на других мирах, засеянных Творцами. Создание этой прототипной расы породило различные аномалии, отмеченные после первичного синтеза."

G['What is a "subterranean being matrix"?'] = "Что такое «матрица подземных существ»?"

-- Stone Watcher of Norgannon (страж входа в Ульдум)
G["Salutations. I am a guardian of entry. Unless you have the Plates of Uldum already integrated with your disc set, I will not allow for entry into the Uldum compound."] =
"Приветствую. Я — страж входа. Пока Пластины Ульдума не встроены в твой набор дисков, я не позволю войти в комплекс Ульдума."

G["What function do you serve?"] = "Какую функцию ты выполняешь?"

G["My purpose is to regulate access to the Uldum complex for the Creators. I allow entry into the compound only when the solicitor exhibits for access the proper sequencing discs. Your disc set currently does not contain the Plates of Uldum, the primary prerequisite for entry. Access is not granted unless the Plates of Uldum are present."] =
"Моё предназначение — регулировать доступ к комплексу Ульдума от имени Творцов. Я пропускаю в комплекс лишь того, кто предъявляет для доступа надлежащие диски последовательности.\n\nТвой набор дисков сейчас не содержит Пластин Ульдума — главного условия для входа. Доступ не предоставляется, пока Пластины Ульдума отсутствуют."

G["What are the Plates of Uldum?"] = "Что такое Пластины Ульдума?"

G["The Plates of Uldum are discs synthesized by the Creators that allow access into the Uldum compound. These discs house and store specific data related to the Creators' activities here. Physically, they are nearly identical in circumference to the disc set you currently possess. Their markings, however, are directly related to information on Uldum as opposed to the Uldaman complex."] =
"Пластины Ульдума — диски, синтезированные Творцами, что открывают доступ в комплекс Ульдума. Эти диски хранят особые данные, связанные с деятельностью Творцов здесь.\n\nФизически они почти неотличимы по окружности от набора дисков, которым ты сейчас владеешь. Однако их знаки относятся к сведениям об Ульдуме, а не о комплексе Ульдамана."

G["Where are the Plates of Uldum?"] = "Где находятся Пластины Ульдума?"

G["Several sets of the Plates of Uldum have been synthesized by the Creators for their expressed use. The Creators control the distribution of said discs for all complexes on this world. As such, Azeroth has been rescheduled for visitation, and therefore future discs may enter circulation at that time. Existing discs have been fully distributed to those parties with appropriate security clearance."] =
"Несколько наборов Пластин Ульдума синтезированы Творцами для их прямого использования. Творцы управляют распределением этих дисков по всем комплексам этого мира. Так, Азерот был вновь внесён в расписание посещения, и потому новые диски могут поступить в обращение в этот срок.\n\nСуществующие диски полностью розданы сторонам с надлежащим уровнем допуска."

G["Excuse me? We've been \"rescheduled for visitation\"? What does that mean?!"] = "Прошу прощения. Нас «внесли в расписание посещения»? Что это значит?!"

G["The Creators use visitation as a means to reestablish control over seeded worlds when forces, both external and internal, upset the matrix dynamics associated with it. Such tactics are not to be taken lightly when executed by the Creators. For additional information on this world's scheduled visitation, please consult the appropriate data repository that fields all Creator-related scheduling considerations."] =
"Творцы прибегают к посещению, чтобы восстановить контроль над засеянными мирами, когда силы — внешние и внутренние — нарушают связанную с ними динамику матрицы. К таким мерам, исходящим от Творцов, не следует относиться легкомысленно.\n\nЗа дополнительными сведениями о запланированном посещении этого мира обратись к соответствующему хранилищу данных, ведающему всеми вопросами расписания Творцов."

G["So... what's inside Uldum?"] = "Так... что находится внутри Ульдума?"

G["Uldum is a research facility for the Creators in their continuing efforts to enhance the biosphere of Azeroth. Specific information regarding their work as it relates to Uldum is restricted to those individuals who possess the Plates of Uldum in their disc sets. Data repositories inside the Uldum complex have been programmed to address specific experiments and data compilations; please refer to them for detailed information."] =
"Ульдум — исследовательский комплекс Творцов, часть их непрерывных усилий по улучшению биосферы Азерота. Сведения об их работе, связанной с Ульдумом, доступны лишь тем, кто носит Пластины Ульдума в своих наборах дисков.\n\nХранилища данных внутри комплекса Ульдума запрограммированы на определённые эксперименты и своды данных; за подробностями обращайся к ним."

G["I will return when I have the Plates of Uldum."] = "Я вернусь, когда добуду Пластины Ульдума."
