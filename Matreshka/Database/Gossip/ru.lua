-- Matreshka — внутриигровой русификатор WoW.
-- © 2026 MRAktiv. Все права защищены. Несанкционированное копирование и распространение запрещено.

-- Gossip (NPC dialogue) translations. Gossip has no client-side ID in TBC, so entries are keyed
-- by the English text the client shows, with runs of whitespace collapsed to single spaces and
-- case kept (the engine matches with the same normalization). Values keep their paragraph breaks.
-- Populated from the /mtscan corpus.

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

-- Уцелевший у проклятых туннелей / «злого сада» (собрано сканером /mtscan)
G["This place... it's cursed. I barely managed to escape, and I cannot bear to go down through the tunnels again. My brother, and sisters though... They were not as fortunate. Trapped inside, they are feverish with the corrupted haze that flows from the evil garden growing there. Please, you must help."] =
"Это место... оно проклято. Мне едва удалось выбраться, и я не в силах снова спуститься в туннели. А мой брат и сёстры... им повезло меньше. Запертые внутри, они бредят в лихорадке от порчи, что расползается ядовитой дымкой из злого сада, разросшегося там. Умоляю, помоги!"

-- Реплики NPC (госсип), добавлено из отчёта /mtmissing
G["Please tell me more about Maraudon."] = "Расскажи мне подробнее о Мародоне."

G["Windsor was particularly ornery that day - and believe me, for Windsor, that's a monumental accomplishment. He kept telling me that 'something feels off.' Well he wasn't kidding! We were in the middle of Blackrock Mountain when the filthy animals attacked. I'm talking about the orcs, of course. Pay attention, will ya? All you could hear were grunts and the clanging of steel as they rushed us."] = "В тот день Виндзор был особенно не в духе — а поверь, для Виндзора это уже подвиг. Он всё твердил мне, что 'что-то тут неладно'. И ведь не шутил! Мы были в самом сердце Черной горы, когда на нас напали эти мерзкие твари. Я про орков, само собой. Слушай внимательно, а? Только и слышно было, как они рычат да лязгают сталью, бросаясь на нас."

G["If you are here to waste my time, then you are wasting the time of the Cenarion Circle as a whole. For your sake, let us hope that you are not foolish enough to be doing just that."] = "Если ты пришел тратить мое время, то тратишь время всего Круга Кенария. Ради твоего же блага понадеемся, что тебе не хватит глупости заниматься именно этим."

G["Welcome to the Explorer's League. If you need information, and it is in book form, then I might be able to help you out."] = "Добро пожаловать в Лигу исследователей. Если тебе нужны сведения и они изложены в книге, то я, возможно, сумею помочь."

G["Stable Master"] = "Конюший"

G["Unbelievable! How dare they??"] = "Невероятно! Да как они смеют??"

G["Mister, if I didn't know better, I'd think you were one of them 'special' peoples. We call em Troggs. Windsor didn't have no beef with the Dark Irons, after all, his great, great, grand pappy's best friend was a Dark Iron. Which is also probably why that army of Dark Irons didn't kill him on sight."] = "Мистер, не знай я тебя, решил бы, что ты из этих 'особенных' ребят. Мы их зовем трогги. У Виндзора-то не было счетов с кланом Черного Железа — как-никак, лучшим другом его пра-пра-прадеда был дворф Черного Железа. Потому, небось, та армия Черного Железа и не прикончила его на месте."

G["Warlock"] = "Чернокнижник"

G["What brings you to the Cenarion Circle, $N?"] = "Что привело тебя в Круг Кенария, $N?"

G["Continue please."] = "Продолжай, пожалуйста."

G["Return me to life."] = "Верни меня к жизни."

G["The Burning Steppes is a dangerous place, but scholars like me will do almost anything to advance our knowledge."] = "Пылающие степи — место опасное, но ученые вроде меня пойдут почти на что угодно ради новых знаний."

G["As a young night elf in Darkshore, I crossed paths with a group of unsavory individuals known as the Twilight's Hammer. A group of them befriended me and shamefully, I ended up eschewing my faith in Elune and embracing the vitriol of the Twilight's Hammer. It was not until a vision came to me from Elune, that I woke up from the malaise that I had fallen into as a follower of the old gods. In repentance, I began work on my prayer to Elune."] = "Юной ночной эльфийкой в Темных берегах я повстречала дурную компанию, известную как Молот Сумерек. Кое-кто из них втерся ко мне в доверие, и, к стыду своему, я отреклась от веры в Элуну и приняла злобу Молота Сумерек. Лишь когда ко мне снизошло видение от Элуны, я очнулась от того морока, в который впала, служа древним богам. В раскаянии я начала слагать свою молитву Элуне."

G["Thank you for your time, Lady Prestor."] = "Благодарю за уделенное время, леди Престор."

G["Battlemaster"] = "Мастер боя"

G["Auction House"] = "Аукцион"

G["You need to be exalted with the night elves of Darnassus before I will teach you a riding skill, shaman."] = "Тебе нужно достичь превознесения у ночных эльфов Дарнаса, прежде чем я обучу тебя верховой езде, шаман."

G["First Aid"] = "Первая помощь"

G["I welcome you, $N. And the Emerald Circle welcomes you. Hopefully together we can help rejuventate and protect this once-mighty forest. Many forces seek to destroy it from without... and within. Do not be persuaded by the power here--it will only corrupt you, like it has this entire land."] = "Приветствую тебя, $N. И Изумрудный Круг приветствует тебя. Будем надеяться, вместе мы сумеем возродить и защитить этот некогда могучий лес. Многие силы жаждут погубить его извне... и изнутри. Не поддавайся здешней мощи — она лишь развратит тебя, как развратила всю эту землю."

G["Touch the Suntara stone and call forth Lathoric the Black and his guardian, Obsidion."] = "Коснись камня Сантара и призови Латорика Черного и его стража, Обсидиона."

G["It is not yet your time. I shall aid your journey back to the realm of the living... for a price."] = "Твой час еще не пробил. Я помогу тебе вернуться в мир живых... за плату."

G["The Wildhammer dwarves might have fast steeds, but can those Aerie Peak gryphons stand the heat of The Great Forge? I think not!"] = "Может, у дворфов Дикого Молота и быстрые скакуны, да только выдержат ли грифоны Заоблачного пика жар Великой Кузни? Сомневаюсь!"

G["Aye, everyone wants to ride the tram, it's a real hoot and a half. Well, if ye want to find the tram, it's located over in Tinker Town just east of the gates of Ironforge."] = "Ага, все хотят прокатиться на поезде, забава что надо. Ну, коли ищешь поезд, так он в Городе механиков, к востоку от врат Стальгорна."

G["Yes..."] = "Да..."

G["Thank you for what you have done, $N. Keep the scepter safe; may it aid you in your toil against the evils that have invaded this place..."] = "Благодарю тебя за все, что ты сделал, $N. Береги скипетр; пусть он поможет тебе в борьбе со злом, что вторглось в это место..."

G["Vengeance shall be mine."] = "Отмщение будет за мной."

G["Class Trainer"] = "Наставник класса"

G["Need some supplies?"] = "Нужны припасы?"

G["Yer looking to learn how to use a new weapon are ye? Well, ye should be talking to Bixi or Buliwyf over at the Timberline Arms weapon shop then lad. They know their weapons from axes to... uh... zweihanders."] = "Хочешь научиться владеть новым оружием, а? Тогда тебе, парень, к Бикси или Буливифу в оружейную лавку «Тимберлайн». Уж они знают все об оружии — от топоров до... э-э... цвайхандеров."

G["Finally! Put some fingers in your ears, your brain mighta just grown five sizes and I'm worried it might leak out. So, the Dark Irons spared his life and took him prisoner. Their leader, some self-important, uppity fella named Thauris-something, took Ironfoe for himself. And that was the last I saw of ol' Windsor... *hic* 'scuse me."] = "Наконец-то! Заткни-ка уши пальцами, а то мозг твой, поди, вырос размеров на пять, и как бы не вытек. Так вот, дворфы Черного Железа пощадили его и взяли в плен. Их вожак, какой-то надутый спесивец по имени Таурис-как-его-там, забрал Погибель Железа себе. Таким я старину Виндзора и видел в последний раз... *ик* пардон."

G["Thorium Brotherhood or not, if one of them Dark Iron gets near to me they'll taste my mattock up the side of their head! Now, where can I send ya lad?"] = "Братство Тория там или нет, а если какой дворф Черного Железа сунется ко мне, отведает моей кирки по башке! Ну, куда тебя отправить, парень?"

G["Please explain how the scepter works."] = "Объясни, пожалуйста, как действует скипетр."

G["Died? Are you cracked, $N? Excuse me, Mister $N! Windsor wouldn't have died from no fifty orcs. As sure as Thelsamar blood sausage is the tastiest food the world may ever know, there he stood: He was covered in orc chunks from head to toe, drenched in about eighteen layers of their blood, but he was definitely alive... and really, really angry."] = "Помер? Ты чокнулся, $N? Простите, мистер $N! Виндзор не помер бы от каких-то полусотни орков. Верно как то, что кровяная колбаса из Тельсамара — вкуснейшая еда на свете: стоял он там, с ног до головы в ошметках орков, облитый слоев в восемнадцать их крови, но живехонек... и злой, ох какой злой."

G["We do not know. The Dark Irons that did survive made their way into the mountain and began rebuilding their city. From the ashes of Thaurissan then rose Blackrock Spire and the new Dark Iron nation. Additional fortifications were made within the Searing Gorge, in the area known as the Cauldron. Stories of an ancient evil that controlled the kingdom of Dark Irons began to circulate."] = "Мы не знаем. Уцелевшие дворфы Черного Железа ушли в гору и принялись отстраивать свой город. Из пепла Тауриссана поднялся Пик Черной горы и новый народ Черного Железа. В Тлеющем ущелье, в месте, что зовется Котлованом, возвели новые укрепления. Поползли слухи о древнем зле, что правило королевством Черного Железа."

G["Conspiracies abound, I say. There are those who lack vision in understanding what I do, and would seek to keep me shackled to obscurity! Don't step in the dirt."] = "Кругом заговоры, вот что я скажу. Есть те, кому не хватает прозорливости, чтобы понять мое дело, и они норовят держать меня в безвестности! Не наступи в грязь."

G["The bank? Oh, ye mean The Vault! No safer place to store yer valuables than The Vault. Ye'll find it just northeast of the entrance to Ironforge."] = "Банк? А, ты про Хранилище! Надежнее места для ценностей, чем Хранилище, не сыскать. Найдешь его к северо-востоку от входа в Стальгорн."

G["Only a fool would dare disturb me in my lair."] = "Лишь глупец осмелится потревожить меня в моем логове."

G["Um... sorry to bother you, but could I see Goodsteel's ledger again... if you're not using it."] = "Э-э... прости за беспокойство, но нельзя ли еще разок взглянуть на гроссбух Гудстила... если он тебе сейчас не нужен."

G["Dwarves don't get drunk, mister. I'm just a little sloppy. Anyhow, Windsor? I figure he's somewhere in Blackrock Depths. That's the Dark Iron city for you unedumecated peoples."] = "Дворфы не пьянеют, мистер. Я просто малость размяк. Ну так вот, Виндзор? Думаю, он где-то в Глубинах Черной горы. Это, для тебя, необразованный, город Черного Железа."

G["Greetings, $N. Have you come to learn of the history of Ironforge?"] = "Приветствую, $N. Ты пришел узнать историю Стальгорна?"

G["Where is the Auction House? Why it's right by the gates of Ironforge as you enter our fine city. Ye'll find it just across from The Vault."] = "Где аукцион? Да прямо у врат Стальгорна, как войдешь в наш славный город. Найдешь его напротив Хранилища."

G["Thanks, Ragged John. Your story was very uplifting and informative."] = "Спасибо, Рваный Джон. Твоя история была весьма воодушевляющей и поучительной."

G["Yesh, it'sh true, I'm blind as a bat! An' drunk as a ... err, drunk as shomething that getsh drunk. I'll tell you what, draenei. It'sh the drink that keeps me shenses sharp. It'sh common knowledge that when you lose a shense, yer other shenses become more alert. My drunk shense is incredible these days."] = "Дя, эт' правда, шлеп как крот! И пьян как... э-э, как что-то, что напиваетша. Вот что шкажу тебе, дреней. Именно выпивка держит мои чувштва в оштроте. Вшем ижвештно: коли лишишьша одного чувштва, оштальные обоштряютша. Мое чувштво хмеля нынче прошто невероятное."

G["The remains are covered in flies and maggots."] = "Останки покрыты мухами и червями."

G["Transcribe the tablet."] = "Переписать табличку."

G["So what did you do?"] = "И что же ты сделал?"

G["That is tragic. How did this happen?"] = "Какая трагедия. Как это произошло?"

G["I was standing right next to you, imbecile. I know what you seek."] = "Я стоял прямо рядом с тобой, болван. Я знаю, что ты ищешь."

G["Ye'll find the battlemasters around the war table in the Hall of Arms."] = "Мастеров боя найдешь у военного стола в Оружейном зале."

G["I need a ride."] = "Мне нужно средство передвижения."

G["What do ye need directions to?"] = "Куда тебе указать дорогу?"

G["Let me browse your goods."] = "Дай взглянуть на твои товары."

G["300? So the Dark Irons killed him and dragged him into the Depths?"] = "300? Значит, дворфы Черного Железа убили его и утащили в Глубины?"

G["Let me confer with my colleagues."] = "Дай мне посовещаться с коллегами."

G["Over in the Hall of Arms you can find our resident stable master, Ulbrek Firehand. He'll make sure any pets ye have are well fed and rightly cared for."] = "В Оружейном зале найдешь нашего конюшего, Ульбрека Огнерука. Он проследит, чтобы твои питомцы были сыты и ухожены."

G["Welcome to my Inn, weary traveler. What can I do for you?"] = "Добро пожаловать в мою таверну, усталый путник. Чем могу помочь?"

G["The Hippogryph is a noble beast, proud and swift. They are an honor to train, and can quickly take their rider a great distance."] = "Гиппогриф — благородный зверь, гордый и стремительный. Обучать их — честь, и они быстро унесут седока на дальние расстояния."

G["Your body looks worn and your spirit weary. Rest yourself beneath our roof and allow Elune to guide your dreams."] = "Твое тело измождено, а дух утомлен. Отдохни под нашим кровом и позволь Элуне направлять твои сны."

G["Burninate's the name, smithin's my game... and, erm... I sell a little food and water on the side. Care for some meat?"] = "Бернинейт — вот мое имя, кузнечное дело — мое ремесло... и, э-э... приторговываю немного едой да водой. Не желаешь ли мяса?"

G["I would like to check my deposit box."] = "Я хотел бы проверить свою ячейку."

G["I want to browse your goods."] = "Я хочу посмотреть твои товары."

G["As you can see, I am but one man with a lumbering oaf of a squire. The might of the Dark Iron dwarves and the beasts held in the grip of Ragnaros would surely overwhelm me alone, but I have the utmost confidence that such a brave and ambitious adventurer such as you would have no problem handling the denizens of the cauldron. Should you choose to assist me, I shall reward you with riches and wealth beyond your wildest dreams."] = "Как видишь, я всего лишь один человек, да неуклюжий увалень-оруженосец при мне. Мощь дворфов Черного Железа и тварей, что в лапах у Рагнароса, наверняка одолела бы меня одного, но я нисколько не сомневаюсь, что столь храбрый и честолюбивый искатель приключений, как ты, без труда управится с обитателями Котлована. Если решишь помочь мне, я вознагражу тебя богатствами, каких ты и во сне не видел."

G["Official business, John. I need some information about Marshal Windsor. Tell me about the last time you saw him."] = "Дело служебное, Джон. Мне нужны сведения о маршале Виндзоре. Расскажи, когда ты видел его в последний раз."

G["Profession Trainer"] = "Наставник профессии"

G["At last, I am free of the corruption that once bound me to this place..."] = "Наконец-то я свободен от порчи, что некогда приковала меня к этому месту..."

G["Tailoring"] = "Портняжное дело"

G["Begging your pardon, Lady Prestor. That was not my intent."] = "Прошу прощения, леди Престор. Я не желал ничего дурного."

G["Shaman"] = "Шаман"

G["Fishing"] = "Рыбная ловля"

G["Mage"] = "Маг"

G["Ok, so where the hell is he? Wait a minute! Are you drunk?"] = "Ладно, и где же он, черт возьми? Погоди-ка! Ты что, пьян?"

G["Engineering"] = "Инженерное дело"

G["Greetings, shaman - I'm a Commendation Officer acting on behalf of Ironforge. It is my duty to assist adventurers who have received Alliance Commendation Signets. I accept signets in different quantities, but the most beneficial exchange for you is to hand in a set of ten at once. I will enter your deeds into our records when you hand in your signets. As a result, you will earn recognition from Ironforge for your duty and service."] = "Приветствую, шаман. Я офицер по поощрениям от лица Стальгорна. Мой долг — помогать искателям приключений, получившим знаки отличия Альянса. Я принимаю знаки в любом количестве, но выгоднее всего сдавать сразу набор из десяти. Когда ты сдашь знаки, я внесу твои деяния в наши записи. Так ты заслужишь признание Стальгорна за свой долг и службу."

G["Let me think about it, Zamael."] = "Дай мне подумать, Замаэль."

G["Pardon the intrusion, Lady Prestor, but Highlord Bolvar suggested that I seek your advice."] = "Простите за вторжение, леди Престор, но верховный лорд Болвар посоветовал мне обратиться к вам за советом."

G["To maintain our link to the mainland, we have hippogryphs constantly flying between Rut'theran Village and Darkshore."] = "Чтобы поддерживать связь с большой землей, наши гиппогрифы постоянно летают между деревней Рутеран и Темными берегами."

G["What am I doing? Do you lack vision? I am a dreamer, good sir, and I dream of a better future for us all. Clearly, I am a visionary. There are those, however, who seek to keep us mired in banality. I told him that I was a dreamer, and Arch Druid Staghelm replied, \"Well, the world needs ditch diggers too.\" Until such time as the shackles of banality are ripped from us, I will help the Cenarion Circle by shuffling these piles of dirt around."] = "Что я делаю? Тебе недостает прозорливости? Я мечтатель, добрый господин, и я мечтаю о лучшем будущем для всех нас. Ясное дело, я провидец. Но есть те, кто желает держать нас в трясине обыденности. Я сказал ему, что я мечтатель, а верховный друид Оленья Грива ответил: \"Что ж, миру нужны и землекопы\". И покуда с нас не сорвут оковы обыденности, я буду помогать Кругу Кенария, перекапывая эти кучи земли."

G["Why would one pursue this path?"] = "Зачем кому-то идти этим путем?"

G["What are you doing out here?"] = "Что ты здесь делаешь?"

G["The blessings of Cenarius be yours, shaman. Our leader, Arch Druid Staghelm, guides us and all of Teldrassil to a renewed life!"] = "Да пребудет с тобой благословение Кенария, шаман. Наш предводитель, верховный друид Оленья Грива, ведет нас и весь Тельдрассил к обновленной жизни!"

G["The Inn? Ah, ye looking to toss back some of the best ales Ironforge has to offer? The Stonefire Tavern is where ye'll want to go. Ye'll find it just to the left of the entrance to Ironforge if ye be coming, or to the right if ye be going."] = "Таверна? А, хочешь пропустить кружечку лучшего эля в Стальгорне? Тогда тебе в таверну «Каменный огонь». Найдешь ее слева от входа в Стальгорн, коли идешь внутрь, или справа, коли выходишь."

G["Alas shaman, you are not considered to be exalted to Darnassus and the night elves of Teldrassil. Only when you prove yourself to us through deeds - not just mere words - will I then make available my selection of mounts for your perusal."] = "Увы, шаман, ты еще не превознесен у Дарнаса и ночных эльфов Тельдрассила. Лишь когда ты докажешь себя делами, а не пустыми словами, я открою тебе выбор скакунов."

G["Yeah, no problem, $N! Sorry... thought you were done with it already."] = "Да без проблем, $N! Извини... думал, ты уже закончил с этим."

G["Ahhh... Ironfoe."] = "Ах... Погибель Железа."

G["Hunter"] = "Охотник"

G["I am ready, Historian Archesonus."] = "Я готов, историк Архесонус."

G["So where was I? Oh yea, so the orcs rushed Windsor and Windsor, well, he didn't move an inch. He stood tall as they charged him, ten at a time. All I could see was the glow from Ironfoe and a lot of blood. This went on for hours, maybe days. I don't remember. Anyhow, FINALLY, it stopped."] = "Так на чем я? А, точно, орки бросились на Виндзора, а Виндзор — ну, он и с места не сдвинулся. Стоял как влитой, а они перли на него по десятку разом. Я только и видел, что сияние Погибели Железа да море крови. Так и длилось часами, а то и днями. Не упомню. В общем, НАКОНЕЦ, все стихло."

G["We need adventurers to assist us, $N. Will you help?"] = "Нам нужна помощь искателей приключений, $N. Ты поможешь?"

G["Blacksmithing"] = "Кузнечное дело"

G["The altar seems to beckon to you as if it were alive."] = "Алтарь словно манит тебя, будто живой."

G["Slow down! I was getting to that! So there he was, standing tall with all the blood and guts dripping off him when who shows up? The Dark Irons! Didn't you hear a word I said?? Well, the Dark Irons are a little craftier than those Blackrock orcs. They came prepared. By prepared I mean there were about 300 of em... *hic* 'scuse me."] = "Не гони! Я как раз к этому веду! Так вот, стоит он, весь в крови да кишках, и тут кто заявляется? Дворфы Черного Железа! Ты вообще слушал?? Так вот, Черное Железо похитрее тех орков Черной горы будет. Они пришли подготовленными. А под 'подготовленными' я разумею, что их было штук триста... *ик* пардон."

G["WHY is he in Blackrock Depths?"] = "ПОЧЕМУ он в Глубинах Черной горы?"

G["Herbalism"] = "Травничество"

G["... No."] = "... Нет."

G["So how did he die?"] = "Так как же он погиб?"

G["So that's how Windsor died..."] = "Значит, вот как погиб Виндзор..."

G["Interesting, continue please."] = "Любопытно, продолжай, пожалуйста."

G["Priest"] = "Жрец"

G["Of course not, dear boy. You 'adventurer' types are often victims of circumstance; subject to the political drama which tends to unfold between citizenry and royalty. My advice to you, then, is to seek out something else, more specifically: A new career. This world has enough heroes."] = "Разумеется, нет, милый мой. Вы, 'искатели приключений', частенько становитесь жертвами обстоятельств, заложниками политических дрязг между простолюдинами и знатью. Так что мой тебе совет — поищи себе иное занятие, а точнее: новое ремесло. Героев в этом мире и без того довольно."

G["Ah, nothing quite like a ride on a gryphon, is there? The night elves can keep those hippo's of theirs, just give me a gryphon and the wind in me hair! Well now, I won't keep ye any longer, just head over to Gryth Thurden on the east side of The Great Forge and he'll get ye on yer way."] = "Эх, ничто не сравнится с полетом на грифоне, верно? Пусть ночные эльфы оставят себе своих гиппогрифов — а мне подавай грифона да ветер в бороду! Ну, не буду тебя задерживать, ступай к Гриту Турдену на восточной стороне Великой Кузни, он тебя и отправит."

G["Mailbox"] = "Почтовый ящик"

G["Yep. You never heard of Ironfoe? The legendary orc slaying hammer? Yep, yep, that was ol' Windsor's hammer. He told me that Franclorn Forgewright himself made that hammer for his great, great, grand pappy. THE Franclorn Forgewright: The Dark Iron responsible for stonewrought archimetenc... building stuff. He also said the hammer had a twin that Franclorn kept for himself. Think he called it Ironfel or something."] = "Ага. Не слыхал про Погибель Железа? Легендарный молот, что разил орков? Да-да, это молот старины Виндзора. Он рассказывал, будто сам Франклорн Кузнедел выковал тот молот для его пра-пра-прадеда. ТОТ САМЫЙ Франклорн Кузнедел — дворф Черного Железа, что ведал каменным зодчеством... ну, строил всякое. Еще он говорил, у молота был близнец, который Франклорн оставил себе. Вроде звал его Айронфел или как-то так."

G["My father was slain by the filth that inhabits the cauldron. My pleas for assistance to the Stormwind magistrate fell on deaf ears. Nay, they want not to admit that this part of the world even exists, let alone send their precious military in to administer justice. I seek vengeance, draenei, plain and simple. Is there a more passionate cause in this world?"] = "Мой отец был убит мразью, что населяет Котлован. Мои мольбы о помощи к магистрату Штормграда остались без ответа. Нет, они и признавать-то не желают, что этот край вообще существует, не говоря уж о том, чтобы послать сюда свое драгоценное войско вершить правосудие. Я жажду мести, дреней, вот и все. Есть ли на свете дело более пылкое?"

G["Tell me what drives this vengeance?"] = "Расскажи, что движет этой жаждой мести?"

G["Weapons Trainer"] = "Наставник по оружию"

G["Rogue"] = "Разбойник"

G["We chose to leave the protection and comfort of the Depths to exploit... er, I mean... hrm, yes that's right, EXPLORE the world."] = "Мы решили покинуть защиту и уют Глубин, чтобы эксплуатировать... э-э, то есть... кхм, да, именно, ИССЛЕДОВАТЬ мир."

G["Start making sense, dwarf. I don't want to have anything to do with your cracker, your pappy, or any sort of 'discreditin.'"] = "Говори по делу, дворф. Знать не хочу ни про твоего сухаря, ни про твоего папашу, ни про какое там 'дискредитирование'."

G["Me versus fifty orcs? I'm no fool, $N. My pappy always told me, 'Discreditin is the better part of a cracker,' or something, and I knew what that meant."] = "Я против полусотни орков? Я не дурак, $N. Мой папаша всегда говаривал: 'Дискредитирование — лучшая часть сухаря', или как-то так, и я знал, что это значит."

G["What you be wanting? *hic*"] = "Чего тебе надобно? *ик*"

G["Hello?"] = "Эй?"

G["Deeprun Tram"] = "Подземный поезд"

G["I present you with proof of my deeds, Cyrus."] = "Я предъявляю тебе доказательство моих деяний, Сайрус."

G["Recently, the Dark Irons have been seen on the surface world with greater regularity. Fortresses have been built in the Badlands. Massive exploratory forces have been sent into the depths of Uldaman in search of ancient lore. They have even invaded our own homeland, striking at our dam near the loch."] = "В последнее время дворфов Черного Железа все чаще видят на поверхности. В Бесплодных землях выросли крепости. Огромные отряды разведчиков отправлены в глубины Ульдамана на поиски древних тайн. Они даже вторглись в нашу родину, ударив по нашей плотине у озера."

G["Which profession trainer would ye be looking for?"] = "Какого наставника профессии ты ищешь?"

G["Best deals in all of Stormwind my friend, won't find any better. Now, what can I help you with?"] = "Лучшие сделки во всем Штормграде, друг мой, лучше не сыщешь. Ну, чем могу помочь?"

G["I seek to chronicle the stories of those that have never known defeat. Those that carry within them a soul as strong as iron, undaunted and unbroken from their first steps to their last."] = "Я стремлюсь запечатлеть истории тех, кто не ведал поражений. Тех, кто несет в себе душу, крепкую как железо, — несломленную и неустрашимую от первых шагов до последних."

G["The symbols on the tablet are carefully transcribed..."] = "Символы на табличке тщательно переписаны..."

G["Welcome to the Bank of Stormwind. We offer financial accounts and safety deposit boxes for valuable items. Do you already have an account with us sir?"] = "Добро пожаловать в Банк Штормграда. Мы предлагаем денежные счета и ячейки для хранения ценностей. У вас уже есть у нас счет, сударь?"

G["As acting Taskmaster of this here compound, it is my duty to make sure that there is a certain level of tedium involved with all forms of business, work, rest, and relaxation that may take place here. If you find anything that you are asked to do to be too easy and hassle free, report to me immediately."] = "Как исполняющий обязанности надзирателя этого лагеря, я обязан следить, чтобы в любом деле, работе, отдыхе и досуге тут была изрядная доля занудства. Если тебе покажется, что порученное слишком легко и беспроблемно, немедля доложи мне."

G["The Inn"] = "Таверна"

G["Well now, ye'll need papers to form a guild, and Jondor Steelbrow can help you get started with the process. He can be found over at the Ironforge Visitor's Center when yer ready to get started."] = "Ну что ж, чтобы основать гильдию, тебе понадобятся бумаги, а начать дело поможет Жондор Стальнобровый. Найдешь его в Центре для приезжих Стальгорна, как будешь готов."

G["These once beautiful woods suffer under a terrible curse! Corrupting forces twist the life here into shadows of their former selves. If you are not an agent of this corruption, then perhaps you can aid me in reclaiming Felwood!"] = "Этот некогда прекрасный лес страдает под гнетом ужасного проклятия! Оскверняющие силы обращают все живое здесь в бледные тени былого. Если ты не пособник этой скверны, то, быть может, поможешь мне вернуть Оскверненный лес!"

G["Make this inn your home."] = "Сделать эту таверну своим домом."

G["Gryphon Master"] = "Укротитель грифонов"

G["Elune be with you, shaman."] = "Да пребудет с тобой Элуна, шаман."

G["Which class trainer might ye be looking for?"] = "Какого наставника класса ты ищешь?"

G["I need no home to know I still have a place in this world, shaman. The tribes will see... all of them. They fight amongst one another, and for what? Scraps left over by vultures... lands infested by the Legion... bah! The centaur should be proud of their heritage--it is just as noble as any Night elf's or orc's--it is time we started acting like it!"] = "Мне не нужен дом, чтобы знать, что в этом мире мне еще есть место, шаман. Племена еще увидят... все они. Они грызутся меж собой, и ради чего? Ради объедков со стола стервятников... ради земель, кишащих Легионом... тьфу! Кентавры должны гордиться своим наследием — оно ничуть не менее благородно, чем у любого ночного эльфа или орка, — и пора уже вести себя подобающе!"

G["Guild Master"] = "Мастер гильдии"

G["Mining"] = "Горное дело"

G["Alchemy"] = "Алхимия"

G["Of course I will help!"] = "Конечно, я помогу!"

G["Show me where I can fly."] = "Покажи, куда я могу улететь."

G["No one's ever stolen anything out of here. Not in the whole history of... the whole history!"] = "Отсюда еще никто ничего не крал. За всю историю... за всю историю, вот!"

G["I do not pretend to fully grasp their motivations. There is no reward for a life of such hardship. Perhaps that is what makes them so fascinating, and so admirable. Are you one such soul of iron?"] = "Не стану притворяться, что до конца понимаю, что ими движет. Жизнь, полная таких лишений, не сулит наград. Быть может, именно это и делает их столь занятными и достойными восхищения. Не из таких ли ты железных душ?"

G["I wish to browse your wares."] = "Я хочу осмотреть твой товар."

G["Mark my words! You won't find faster gryphons anywhere in the Eastern Kingdoms than the ones right here in Thelsamar!"] = "Попомни мои слова! Быстрее грифонов, чем здесь, в Тельсамаре, во всех Восточных королевствах не сыскать!"

G["<Lady Prestor glares at you.>"] = "<Леди Престор гневно смотрит на тебя.>"

G["Amazing, aren't they? All these artifacts and remains. I'm not sure what I'm more impressed by, their size, or the stories that go along with them. There's so much to study and learn. And the connections we can make... Did you know rumor has it that many races have the same heritage as Night elves?"] = "Поразительно, не правда ли? Все эти артефакты и останки. Даже не знаю, что впечатляет меня больше — их размеры или истории, что с ними связаны. Столько всего можно изучить и постичь. А какие связи мы способны обнаружить... Знаешь ли ты, что, по слухам, многие расы имеют то же происхождение, что и ночные эльфы?"

G["Please continue, Zamael."] = "Продолжай, пожалуйста, Замаэль."

G["Praise Elune! It has been many years since I have had visitors."] = "Хвала Элуне! Много лет ко мне не заглядывали гости."

G["Cooking"] = "Кулинария"

G["Where is it ye would like to go lad? For just a few coin my Gryphons can get ye there faster than even the swiftest horse."] = "Куда путь держишь, парень? Всего за пару монет мои грифоны домчат тебя быстрее самого резвого скакуна."

G["Interesting... continue, John."] = "Любопытно... продолжай, Джон."

G["When Lolo doesn't wanna spill any o' his precious ale or get his lil' dress dirty, I'm called in. Yep. Ol' Hansel is the dwarf they use to mete out a lil' bit o' justice an' a whole lotta pain."] = "Когда Лоло не желает расплескать свой драгоценный эль или запачкать свое платьице, зовут меня. Ага. Старина Гансель — тот самый дворф, которого пускают в ход, чтоб отвесить малость правосудия и целую гору боли."

G["You seek to lower our global defenses in order to appease a paranoid magistrate and an encampment of riff-raff that are most probably suffering from heat stroke."] = "Ты хочешь ослабить нашу общую оборону, лишь бы ублажить параноика-магистрата и лагерь всякого сброда, что, вернее всего, страдает от солнечного удара."

G["Enchanting"] = "Наложение чар"

G["Etched into a tablet of pure gold was the embodiment of my remorse, shame, regret, and sorrow. Unfortunately, the Twilight's Hammer found the tablet and branded me a blasphemer. I was summarily executed, my prayer to Elune incomplete. I am now bound to this world as a spirit, unable to transcend to the Nether; held in this cage as a warning to all that would betray the faith of the Twilight's Hammer."] = "На табличке из чистого золота было запечатлено воплощение моего раскаяния, стыда, сожаления и скорби. К несчастью, Молот Сумерек отыскал табличку и заклеймил меня богохульницей. Меня казнили без суда, а моя молитва Элуне так и осталась незавершенной. Теперь я привязана к этому миру как дух, неспособный уйти в Круговерть Пустоты; заперта в этой клетке в назидание всем, кто вздумает предать веру Молота Сумерек."

G["Notify me when you are ready to listen to the story."] = "Дай мне знать, когда будешь готов выслушать историю."

G["Warrior"] = "Воин"

G["Paladin"] = "Паладин"

G["Skinning"] = "Снятие шкур"

G["I wish to hear your tale."] = "Я хочу услышать твой рассказ."

G["Why do you keep saying he died? Who told you he died? I never said he died. He went missing is all. You see, apparently we had gotten into the middle of some big orc versus Dark Iron dwarf battle. The orcs, being the filthy, miserable curs that they are, were out early, setting up some traps and other diabolical things you probably wouldn't understand."] = "Чего ты заладил, что он помер? Кто тебе сказал, что он помер? Я не говорил, что он помер. Он попросту пропал, вот и все. Понимаешь, угодили мы, видать, в самую гущу большой драки между орками и дворфами Черного Железа. Орки, паскудные жалкие псины, встали спозаранку, расставляя ловушки да прочие дьявольские штуки, каких тебе, поди, и не понять."

G["Velarok, I have misplaced my torch. I require another."] = "Веларок, я потерял свой факел. Мне нужен другой."

G["Leatherworking"] = "Кожевничество"

G["Fill yer tankard and pull up a chair. We've stories to tell and kegs to empty."] = "Наполняй кружку да придвигай стул. У нас есть байки, что рассказать, и бочонки, что опустошить."

G["My apologies, Lady Prestor."] = "Мои извинения, леди Престор."

G["Ironfoe?"] = "Погибель Железа?"

G["You can find a mailbox right o'er by The Stonefire Tavern. It's just north of the gates of Ironforge."] = "Почтовый ящик найдешь прямо у таверны «Каменный огонь». Это к северу от врат Стальгорна."

G["What want from Raze??"] = "Чего надо от Рейза??"

G["Hundreds of years ago, the great city of Thaurissan stood proudly in a lush expanse of land that is now the dilapidated Burning Steppes. Thaurissan was home to the nation of Dark Iron dwarves and at the time, in the midst of a civil war among the dwarven nation at large. You see, that area of the world was at one point in time part of the Redridge Mountains - until the day that Thaurissan was consumed by a gigantic explosion. The city lay in ruin, the surrounding areas reduced to an ashy wasteland."] = "Сотни лет назад великий город Тауриссан гордо высился среди цветущих просторов, что ныне обратились в разоренные Пылающие степи. Тауриссан был домом народа дворфов Черного Железа, тогда как раз охваченного гражданской войной, что раздирала весь дворфийский народ. Видишь ли, этот край когда-то был частью Красногорья — до того дня, когда Тауриссан поглотил чудовищный взрыв. Город обратился в руины, а окрестные земли — в пепельную пустошь."

G["I live only to serve the master."] = "Я живу лишь для того, чтобы служить хозяину."

G["Bank of Ironforge"] = "Банк Стальгорна"

G["Where would you like to fly to?"] = "Куда ты хочешь отправиться?"

-- Реплики NPC (госсип): Ун'Горо, Древобрюхи, Угрюмый обжора, Дарнас, Оскверненный лес
G["Welcome to the Grim Guzzler!"] = "Добро пожаловать в «Угрюмый обжора»!"

G["The Crystal Pylons of Un'Goro are a mystery to all. To the few inhabitants here, they are a source of legend, with much speculation as to their purpose."] = "Кристаллические пилоны Ун'Горо — загадка для всех. Для немногих здешних обитателей они предмет легенд, и об их назначении ходит немало догадок."

G["You've come further than many, $N. Respect the elements around you and you shall fare far greater than most."] = "Ты зашел дальше многих, $N. Чти окружающие тебя стихии — и преуспеешь куда больше прочих."

G["Another material boy are we? Well, if you are obsessed with your precious items then you will probably want to store them at the Darnassus Bank in the center of our city."] = "Снова гонишься за вещами? Что ж, если ты одержим своими драгоценными пожитками, то, верно, захочешь хранить их в Банке Дарнаса, в центре нашего города."

G["What a wonderful day to be alive! Look at the beauty that surrounds you, friend. Enjoy what life has to give!"] = "Какой чудесный день, чтобы жить! Взгляни на красоту вокруг, друг. Наслаждайся тем, что дарит жизнь!"

G["Here among the craftsmen of Darnassus, there is a millenium of knowledge for the benefit of your chosen craft. Now tell me, which craft do you find the most intriguing?"] = "Здесь, среди мастеров Дарнаса, собрано тысячелетие знаний на благо избранного тобой ремесла. Так скажи, какое ремесло тебя больше всего занимает?"

G["Now where was I? I yeah... So I said to her, \"But I need you! I need you!\"... and she just laughed and slithered away! It's the honest truth, $N. Naga can be so cruel!"] = "Так на чем я? А, да... Вот я и говорю ей: \"Но ты мне нужна! Ты мне нужна!\"... а она лишь рассмеялась и уползла прочь! Чистая правда, $N. Наги бывают так жестоки!"

G["Listen, you tell Schweitzer and Roitau that we've got everything under control here. They don't gotta... what? They didn't send you? Then what are you wasting my time for? I've got work to do!"] = "Слушай, передай Швейцеру и Ройто, что у нас тут все под контролем. Им не нужно... что? Они тебя не посылали? Тогда чего ты тратишь мое время? У меня дел по горло!"

G["Teach me how to create and apply a Heavy Mageweave Bandage, Doctor."] = "Научи меня делать и накладывать плотную повязку из магической ткани, доктор."

G["Come in, come in. Just don't sit too close to the stove. It hasn't exploded yet today, but just to be safe I think you should sit elsewhere."] = "Заходи, заходи. Только не садись слишком близко к печи. Сегодня она еще не взрывалась, но на всякий случай сядь-ка лучше подальше."

G["We Timbermaw can grant you safe passage through the hold, however, you must prove yourself worthy of our aid."] = "Мы, Древобрюхи, можем даровать тебе безопасный проход через Логово, однако сперва ты должен доказать, что достоин нашей помощи."

G["The fabric of which our world is woven is most delicate. It merely takes some knowledge and the application of said knowledge to tear the fabric. It is thusly that rifts are born."] = "Ткань, из которой соткан наш мир, весьма хрупка. Довольно лишь знания и его применения, чтобы разорвать эту ткань. Так и рождаются разломы."

G["Well, now that you mention it, yeah, I did see something I thought was a little strange yesterday afternoon! I was running past some old troll ruins southeast of here; well, I wasn't really running, more like hopping... The sand's so hot! Anyway, so I was hopping past the ruins, when I noticed a camp set up there. Seems like a funny place to set up camp, if you ask me... I would have poked around a little more but one of those crazy big vultures chased me off."] = "Ну, раз уж ты об этом, то да — вчера днем я и впрямь видел кое-что странное! Бежал я мимо старых тролльих руин к юго-востоку отсюда; ну, не то чтобы бежал, скорее скакал... Песок такой горячий! В общем, скакал я мимо руин и вдруг заметил там разбитый лагерь. По мне, так странное местечко для лагеря... Я бы поразнюхал побольше, да один из этих здоровенных грифов-падальщиков меня прогнал."

G["Oh, hello there! I'm Hol'anyee, the chief scientist and biologist of Marshal Expeditions. My brother and I, along with our companions, travel Azeroth exploring the wild and untamed majesty. It is exciting... but, um... I think we got ourselves into a little too much excitement this time!"] = "О, привет! Я Хол'аньи, главный ученый и биолог Экспедиции Маршала. Мы с братом и наши спутники странствуем по Азероту, исследуя дикое и необузданное великолепие. Это увлекательно... но, э-э... кажется, на сей раз мы влипли в чуть больше приключений, чем следовало!"

G["What about the Winterfall furbolg?"] = "А что насчет фурболгов Зимней Спячки?"

G["Hail friend - a moment of your time, if I may... We have endured much in our trials and tribulations in establishing Teldrassil. Were the constant strife of the times not enough, we now find ourselves in a dire shortage of cloth. If you have the materials to spare, I ask that you please donate them. You certainly would earn the gratitude of night elves everywhere in helping us out!"] = "Приветствую, друг, — удели мне минутку, если можно... Немало испытаний выпало нам, пока мы устраивали Тельдрассил. Мало нам было вечных невзгод тех времен — теперь мы еще и терпим острую нехватку ткани. Если у тебя есть лишние материалы, прошу, пожертвуй их. Ты наверняка заслужишь благодарность ночных эльфов повсюду, если поможешь нам!"

G["Needlework requires a steady hand. And patience... above all, patience."] = "Шитье требует твердой руки. И терпения... а превыше всего — терпения."

G["I want to examine this pylon."] = "Я хочу осмотреть этот пилон."

G["Ah, draenei... I possess great knowledge a' da world and how ta create charms a' great power."] = "А, дреней... Я владею великими знаниями о мире и о том, как создавать талисманы великой силы."

G["The Bank"] = "Банк"

G["May I help you taste?"] = "Можно, я помогу тебе с дегустацией?"

G["Have a drink, shaman. It might be your last!"] = "Выпей, шаман. Возможно, это твоя последняя чарка!"

G["In need of some alchemy supplies, are we? Or do you have other business with me?"] = "Нужны реагенты для алхимии? Или у тебя ко мне иное дело?"

G["What plants are in Felwood that might be corrupted?"] = "Какие растения в Оскверненном лесу могут быть поражены порчей?"

G["Hippogryph Master"] = "Укротитель гиппогрифов"

G["I need a Cenarion beacon."] = "Мне нужен Кенарийский маяк."

G["I just can't seem to get comfortable without a sturdy ceiling of granite over my head. All these stars up there, enough to give ye the shivers."] = "Никак не могу устроиться поудобнее без крепкого гранитного потолка над головой. Все эти звезды наверху — аж дрожь пробирает."

G["Oh... I'm feeling groggy..."] = "Ох... что-то меня развезло..."

G["Let's taste more!"] = "Давай еще продегустируем!"

G["Back off or I'll cut you in half."] = "Отвали, не то разрублю надвое."

G["A closer inspection of the pylon leads you to find a small table containing red, blue, and green crystals arranged in what seems like a specific formation. A large red circle of crystals is flanked on either side by a smaller circle of blue crystals and another of green crystals. You carefully take note of the colors of the crystals, knowing that J.D. would be very interested in hearing about what you have found."] = "Приглядевшись к пилону, ты находишь небольшой стол с красными, синими и зелеными кристаллами, выложенными в некоем определенном порядке. Большой круг из красных кристаллов окружен с двух сторон меньшим кругом синих и еще одним — зеленых. Ты внимательно запоминаешь цвета кристаллов, зная, что Дж.Д. будет весьма любопытно услышать о твоей находке."

G["Hello there! My name's Jenna! And you?"] = "Привет! Меня зовут Дженна! А тебя?"

G["If Hydraxis recruits more in his war, then it might shift the balance of power..."] = "Если Гидраксис наберет в свою войну еще больше воинов, это может сместить равновесие сил..."

G["It is true I have skills to teach to those who are worthy. Would that be you?"] = "Верно, у меня есть чему поучить тех, кто достоин. Не ты ли это?"

G["I don't care to hear it, $N. Nope, no way are you going to be let into the Searing Gorge. Impossible. Not going to happen. How many times do I have to tell you - I can't let you in! Do you not speak common? Are you an orc in disguise? N-O. NO! If I let you in, then I have to let everybody in. Pretty soon your close friends will want in, then their distant relatives, then their friends, and so on and so forth. The last time that happened... well, we won't talk about the last time it happened."] = "И слышать не желаю, $N. Нет, ни за что я не пущу тебя в Тлеющее ущелье. Невозможно. Не бывать этому. Сколько раз повторять — не могу я тебя пустить! Ты общего языка не понимаешь? Может, ты орк в личине? Н-Е-Т. НЕТ! Пущу тебя — придется пускать всех. Не успеешь оглянуться, как твои закадычные друзья попросятся внутрь, потом их дальняя родня, потом их друзья, и так далее, и тому подобное. В прошлый раз, когда такое случилось... ну, о прошлом разе мы говорить не будем."

G["Hello, $N. I train and care for young hippogryphs here; feel free to have a look around."] = "Здравствуй, $N. Я здесь обучаю молодых гиппогрифов и забочусь о них; осмотрись, не стесняйся."

G["You probably weren't expecting to find me in this cave, were you? My name's J.D., and I really can't tell you much about how I got here, but what I can tell you is that this cave is my home now! I spend my time studying the strange crystals that can be found all over the crater."] = "Ты, верно, не ожидал застать меня в этой пещере, а? Меня зовут Дж.Д., и я мало что могу поведать о том, как сюда попал, но вот что скажу точно: теперь эта пещера — мой дом! Все время я изучаю диковинные кристаллы, что рассыпаны по всему кратеру."

G["Cheers!"] = "Будем здоровы!"

G["I think Plugger filled one of his kegs too much. It looks like it's about to blow!"] = "Сдается мне, Плаггер перелил один из своих бочонков. Того и гляди рванет!"

G["Don't bother me, shaman! I have two whole cauldrons of bubbling brew here and I must ensure they taste just right! If they don't, then Master Coren Direbrew will flay and boil me!"] = "Не мешай мне, шаман! У меня тут два полных котла бурлящего варева, и я должен проследить, чтобы вкус был в самый раз! Иначе мастер Корен Мрачновар сдерет с меня шкуру и сварит заживо!"

G["Welcome to the refuge, $N. Some come here with a purpose, others found their way here by accident... But everyone here seems to have a unique story to tell."] = "Добро пожаловать в убежище, $N. Одни приходят сюда с целью, другие попадают случайно... но у каждого здесь найдется своя особенная история."

G["Train me."] = "Обучи меня."

G["A closer inspection of the pylon leads you to find a small table containing blue, yellow, and green crystals arranged in what seems like a specific formation. A large blue circle of crystals is flanked on either side by a smaller circle of yellow crystals and another of green crystals. You carefully take note of the colors of the crystals, knowing that J.D. would be very interested in hearing about what you have found."] = "Приглядевшись к пилону, ты находишь небольшой стол с синими, желтыми и зелеными кристаллами, выложенными в некоем определенном порядке. Большой круг из синих кристаллов окружен с двух сторон меньшим кругом желтых и еще одним — зеленых. Ты внимательно запоминаешь цвета кристаллов, зная, что Дж.Д. будет весьма любопытно услышать о твоей находке."

G["Don't get too close, $N. I'm liable to fumble and bash your brains open with the face of my hammer."] = "Не подходи слишком близко, $N. Того и гляди оступлюсь и вышибу тебе мозги обухом своего молота."

G["How can I prove myself to the Timbermaw furbolg?"] = "Как мне доказать себя фурболгам Древобрюхам?"

G["Look at these samples! What does it mean? What does it mean? I'm going to need time, time to look at all this information. And I'll need more information. Information I can't get... damn! Think, Laris, think! What are you going to do? What?! There has to be a solution!"] = "Взгляни на эти образцы! Что это значит? Что это значит?! Мне нужно время, время, чтобы во всем этом разобраться. И понадобится больше сведений. Сведений, которых мне не достать... проклятье! Думай, Ларис, думай! Что же ты будешь делать? Что?! Должно же быть решение!"

G["Of all the wondrous places within Darnassus, which would you have me direct you to?"] = "Из всех дивных уголков Дарнаса, к какому тебя направить?"

G["You've already done me a great service, $N. For that I thank you. The least I can do now is tell you what brought me here: My long time friend Trey Lightforge and I came to Jaedenar to investigate the Shadow Council when they caught us unprepared. They took Trey deeper into Shadow Hold and put me in here after taking all of our equipment... I can still hear his screams from below, $N. They were... inhuman. I don't know what they've done to him, but they will pay for it."] = "Ты уже оказал мне великую услугу, $N. За это благодарю тебя. Меньшее, что я могу теперь сделать, — рассказать, что привело меня сюда: мы с моим давним другом Треем Лайтфорджем прибыли в Джеденар, чтобы разведать о Совете Теней, и они застигли нас врасплох. Трея утащили глубже, в Оплот Теней, а меня бросили сюда, отобрав все наше снаряжение... Я до сих пор слышу его крики снизу, $N. Они были... нечеловеческими. Не знаю, что они с ним сделали, но они за это заплатят."

G["It is good to see you again, Doctor $N. I have been following your progress and I dare say that it is time you learned some of the more advanced bandaging techniques. Return to me from time to time, as your skill advances, and I shall teach you all that I know."] = "Рад снова видеть тебя, доктор $N. Я следил за твоими успехами и осмелюсь сказать, что тебе пора освоить более сложные приемы перевязки. Захаживай ко мне время от времени, по мере роста твоего мастерства, и я научу тебя всему, что знаю сам."

G["So cold... and hungry. My poor friend, I hope you've found peace. I can't stand to think about what they could have done to you. You! You there! Please, you have to help me escape. One of them has a key, can you find it? I know they have it. If you get it, you can help me get out of here. Trey is probably already dead, but there's still time! Please, can you help me?"] = "Так холодно... и голодно. Бедный мой друг, надеюсь, ты обрел покой. Мне невыносимо думать, что они могли с тобой сотворить. Эй! Эй, ты! Прошу, ты должен помочь мне бежать. У одного из них есть ключ — сможешь его найти? Я знаю, он у них. Раздобудешь его — поможешь мне выбраться. Трей, наверное, уже мертв, но время еще есть! Прошу, ты поможешь мне?"

G["Hello, shaman. I am Jessir Moonbow. I have come from Darnassus seeking two friends who came looking for signs of the Shadow Council in Felwood. It seems those vile creatures who claim responsibility for much of the orcish race's suffering seeks to regain some of its power. My two friends went looking in Jaedenar to prove one way or the other what was happening. I expected them to be here when I arrived, but now they are days late."] = "Здравствуй, шаман. Я Джессир Лунный Лук. Я пришла из Дарнаса в поисках двух друзей, что отправились искать следы Совета Теней в Оскверненном лесу. Похоже, эти мерзкие твари, повинные во многих страданиях народа орков, стремятся вернуть себе часть былой мощи. Мои двое друзей пошли в Джеденар, чтобы выяснить, так это или нет. Я ждала застать их здесь по прибытии, но они запаздывают уже на несколько дней."

G["The Winterfall furbolg that reside here in Winterspring were once our allies... But one day, that all changed. Driven by the strange demands of their high chief, they began to attack all others that they came in contact with, including our tribe. They keep to themselves now..."] = "Фурболги Зимней Спячки, что живут здесь, в Зимних Ключах, некогда были нашими союзниками... Но однажды все переменилось. Повинуясь странным велениям своего верховного вождя, они принялись нападать на всех, кто попадался им на пути, включая и наше племя. Теперь они держатся особняком..."

G["A closer inspection of the pylon leads you to find a small table containing yellow, red, and green crystals arranged in what seems like a specific formation. A large yellow circle of crystals is flanked on either side by a smaller circle of red crystals and another of green crystals. You carefully take note of the colors of the crystals, knowing that J.D. would be very interested in hearing about what you have found."] = "Приглядевшись к пилону, ты находишь небольшой стол с желтыми, красными и зелеными кристаллами, выложенными в некоем определенном порядке. Большой круг из желтых кристаллов окружен с двух сторон меньшим кругом красных и еще одним — зеленых. Ты внимательно запоминаешь цвета кристаллов, зная, что Дж.Д. будет весьма любопытно услышать о твоей находке."

G["I am Kilram, master of the axe."] = "Я Килрам, мастер топора."

G["Living out here in the desert is rough! I get so thirsty standing outside in this heat."] = "Житье тут, в пустыне, суровое! Так пить хочется, пока стоишь на этакой жаре."

G["The Thorium Brotherhood does not waste time on ants. Be gone!"] = "Братство Тория не тратит время на муравьев. Прочь!"

G["Invention, my dear shaman, is two percent bottled inspiration, four percent solar exposure, six percent chance of thunderstorms clearing by mid-afternoon, and ninety-three percent Rumplesnicker. Wait, did that add to one hundred? I've got my notes around here somewhere."] = "Изобретательство, дорогой мой шаман, — это два процента вдохновения из бутылки, четыре процента солнечных ванн, шесть процентов вероятности, что грозы разойдутся к середине дня, и девяносто три процента Рамплсникера. Стой, это в сумме сто вышло? Где-то тут у меня записи..."

G["I have just completed a new dimensional imploder that will make me rich beyond my wildest goblin dreams! All I need to do is get a skilled Goblin Engineer to build a dimensional ripper that connects to it and try it!"] = "Я только что завершил новый пространственный имплодер, который сделает меня богаче самых смелых гоблинских грез! Осталось лишь найти умелого гоблина-инженера, чтобы тот собрал пространственный потрошитель, который к нему подключается, и опробовать это!"

G["Greetings, my friend. May the Dawn keep you well in these troubled times."] = "Приветствую, друг мой. Да хранит тебя Рассвет в эти смутные времена."

G["Druids are very sensitive to the plight of all creatures of the world. When it was found that these birds were in danger, we set up a system of rescuing them from the corruption of Feralas. A gnome named Curgle Cranklehop leads the affair; she collects the eggs and has them sent here, where I care for them. We could always use more help for our cause, $N. Maybe you should head over to Gadgetzan and look for Curgle."] = "Друиды весьма чутки к бедам всех созданий этого мира. Когда выяснилось, что этим птицам грозит опасность, мы наладили спасение их от порчи Фераласа. Всем заправляет гномиха по имени Кургл Кранклхоп; она собирает яйца и присылает их сюда, где я о них забочусь. Нам всегда пригодится помощь в нашем деле, $N. Может, тебе стоит наведаться в Прибамбасск и разыскать Кургл."

G["Seen any strange things in the desert lately?"] = "Не видал ли ты в пустыне в последнее время чего странного?"

G["If it weren't for the Grim Guzzler, I'd spend my free time pulling the wings off dragon whelps."] = "Если бы не «Угрюмый обжора», я бы на досуге отрывал крылья дракончикам."

G["Hello! What brings you to Winterspring? These cold and vast lands may seem dismal, but this is a place of many secrets..."] = "Здравствуй! Что привело тебя в Зимние Ключи? Эти холодные необъятные земли могут показаться унылыми, но здесь таится немало секретов..."

G["May Elune walk with you, shaman. The Temple of the Moon has come to help the troubled citizens of Auberdine."] = "Да пребудет с тобой Элуна, шаман. Храм Луны пришел на помощь измученным жителям Обердина."

G["Vesprystus' hippogryphs will bear you swiftly to your destination. Seek him out in Rut'theran Village, through the portal which lies in the western section of Darnassus."] = "Гиппогрифы Веспристуса стремительно доставят тебя к цели. Разыщи его в деревне Рутеран — через портал в западной части Дарнаса."

G["Yes sir, this is quite a drink! Quite a drink indeed!"] = "Да, сударь, вот это выпивка! Выпивка что надо!"

G["Let's sing a song! Brew, brawl, Brew, brawl! A Dark Iron's life for me! Hah hah! $N, I like you!"] = "Давай споем! Пей да дерись, пей да дерись! Жизнь Черного Железа по мне! Ха-ха! $N, ты мне нравишься!"

G["Years of quality breeding techniques and plenty of care allow me the privilege of showing you these horses! Please, take your time as you consider them for your mount. A horse is a companion for the ages, friend. Don't sell yourself short - get your steed here today!"] = "Годы отменного разведения да немало заботы дают мне честь показать тебе этих коней! Прошу, не спеши, приглядись к ним как к будущему скакуну. Конь — спутник на века, друг. Не продешеви — обзаведись своим скакуном уже сегодня!"

G["Another drink!"] = "Еще по одной!"

G["This is good stuff! But it's a little weak. I think I'll add a more garlic breath to it..."] = "Хорошее пойло! Но слабовато. Пожалуй, добавлю-ка побольше чесночного духу..."

G["We may have been suffering a drought but there's no shortage of meat! Care to browse my goods?"] = "Может, у нас тут и засуха, да только мяса в достатке! Не желаешь взглянуть на мой товар?"

G["Not bad, not bad... But it's missing spice! How about adding scorpid venom? Yes! That'll fix it right up!"] = "Недурно, недурно... Но пряности не хватает! Как насчет яда скорпида? Да! Вот это его и поправит!"

G["I would like to buy from you."] = "Я хотел бы у тебя купить."

G["My master, Plugger Spazzring, is a good boss. And he makes a lot of money. His pockets are bursting!"] = "Мой хозяин, Плаггер Спаззринг, — славный начальник. И денег гребет немало. Карманы у него так и трещат!"

G["What do you think of Dadanga?"] = "Что ты думаешь о Даданге?"

G["Hello stranger, and welcome to the untamed majesty of Un'Goro Crater! My name is Williden Marshal. My sister, our companions, and I make up Marshal Expeditions - scientists and explorers of Azeroth's wild and great unknown. We've hit a bit of a rough patch here, and we're looking for some help if you have the time!"] = "Здравствуй, чужак, и добро пожаловать в необузданное великолепие кратера Ун'Горо! Меня зовут Виллиден Маршал. Я, моя сестра и наши спутники составляем Экспедицию Маршала — ученые и исследователи дикого и великого неизведанного Азерота. Мы тут малость попали в переплет и ищем помощи, если у тебя найдется время!"

G["Welcome to the Bank of Darnassus. We offer financial accounts and safety deposit boxes for valuable items. Do you already have an account with us sir?"] = "Добро пожаловать в Банк Дарнаса. Мы предлагаем денежные счета и ячейки для хранения ценностей. У вас уже есть у нас счет, сударь?"

G["<You cannot comprehend any of the technical mumbo jumbo on this scroll.>"] = "<Ты не в силах разобрать техническую тарабарщину на этом свитке.>"

G["There are plants in Felwood that may be saved from corruption when Cenarion plant salve is applied to them. I know how to make the salve from several different kinds of items; based on your skill set, you may find that you have multiple options to assist me. You will also need a Cenarion beacon for your work here; it is a device that allows you to see the taint and corruption of nature that the naked eye will miss."] = "В Оскверненном лесу есть растения, которые можно спасти от порчи, если применить к ним Кенарийскую целебную мазь. Я умею готовить эту мазь из нескольких разных наборов вещей; в зависимости от твоих умений у тебя может найтись несколько способов мне помочь. Еще тебе понадобится Кенарийский маяк для работы здесь — это устройство, что позволяет увидеть скверну и порчу природы, которую невооруженным глазом не заметить."

G["Although the coast of Darkshore is more dangerous than that of Teldrassil, many fishers find profit here."] = "Хотя побережье Темных берегов опаснее, чем у Тельдрассила, многие рыбаки находят тут прибыль."

G["The ravasaur here in Un'Goro seem to be related to the raptors of the barrens--highly intelligent, volatile, and with a sense or code of conduct. The greatest of these that I have encountered is Lar'korwi. He is one of the most dangerous beasts I've ever seen. In taurahe, Lar'korwi means \"sharp claw,\" but that does not do him justice. Do not underestimate Lar'korwi if you ever plan on hunting him, but I will help you in any way I can if you do."] = "Равазавры здесь, в Ун'Горо, похоже, в родстве с ящерами Степей — весьма смышленые, вспыльчивые, да еще и с неким чутьем или сводом правил. Величайший из них, кого я встречал, — Лар'корви. Это один из опаснейших зверей, что я видел. На языке тауахе «Лар'корви» значит \"острый коготь\", но это не отдает ему должного. Не недооценивай Лар'корви, если задумаешь на него охотиться, но, коли решишься, я помогу тебе всем, чем сумею."

G["The Emerald Circle strives to heal the wounded land of Felwood. Although the land is named for the very thing that has corrupted it, we hope that one day we will be able to eradicate the corruption from this land."] = "Изумрудный Круг стремится исцелить израненную землю Оскверненного леса. Хоть край и назван в честь самой скверны, что его поразила, мы надеемся однажды искоренить порчу из этой земли."

G["The esteemed Doctor Gustaf VanHowzen can train you further. He can be found in Theramore treating the wounded at the barracks."] = "Достопочтенный доктор Густаф ван Хоузен может обучить тебя дальше. Найти его можно в Тераморе — он врачует раненых в казармах."

G["Who is this Lar'korwi you spoke of?"] = "Кто такой этот Лар'корви, о котором ты говорил?"

G["A long time ago, during my travels, I met a man that told me, \"Master using it and you can have this.\" What do you suppose that means? I didn't know then, and I still don't now, really..."] = "Давным-давно, в странствиях, повстречал я человека, что сказал мне: \"Овладей этим — и это станет твоим\". Как думаешь, что это значит? Тогда я не знал, да и теперь, по правде, не знаю..."

G["You've started down an honorable path, $N. My ancestors respect your willingness, but you will not have my approval until you have followed through with my tasks. You know what you must do if you wish to prove yourself a hunter in spirit."] = "Ты ступил на достойный путь, $N. Мои предки чтят твою готовность, но одобрения моего ты не получишь, пока не исполнишь мои задания. Ты знаешь, что должен сделать, если желаешь доказать, что ты охотник по духу."

G["All is lost..."] = "Все пропало..."

G["I wouldn't do this on any other day, but... I'm thirsty and I hate drinking alone. Bottoms up!"] = "В любой другой день я бы так не поступил, но... я хочу пить, а пить в одиночку терпеть не могу. До дна!"

G["If it weren't for the Grim Guzzler, I'd probably spend my free time pulling the wings off dragon whelps."] = "Если бы не «Угрюмый обжора», я бы, наверное, на досуге отрывал крылья дракончикам."

G["I wish to browse your goods, Dirge."] = "Я хочу осмотреть твой товар, Дирж."

G["I do not enjoy conversation."] = "Я не охоч до бесед."

G["This is good stuff! But I think it's a little flat. Let's round it out with a few squishy gnome eyeballs..."] = "Хорошее пойло! Но, по-моему, малость выдохлось. Округлим-ка вкус парой склизких гномьих глазных яблок..."

G["Only those who have proven themselves to not be hostile toward the Timbermaw may pass through the Hold without fear of being attacked. Have you made an effort to earn our trust, outsider?"] = "Лишь те, кто доказал, что не враждебен Древобрюхам, могут пройти через Логово, не боясь нападения. Постарался ли ты заслужить наше доверие, чужак?"

G["Tell me more about these hippogryphs."] = "Расскажи мне побольше об этих гиппогрифах."

G["Be sure to try our Dark Iron Ale. I hear the dwarves around here can't get enough of it."] = "Непременно отведай нашего эля Черного Железа. Слыхал, здешние дворфы никак им не напьются."

G["Have you seen all the wonderful things here in Ungoro Crater, $N? It's simply amazing. Not as amazing as some of the things I can make with my skill at engineering, but for it being all natural here... it's not too bad. My uncle Remtravel loves old stuff like this place. I'm following in his footsteps kinda--I want to discover new things from lost cultures too!"] = "Видал ли ты все дивные штуки здесь, в кратере Ун'Горо, $N? Просто поразительно. Не так поразительно, как иные вещицы, что я могу смастерить своим инженерным умением, но для здешней-то нетронутой природы... совсем недурно. Мой дядя Рем'трэвел обожает всякую старину вроде этого места. Я вроде как иду по его стопам — тоже хочу открывать новое у сгинувших культур!"

G["For the love of all that is holy and dear, please tell me that you've come to deliver us from this forsaken land. Though I'm with Marshal Expeditions, I would give you the gold teeth from my mouth to climb inside your backpack and leave this place."] = "Ради всего святого и дорогого, прошу, скажи, что ты пришел избавить нас от этой богом забытой земли. Пусть я и из Экспедиции Маршала, я бы отдал золотые зубы изо рта, лишь бы залезть в твой заплечный мешок и убраться отсюда."

G["We are the last of the furbolg race... The Timbermaw tribe remains uncorrupted, yet we face the same hostility from outsiders; most believe that it is not possible... that there could actually be furbolg that escaped the corruption... Angry at those that strive to make enemies too quickly, my brethren now attack any that draw near; they trust no one. But perhaps, if you strive to make your presence peaceful with them, they might look upon you as an ally."] = "Мы — последние из рода фурболгов... Племя Древобрюхов осталось неоскверненным, и все же мы терпим ту же враждебность от чужаков; большинство не верит, что такое возможно... что и впрямь есть фурболги, избежавшие порчи... В гневе на тех, кто слишком поспешно наживает врагов, мои сородичи теперь нападают на всякого, кто подойдет близко; они не доверяют никому. Но, быть может, если ты постараешься явиться к ним с миром, они признают в тебе союзника."

G["The fish off the coast of Teldrassil are quite large and robust. Rumors say it is the speedy growth of our new world tree that is the cause."] = "Рыба у берегов Тельдрассила весьма крупна и крепка. Поговаривают, причиной тому — быстрый рост нашего нового Древа Жизни."

G["It's all guns and flames until someone loses and dies."] = "Веселье с пальбой и пламенем — ровно до тех пор, пока кто-нибудь не проиграет и не сгинет."

-- Реплики NPC (госсип): Чумные земли, Серебряный Рассвет, Штормград
G["I have so much to do... so much before the plague comes..."] = "У меня столько дел... столько всего, пока не пришла чума..."

G["I need a vitreous focuser."] = "Мне нужен стекловидный фокусиратор."

G["Yes, I've been running this shop for some time now. Business has been pretty good lately. A lot of new adventurers coming through..."] = "Да, я держу эту лавку уже некоторое время. В последнее время дела идут неплохо. Столько новых искателей приключений заходит..."

G["A diary with yellowing pages lies open to the last entry: \"I don't know what's going to happen now that Harold's turned. It took everything out of me to drag him into the only place I could find that'd lock him up tight and hold him. I hid the key on me, and I pray it works... I hope I can get out of here, but I need money to do that. Our stuff's all in the cabinet I think... and now that I think about it, doesn't Harold keep the key on him? I'll rest on it, I'm dead tired now.\""] = "Дневник с пожелтевшими страницами раскрыт на последней записи: \"Не знаю, что теперь будет, раз Гарольд обратился. Я из последних сил затащил его в единственное место, которое смог найти, — чтоб заперло его крепко-накрепко и удержало. Ключ я спрятал при себе и молюсь, чтоб сработало... Надеюсь выбраться отсюда, но для этого нужны деньги. Все наши пожитки, кажется, в шкафу... а если подумать, разве Гарольд не держит ключ при себе? Прилягу-ка обдумать это, я до смерти вымотан.\""

G["Greetings and salutations, hero! I have the latest news from both continents and points beyond for your consideration."] = "Приветствую и здравствую, герой! У меня есть свежие вести с обоих континентов и из краев за их пределами — к твоему сведению."

G["What's needed for the cauldron at Felstone Field?"] = "Что нужно для котла на поле Фелстоун?"

G["Since the fall of Dalaran and the destruction of Quel'Thalas, wares of this sort have been hard to come by. But Lucan Cordell and some of our other Tradesman have been doing a fine job of filling our orders with quality merchandise."] = "После падения Даларана и разрушения Кель'Таласа товар подобного рода стало непросто раздобыть. Но Лукан Корделл и кое-кто из наших торговцев славно справляются, выполняя наши заказы качественным товаром."

G["Being part of the Explorers' League, I've been hunting for artifacts in the area. Winterspring is said to contain very magical items... Most are highly guarded."] = "Состоя в Лиге исследователей, я разыскиваю в этих краях артефакты. Говорят, в Зимних Ключах немало магических вещей... И большинство под надежной охраной."

G["Friend - Stormwind needs your assistance and your generosity! Our once large stockpile of textiles has run critically low. Stormwind is now engaged in a multi-pronged effort to rebuild those stocks for the manufacture of textiles and bandages! Your donation of cloth would help Stormwind immensely, as well as earn the respect of the citizenry!"] = "Друг, Штормграду нужны твоя помощь и щедрость! Наши некогда обширные запасы тканей истощились до крайности. Ныне Штормград ведет многостороннюю работу по восстановлению этих запасов ради производства тканей и повязок! Твое пожертвование ткани неимоверно помогло бы Штормграду, а заодно снискало бы уважение горожан!"

G["Hello. What brings you to Chillwind Camp today?"] = "Здравствуй. Что привело тебя сегодня в Лагерь Промозглого Ветра?"

G["I wish to unlearn my talents."] = "Я хочу сбросить свои таланты."

G["The time has come, my brother in arms, to take back the night from the Scourge!"] = "Настал час, брат мой по оружию, отвоевать ночь у Плети!"

G["With the cauldrons breeched, we are now able to introduce the counter agent into the environment. This should give the scourge a taste of their own medicine, as it were! Check with Alchemist Arbington on information regarding the reagents needed to use in the cauldrons. I will be handling all information reports on how we are doing overall in turning the plague against the Scourge!"] = "Теперь, когда котлы вскрыты, мы можем ввести антидот в окружающую среду. Это, так сказать, попотчует Плеть ее же снадобьем! Обратись к алхимику Арбингтону за сведениями о реагентах, что нужны для котлов. А я буду вести все сводки о том, как в целом продвигается дело обращения чумы против Плети!"

G["Well met, friend. I am Officer Pureheart, and I am a proud member of a world-wide organization known as the Argent Dawn. Our cause is simple - fight swiftly and mercilessly against any element of evil that surfaces in Azeroth. We are not a political body, nor do we ever wish to become one. To that end we call both the Alliance and the Horde both as friends - friends in the cause of stamping out evil! For the Dawn, my brother!"] = "Приветствую, друг. Я офицер Чистосерд, и я с гордостью состою во всемирной организации, известной как Серебряный Рассвет. Наша цель проста — быстро и беспощадно сражаться с любым проявлением зла, что всплывает в Азероте. Мы не политическая сила и никогда не желаем ею стать. А потому мы зовем друзьями и Альянс, и Орду — друзьями в деле искоренения зла! За Рассвет, брат мой!"

G["Based on the sample of the toxin you provided for us, we think you will need the following: an arcane quickener, five somatic intensifiers, and and four pieces of runecloth. With the vitreous focuser in tow, acquire the intensifiers from zombie or ghoul undead here in the Plaguelands! Once you have these items, you should be able to load the counter agent into that cauldron."] = "Судя по образцу токсина, что ты нам предоставил, тебе понадобится следующее: чародейский ускоритель, пять соматических усилителей и четыре куска рунической ткани. Со стекловидным фокусиратором при себе добудь усилители с зомби или вурдалаков-нежити здесь, в Чумных землях! Раздобыв эти вещи, ты сможешь загрузить антидот в тот котел."

G["Learn about Dual Talent Specialization."] = "Узнать о двойной специализации талантов."

G["Based on the sample of the toxin you provided for us, we think you will need the following: an arcane quickener, six osseous agitators, and four pieces of runecloth. With the vitreous focuser in tow, acquire the agitators from skeletal undead here in the Plaguelands! Once you have these items, you should be able to load the counter agent into that cauldron."] = "Судя по образцу токсина, что ты нам предоставил, тебе понадобится следующее: чародейский ускоритель, шесть костных возбудителей и четыре куска рунической ткани. Со стекловидным фокусиратором при себе добудь возбудители со скелетов-нежити здесь, в Чумных землях! Раздобыв эти вещи, ты сможешь загрузить антидот в тот котел."

G["So good of you to speak with me. Please, help the Alliance in any way that you can."] = "Как хорошо, что ты со мной заговорил. Прошу, помоги Альянсу всем, чем сможешь."

G["Well now $N, let's get to work on those cauldrons! If you're going to collect the components we need, then get a vitreous focuser from me. You'll need to have it on you to identify the necessary resources found on the Scourge that will turn those cauldrons. You'll also need a dose of arcane quickener for the cauldrons. It's not cheap, nor is it stable. Once you have it, you'll only have thirty minutes to use it before it expires on you; be smart about buying it."] = "Ну что ж, $N, приступим к тем котлам! Если собираешься собрать нужные нам составляющие, возьми у меня стекловидный фокусиратор. Он должен быть при тебе, чтобы распознать необходимые ресурсы на слугах Плети, которыми обращаются те котлы. Еще тебе понадобится доза чародейского ускорителя для котлов. Он недешев и нестабилен. Раздобыв его, ты успеешь пустить его в ход лишь за тридцать минут, прежде чем он выдохнется; так что покупай с умом."

G["Emissary Taluun brought me with him hoping I could teach our new allies about the elements of this world. So far they refuse to listen, but perhaps you would be willing?"] = "Посланник Талуун взял меня с собой в надежде, что я обучу наших новых союзников стихиям этого мира. Пока они отказываются слушать, но, быть может, ты согласишься?"

G["The Scourge's plague still dominates the zone, and we have a long way to go before the plague will be altered enough to affect them. Collect the necessary resources and help out the war effort!"] = "Чума Плети все еще властвует над этим краем, и нам предстоит долгий путь, прежде чем чуму удастся изменить настолько, чтобы она поражала их самих. Собери нужные ресурсы и помоги общему делу войны!"

G["How are we doing in the battle to subvert the cauldrons?"] = "Как продвигается наша борьба за то, чтобы обратить котлы?"

G["Yes, I speak a language you understand draenei. We are not animals, yet most of your kind continues to treat us as such! Our differences though pale to the tragedy that has befallen this land. Please, put aside your differences with my kind and hear my dying plea. I came to this land to mend what I could, and now that will be for naught unless you can aid me. I ask for such aid with my last breaths of life."] = "Да, я говорю на понятном тебе языке, дреней. Мы не животные, но большинство твоих сородичей по-прежнему обращается с нами именно так! Впрочем, наши распри меркнут перед трагедией, постигшей эту землю. Прошу, отбрось разногласия с моим народом и выслушай мою предсмертную мольбу. Я пришел в этот край исцелить, что смогу, и теперь все будет напрасно, если ты мне не поможешь. О такой помощи я прошу последними вздохами жизни."

G["What's needed for the cauldron at Dalson's Tears?"] = "Что нужно для котла на Слезах Далсона?"

G["Welcome to the front lines, shaman. The Kingdom of Stormwind, with the aid of its allies, has sent me here to counter the growing threat of the Scourge. Here at Chillwind Camp, we fight for our continued survival on a daily basis. If you've come here looking for a chance to prove yourself as a hero, then you'll find plenty of opportunities to do so... especially as we push towards Andorhal and whatever malign force that controls the Scourge there."] = "Добро пожаловать на передовую, шаман. Королевство Штормград с помощью союзников послало меня сюда, чтобы противостоять растущей угрозе Плети. Здесь, в Лагере Промозглого Ветра, мы ежедневно бьемся за само свое выживание. Если ты явился сюда в поисках возможности проявить себя героем, то таких возможностей найдется в избытке... особенно теперь, когда мы наступаем на Андорал и на ту зловещую силу, что правит тамошней Плетью."

G["I sell only the finest arcane gear, made by the crafters and mages here in the city of Stormwind."] = "Я торгую лишь лучшим чародейским снаряжением, что делают мастера и маги здесь, в городе Штормграде."

G["How fares your search for the Mark?"] = "Как продвигаются твои поиски Метки?"

G["What's needed for the cauldron at the Writhing Haunt?"] = "Что нужно для котла в Обители Мучений?"

G["Teach me the ways of the spirits."] = "Обучи меня путям духов."

G["The Argent Dawn salutes you, shaman! The name's Lightspark, and I'm an authorized equipment and materiel quartermaster for the Dawn. As you fight evil under our commission - all the while earning our respect and trust - you'll earn valor tokens from Officer Pureheart. Tokens serve two purposes: use them to gain increased standing within our ranks, or use them as tender in acquiring special items. As you improve your standing with the Dawn, you'll discover that more items will be made available to you."] = "Серебряный Рассвет приветствует тебя, шаман! Зовут меня Светоискр, и я уполномоченный интендант снаряжения и припасов Рассвета. Пока ты сражаешься со злом по нашему поручению — попутно снискивая наше уважение и доверие, — ты будешь получать жетоны доблести от офицера Чистосерда. У жетонов два назначения: трать их, чтобы возвыситься в наших рядах, или пускай их в ход как плату за особые предметы. По мере роста твоего положения в Рассвете ты обнаружишь, что тебе становятся доступны все новые предметы."

G["These are dangerous times, adventurer. Walk lightly."] = "Времена нынче опасные, искатель приключений. Ступай осторожно."

G["Welcome to SI:7 headquarters, $N."] = "Добро пожаловать в штаб ШРУ:7, $N."

G["Hi! I just got back from exploring the Ruins of Kel'Theril, to the southwest. Now I'm intent on investigating the Wildkin that lie just up the ridge here, in Owl Wing Thicket. Have you spoken to Erelas Ambersky in Rut'theran Village? He requested that I come here, and perhaps he has a task for you as well."] = "Привет! Я только что вернулся с исследования руин Кел'Терил, что к юго-западу. Теперь я вознамерился изучить диких совух, что обитают чуть выше по хребту, в чаще Совиных Крыльев. Ты уже говорил с Эреласом Янтарное Небо в деревне Рутеран? Это он попросил меня прийти сюда — может, и для тебя у него найдется поручение."

G["Yes, yes. I see you. Be on your way. You may have earned the trust of a few, but it will take more than that to prove it to me!"] = "Да, да. Вижу я тебя. Ступай своей дорогой. Может, ты и заслужил доверие кое-кого, но, чтобы убедить меня, этого мало!"

G["This job is definitely not worth sixteen-five a year."] = "Эта работенка уж точно не стоит шестнадцати с половиной в год."

G["If you prove that you are a true ally, I might consider training you..."] = "Если ты докажешь, что ты истинный союзник, я, может, и подумаю о том, чтобы тебя обучить..."

G["Long ago, before the last great war, my father ran the Northridge Lumber Mill. It was his life, and he was committed to it. Then the war came, and as much as it pained him, we had to flee to Stormwind. We lost a number of friends and family in those days, and it pains me to know that the Scarlet Crusade has taken the mill for their own ends. That's why I've returned."] = "Давным-давно, до последней великой войны, мой отец держал лесопилку Северного Кряжа. Это была его жизнь, и он был предан ей всецело. Потом пришла война, и, как ни горько ему было, нам пришлось бежать в Штормград. В те дни мы потеряли немало друзей и родни, и мне больно сознавать, что Алый орден прибрал лесопилку к рукам ради своих целей. Вот почему я вернулся."

G["Life is like a carefully woven tapestry."] = "Жизнь подобна искусно сотканному гобелену."

G["What do you seek, shaman?"] = "Что ты ищешь, шаман?"

G["I wish to purchase arcane quickener from you."] = "Я хочу купить у тебя чародейский ускоритель."

G["We must strive to understand the balance maintained by this world's elemental spirits."] = "Мы должны стремиться постичь равновесие, что поддерживают стихийные духи этого мира."

-- Gossip lines absent from official broadcast_text.
G["$N, the Sons of Lothar have fought here, on the Hellfire Peninsula, for two decades. We are beset on all sides by indigenous orcs and hellish demons of the Burning Crusade, and though our hearts still beat fiercely, years of war have reduced our numbers. You, and the influx of Azeroth's new generation of heroes, are a welcome sight indeed!"] =
"$N, Сыны Лотара сражались здесь, на полуострове Адского Пламени, вот уже два десятилетия. Нас со всех сторон окружают местные орки и адские демоны Пылающего Крестового Похода, и хотя наши сердца по-прежнему яростно бьются, годы войны сократили нашу численность. Вы и приток нового поколения героев Азерота — действительно долгожданное зрелище!"
G["<Angela nods.> After the deaths, the Six decided that the best course of action was to seal the staff behind impenetrable barriers of magic and appoint a watcher: A guardian of the staff... I would be that watcher."] =
"<Анжела кивает.> После смертей Шесть решили, что лучшим решением будет запечатать посох непроницаемыми магическими барьерами и назначить наблюдателя: стража посоха... Я буду этим наблюдателем."
G["About twenty years ago, the Alliance launched the first Expedition to this world in hopes of eradicating the orcs forever. It was a... terrible conflict. Many brave souls perished to assure Azeroth's safety. Yet some souls remain...locked in eternal combat."] =
"Около двадцати лет назад Альянс начал первую экспедицию в этот мир в надежде навсегда искоренить орков. Это был... ужасный конфликт. Многие смельчаки погибли, чтобы обеспечить безопасность Азерота. И все же некоторые души остаются... вовлеченными в вечную битву."
G["After the fall of Dalaran, I took my leave from the Kirin Tor. I spent years watching over Atiesh, only to have my purpose amongst the Kirin Tor taken from me in one fell swoop. I would find the staff, though it might take a lifetime. That is how I came to join the Argent Dawn and why I am here now."] =
"После падения Даларана я покинул Кирин-Тор. Я провел годы, наблюдая за Атиешем, только для того, чтобы одним махом у меня отняли цель в Кирин-Торе. Я найду посох, хотя на это может уйти целая жизнь. Вот как я присоединился к Серебряному Рассвету и почему я сейчас здесь."
G["After the fall of Karazhan, the Kirin Tor dispatched an assembly of mages to search the tower and seize all items of import... for the purposes of \"research.\" It was then that the fabled staff was discovered and brought back to Dalaran."] =
"После падения Каражана Кирин-Тор отправил собрание магов обыскать башню и конфисковать все импортные предметы... в целях «исследований». Именно тогда легендарный посох был обнаружен и доставлен обратно в Даларан."
G["Ah, a good question. If you prefer hunting in the great outdoors, there are elementals here in the Plaguelands, Azshara, Burning Steppes, Felwood, Silithus, Winterspring, and even Un'Goro Crater. If you are the type that laughs in the face of danger, then perhaps you should visit Dire Maul. I have heard that a great many elemental abberations exist within its walls. You would also do well in seeking out the elementals employed by the Dark Iron dwarves of Blackrock Depths."] =
"Ах, хороший вопрос. Если вы предпочитаете охотиться на свежем воздухе, элементали найдутся в Чумных землях, Азшаре, Пылающих степях, Оскверненном лесу, Силитусе, Зимних Ключах и даже в кратере Ун'Горо. Если вы из тех, кто смеется перед лицом опасности, возможно, вам стоит посетить Забытый Город. Я слышал, что в его стенах существует великое множество элементарных аберраций. Вам также не помешало бы найти элементалей, нанятых дворфами Черного Железа в Глубинах Черной горы."
G["All things in nature exists in an interconnected web; an ecology. If we're careful not to disturb it, and simply observe, we may be fortunate to piece together the complex relationship between the diverse organisms around us. Once we have that understanding, we can take the appropriate actions to ensure the wellbeing of all creatures. Interfere without that knowledge, and we'll surely cause destruction. I am here to observe the complex interactions between the sporelings and the bog lords."] =
"Все вещи в природе существуют во взаимосвязанной сети; экология. Если мы будем осторожны, не тревожим его и просто наблюдаем, нам, возможно, повезет собрать воедино сложные взаимоотношения между разнообразными организмами вокруг нас. Как только мы поймем это, мы сможем предпринять соответствующие действия для обеспечения благополучия всех существ. Вмешайтесь без этих знаний, и мы обязательно вызовем разрушения. Я здесь, чтобы наблюдать за сложным взаимодействием между спорлингами и болотными лордами."
G["Another soldier on his way to Honor Hold... by Kurdran's beard, they can use the help!"] =
"Еще один солдат направляется в Оплот Чести... клянусь бородой Курдрана, им пригодится помощь!"
G["Are you daft? Did you miss the BONY SKELETAL CREATURES littering the landscape on your way over here? <Rohan sighs.> If you're the outdoor type, you'll find skeletal creatures all over both the Western and Eastern Plaguelands. Trust me, you can't miss 'em - they certainly won't miss you if they get the chance. If you're a dungeon type, Stratholme and Scholomance are definitely the place to be for bone fragments."] =
"Ты дурак? Вы скучали по КОСТЯННЫМ СКЕЛЕТНЫМ СУЩЕСТВАМ, разбросанным по местности по пути сюда? <Рохан вздыхает.> Если вы любитель активного отдыха, вы встретите скелетных существ как в Западных, так и в Восточных Чумных землях. Поверьте мне, вы не сможете их пропустить – они уж точно не пропустят вас, если у них будет такая возможность. Если вы предпочитаете подземелья, Стратхольм и Некроситет определенно являются лучшим местом для фрагментов костей."
G["Based on the sample of the toxin you provided for us, we think you will need the following: an arcane quickener, four ectoplasmic resonators, and four pieces of runecloth. With the vitreous focuser in tow, acquire the resonators from wraith and ghostly undead here in the Plaguelands! Once you have these items, you should be able to load the counter agent into that cauldron."] =
"Судя по образцу токсина, который вы нам предоставили, мы полагаем, что вам понадобится следующее: тайный ускоритель, четыре эктоплазматических резонатора и четыре куска рунной ткани. Возьмите с собой стекловидный фокусер и добудьте резонаторы у призраков и призрачной нежити здесь, в Чумных землях! Как только у вас будут эти предметы, вы сможете загрузить противодействующее вещество в этот котел."
G["Be gone, shaman! Leave us be, or we will enter you next and show you true despair!"] =
"Уйди, шаман! Оставьте нас, или мы войдем в вас следующими и покажем вам настоящее отчаяние!"
G["Can you believe this place? 'Course, it's a mite stuffy up here if you ask me."] =
"Можете ли вы поверить этому месту? Конечно, по моему мнению, здесь довольно душно."
G["Certainly, $N. Adventurers that the Dawn views as exalted must submit a combined total of 12 insignias to access superior items. To access items of even greater power, they would be required to submit a total of 54 insignias. Those exalted in the eyes of the Dawn receive the greatest discounts."] =
"Конечно, $N. Искатели приключений, которых Рассвет считает возвышенными, должны предоставить в общей сложности 12 знаков отличия, чтобы получить доступ к превосходным предметам. Чтобы получить доступ к предметам еще большей силы, им потребуется предоставить в общей сложности 54 знака различия. Те, кто возвысился в глазах Зари, получают самые большие скидки."
G["Certainly, $N. Adventurers that the Dawn views as friendly must submit a combined total of 60 insignias to access superior items. To access items of even greater power, they would be required to submit a total of 220 insignias. I must admit, the price is quite high for adventurers not favored by the Dawn."] =
"Конечно, $N. Искатели приключений, которых Рассвет считает дружественными, должны предоставить в общей сложности 60 знаков отличия, чтобы получить доступ к превосходным предметам. Чтобы получить доступ к предметам еще большей мощности, им потребуется предоставить в общей сложности 220 знаков отличия. Должен признать, цена для искателей приключений, не пользующихся благосклонностью Рассвета, довольно высока."
G["Certainly, $N. Adventurers that the Dawn views as honored must submit a combined total of 40 insignias to access superior items. To access items of even greater power, they would be required to submit a total of 150 insignias. I must admit, the price is high even for those honored amongst the Dawn."] =
"Конечно, $N. Искатели приключений, которых Рассвет считает заслуженными, должны предоставить в общей сложности 40 знаков отличия, чтобы получить доступ к превосходным предметам. Чтобы получить доступ к предметам еще большей мощности, им потребуется предоставить в общей сложности 150 знаков отличия. Должен признать, цена высока даже для тех, кто почитаем среди Рассвета."
G["Certainly, $N. Adventurers that the Dawn views as revered must submit a combined total of 14 insignias to access superior items. To access items of even greater power, they would be required to submit a total of 90 insignias. Those that are revered by the Dawn will find the cost of superior items quite reasonable! The cost for the more powerful items is still high."] =
"Конечно, $N. Искатели приключений, которых Рассвет считает почитаемыми, должны предоставить в общей сложности 14 знаков отличия, чтобы получить доступ к превосходным предметам. Чтобы получить доступ к предметам еще большей мощности, им потребуется предоставить в общей сложности 90 знаков отличия. Те, кого почитает Рассвет, найдут стоимость превосходных предметов вполне разумной! Стоимость более мощных предметов по-прежнему высока."
G["Certainly, $N. You only need to tell me what reputation you would like to know about."] =
"Конечно, $N. Вам нужно только сказать мне, о какой репутации вы хотели бы узнать."
G["Come closer, friend. Do not let my eyes startle you. I might have lost my sight many years ago but I never needed it to see the things that really matter."] =
"Подойди ближе, друг. Не позволяй моим глазам напугать тебя. Возможно, я потерял зрение много лет назад, но оно мне никогда не требовалось, чтобы видеть действительно важные вещи."
G["Do you have anything that could help me, timekeeper?"] =
"У тебя есть что-нибудь, что могло бы мне помочь, хранитель времени?"
G["Do you need something, shaman? Perhaps I can assist you."] =
"Тебе что-то нужно, шаман? Возможно, я смогу вам помочь."
G["For years, Honor Hold has stood against the horrors of Hellfire Peninsula. Now, now that the portal has reopened and aid streams in from Azeroth, perhaps this bloody stalemate will end."] =
"В течение многих лет Оплот Чести противостоял ужасам Полуострова Адского Пламени. Теперь, когда портал вновь открылся и из Азерота поступает помощь, возможно, эта кровавая тупиковая ситуация закончится."
G["Greetings, $N. As you rise in rank among the forces of Honor Hold, I will give you access to some of the different goods we keep in stock."] =
"Приветствую, $N. По мере того, как вы будете повышаться в звании в войсках Оплота Чести, я буду предоставлять вам доступ к некоторым товарам, которые мы храним на складе."
G["Greetings, $N. My fellow Sons of Lothar and I have been stuck on this miserable world for close to twenty years now. We held on as best we could, but it still amazes me that the threats we face today are just the shadows of our past failures. Perhaps you will help us atone for them?"] =
"Приветствую, $N. Мои собратья, Сыны Лотара, и я застряли в этом жалком мире вот уже почти двадцать лет. Мы держались как могли, но меня до сих пор удивляет, что угрозы, с которыми мы сталкиваемся сегодня, — это всего лишь тени наших прошлых неудач. Возможно, вы поможете нам искупить их вину?"
G["Greetings, shaman - I'm a Commendation Officer acting on behalf of Stormwind. It is my duty to assist adventurers who have received Alliance Commendation Signets. I accept signets in different quantities, but the most beneficial exchange for you is to hand in a set of ten at once. I will enter your deeds into our records when you hand in your signets. As a result, you will earn recognition from Stormwind for your duty and service."] =
"Приветствую, шаман! Я почетный офицер, действующий от имени Штормграда. Моя обязанность — помогать авантюристам, получившим почетные знаки Альянса. Я принимаю печатки в разном количестве, но наиболее выгодный для вас обмен — сдать сразу комплект из десяти штук. Я занесу ваши дела в наши записи, когда вы сдадите свои печати. В результате вы заслужите признание Штормграда за свой долг и службу."
G["Greetings, shaman. Don't have too much time to talk--I'm just using Chillwind as a camp to get some rest before heading to Hearthglen. I've heard word that before they went crazy, the Scarlet Crusade had a mage working for them who was trying to create powerful bows and guns for their soldiers. I'm not sure if he succeeded or not... the Crusade killed him before any of his finished product made it out. Maybe they killed him to keep it a secret... or maybe they distrust the arcane that much."] =
"Приветствую, шаман. У меня не так уж много времени на разговоры — я просто использую Холодный Ветер как лагерь, чтобы немного отдохнуть перед тем, как отправиться в Дольный Очаг. Я слышал, что до того, как они сошли с ума, в Алом Ордене работал маг, который пытался создать мощные луки и ружья для своих солдат. Я не уверен, преуспел он или нет... Крестовый поход убил его прежде, чем его готовый продукт вышел в свет. Может быть, они убили его, чтобы сохранить это в секрете... или, может быть, они настолько не доверяют тайной магии."
G["Greetings, shaman. I am Miranda Breechlock - one of but a few authorized equipment and materiel quartermasters for the Dawn. As you fight evil under our commission - all the while earning our respect and trust - you'll earn valor tokens from Duke Zverenhoff. Tokens serve two purposes: use them to gain increased standing within our ranks, or use them as tender in acquiring special items. As you improve your standing with the Dawn, you'll discover that more items will be made available to you."] =
"Приветствую, шаман. Я Миранда Бриклок — одна из немногих уполномоченных квартирмейстеров снаряжения и техники «Рассвета». Сражаясь со злом под нашим руководством, зарабатывая при этом наше уважение и доверие, вы будете получать жетоны доблести от герцога Зверенгофа. Жетоны служат двум целям: использовать их для повышения авторитета в наших рядах или использовать их в качестве средства для приобретения особых предметов. По мере того, как вы улучшаете свое положение в Рассвете, вы обнаружите, что вам станет доступно больше предметов."
G["Greetings, shaman. It is good you've decided to visit us."] =
"Приветствую, шаман. Хорошо, что вы решили посетить нас."
G["Have a seat, brother. The ravages of Zangarmarsh can take a lot out of a man."] =
"Садись, брат. Разрушения Зангартопи могут многое отнять у человека."
G["Haven't got much time to talk, draenei. That is, unless you're willin' to help with this mine trouble."] =
"У меня не так много времени для разговоров, дреней. То есть, если только ты не захочешь помочь с этой проблемой с шахтой."
G["He... hello, $N. Sorry, I'm recovering from my wounds. Those Scarlet Crusaders are tougher than I had given them credit for. They almost did me in. You should be careful too. I'd hate to see them get the jump on you."] =
"Он... привет, $N. Извините, я оправляюсь от ран. Эти Алые Крестоносцы сильнее, чем я предполагал. Они чуть не прикончили меня. Тебе тоже следует быть осторожным. Мне не хотелось бы видеть, как они нападают на тебя."
G["Heh, heh... Quite the inquisitive one, aren't ya, $N? Well, here's what you need to do. North of here, in the old ruins, lives a very disagreeable gnoll by the name of Miblon Snarltooth. He guards the only Evoroot I know of, but he watches it night and day! Seems like he never even sleeps! What you can do, is bribe him. I can sell you some bait that he'll find tasty -- just put it down near him and that will distract him long enough for you to grab the Evoroot. Good luck!"] =
"Хе-хе... Довольно любознательный, не так ли, $N? Что ж, вот что вам нужно сделать. К северу отсюда, в старых руинах, живет очень неприятный гнолл по имени Миблон Рыкозуб. Он охраняет единственный известный мне Эворрут, но наблюдает за ним день и ночь! Кажется, он даже не спит! Что вы можете сделать, так это подкупить его. Я могу продать вам наживку, которая ему покажется вкусной — просто положите ее рядом с ним, и это отвлечет его на время, достаточное для того, чтобы вы могли схватить Эворут. Удачи!"
G["Hellfire Peninsula is a shattered realm - ruthless and unforgiving to its inhabitants. Be sure to repair and stock up on supplies before venturing out."] =
"Полуостров Адского Пламени — разрушенное царство, безжалостное и неумолимое к своим обитателям. Обязательно отремонтируйте и запаситесь припасами, прежде чем отправиться в путь."
G["Hello once again, $N. I sense that the flow of time remains threatened by forces that are quite powerful indeed. Your continued assistance is always welcomed by the bronze dragonflight. While the past is set in its ways, the future is always changing. The decisions you make in the here and now help guide that change."] =
"Еще раз здравствуйте, $N. Я чувствую, что потоку времени по-прежнему угрожают силы, которые действительно весьма мощны. Ваша постоянная помощь всегда приветствуется стаей бронзовых драконов. Хотя прошлое устроено по-своему, будущее всегда меняется. Решения, которые вы принимаете здесь и сейчас, помогают направить эти изменения."
G["Hello there, $N. I am known as Chronormu, but you may call me Chromie. I am comfortable with such familiarity. Now - how did I know your name, you ask? I am one of the bronze dragonflight, forever attuned to the ebb and flow of time. You could say that we have met before. To that end, we shall also meet again. I hope that my choice of visual demeanor does not disturb you; while I might be charged to be a sentry of sorrowful places, I choose not to drown in the sorrow of the locale."] =
"Здравствуйте, $N. Меня зовут Хронорму, но ты можешь звать меня Хроми. Мне комфортно от такого знакомства. Вы спросите, откуда я узнал ваше имя? Я один из стаи бронзовых драконов, всегда настроенный на приливы и отливы времени. Можно сказать, что мы уже встречались. С этой целью мы также встретимся снова. Надеюсь, мой выбор манеры поведения вас не смущает; хотя мне и поручено быть стражем печальных мест, я предпочитаю не тонуть в печали этого места."
G["Hello, shaman. Please excuse me as I am having a conversation with Rimblat. He believes that even this land is not beyond saving."] =
"Привет, шаман. Извините, пожалуйста, я разговариваю с Римблатом. Он считает, что даже эту землю можно спасти."
G["Horrible... just horrible! We were minding our own business on our way from Area 52 in Netherstorm and they shot us down! I knew we shouldn't have taken that shortcut to get to Terokkar Forest!"] =
"Ужас... просто ужас! Мы занимались своими делами по пути из Зоны 52 в Пустоверти, и они нас сбили! Я знал, что нам не следовало идти по этому короткому пути, чтобы добраться до леса Тероккар!"
G["How embarrassing to be taken as a pet by a hunter! I owe you my life, but please, trouble yourself no longer with my welfare. Now that you've freed me from Musel'ek, I'll be able to find my way out. Maybe I'll pick up Rayge along the way."] =
"Как унизительно, что охотник взял меня в питомцы! Я обязан тебе жизнью, но, пожалуйста, не беспокойся больше о моем благополучии. Теперь, когда ты освободил меня от Мусельека, я смогу найти выход. Может быть, я заберу Рэйджа по пути."
G["I bid you welcome, shaman."] =
"Приветствую тебя, шаман."
G["I don't know what to think of your kind yet, draenei. Some of you can be violent and kill sporelings on sight. You seem friendly... though maybe a little bit funny looking, I suppose."] =
"Я пока не знаю, что думать о тебе, дреней. Некоторые из вас могут проявлять жестокость и убивать спорлингов на месте. Ты выглядишь дружелюбным... хотя, я полагаю, ты выглядишь немного забавно."
G["I have tracked the various fragments of the staff across this world and in doing so, discovered Kel'Thuzad's plans to reform the staff. He has already collected several of the staff's fragments - which are being held by his most trusted lieutenants. I cannot emphasize enough the importance of keeping the greatstaff of the Guardian out of Kel'Thuzad's grasp. Frankly, I do not know what the result would be, other than a catastrophe of epic proportion."] =
"Я отслеживал различные фрагменты посоха по всему миру и при этом узнал о планах Кел'Тузада реформировать посох. Он уже собрал несколько фрагментов посоха, которые хранятся у его самых доверенных помощников. Я не могу переоценить важность того, чтобы великий посох Стража не попал в руки Кел'Тузада. Честно говоря, я не знаю, каким будет результат, кроме катастрофы эпического масштаба."
G["I hope yer not here for our ale. We're not sharing and that's final! It's not our fault no one had the good sense to bring beer to Outland but us."] =
"Надеюсь, ты здесь не ради нашего эля. Мы не делимся и это окончательно! Мы не виноваты, что ни у кого не хватило здравого смысла привезти пиво в Запределье, кроме нас."
G["I was only an infant when my father was deployed to this wasteland. All that I have ever known of him is what others have told me. Do your dreams change, $N? Mine do not. I have one dream: A crimson skyline envelops me as Legion, numbering beyond comprehension, battle in the distance. I kneel before the body of a man, presumably my father, and weep. As he is gasping for air, his body wholly crushed, he whispers something. Despite every effort, I am unable to hear what he is trying to tell me."] =
"Я был еще младенцем, когда моего отца отправили в эту пустошь. Все, что я когда-либо знал о нем, — это то, что мне рассказывали другие. Твои мечты меняются, $N? У меня нет. У меня есть одна мечта: малиновый горизонт окутывает меня, как Легион, число которого за гранью понимания, сражается вдалеке. Я стою на коленях перед телом мужчины, предположительно моего отца, и плачу. Когда он задыхается, его тело полностью раздавлено, он что-то шепчет. Несмотря на все усилия, я не могу услышать то, что он пытается мне сказать."
G["I welcome you to Sporeggar, draenei. We don't normally see many of your kind around here, but you've proven your worth to us. Make yourself at home."] =
"Приветствую тебя в Спореггаре, дренеи. Обычно мы не видим здесь многих подобных вам людей, но вы доказали нам свою ценность. Чувствуйте себя как дома."
G["I wish it were true, $N, but it will take more than you alone to overcome the forces of Razelikh and his subordinates. Gather a suitable group of adventurers and would-be heroes and free my men of their eternal torture! Eighteen stones you must shatter. Fight hard and die with honor, $N."] =
"Мне бы хотелось, чтобы это было правдой, $N, но чтобы одолеть силы Разелиха и его подчинённых, потребуется нечто большее, чем только ты. Соберите подходящую группу авантюристов и потенциальных героев и освободите моих людей от вечных пыток! Восемнадцать камней, которые ты должен разбить. Сражайтесь упорно и умрите с честью, $N."
G["I'm far too busy to be playing 'guess the smell' with you, draenei. State your business or get out of my sight!"] =
"Я слишком занят, чтобы играть с тобой в «угадай запах», дреней. Заяви о своих делах или исчезни с моих глаз!"
G["I'm what you call a capitalist, draenei."] =
"Я тот, кого ты называешь капиталистом, дреней."
G["I've always liked sorting and organizing things. I guess I take after my mother."] =
"Мне всегда нравилось сортировать и систематизировать вещи. Наверное, я похож на свою мать."
G["I've been watching the Aldor working on the walls. They're gonna rebuild the whole city, you know. They work much faster than old Foreman Oslow did back home in Lakeshire. He kept losing his tools in the lake, or the gnolls would take his supplies. I should ask the Aldor to send him some help. They'd have that bridge fixed faster'n anything."] =
"Я наблюдал, как Алдоры возводят стены. Знаешь, они собираются перестроить весь город. Они работают гораздо быстрее, чем старый бригадир Ослоу дома, в Лейкшире. Он постоянно терял свои инструменты в озере, иначе гноллы забрали бы его припасы. Мне следует попросить Алдоров прислать ему помощь. Они бы быстрее починили этот мост."
G["I've got too much to do and not enough time to do it in, draenei! Please, get out of my way."] =
"У меня слишком много дел и недостаточно времени, дреней! Пожалуйста, уйди с моего пути."
G["If only I hadn't twisted my ankle coming into this place, I'd be in there with my friends. Hmmm, now that I think about it, maybe it's better that I'm out here?"] =
"Если бы я только не подвернул лодыжку, придя сюда, я был бы там со своими друзьями. Хммм, теперь, когда я думаю об этом, может быть, мне лучше остаться здесь?"
G["If you are one that prefers to hunt in the outdoor world, both Felwood's treants and Un'Goro's lashers are an excellent source of fronds. If you are more of a risk-taker, the eastern and western wings of Dire Maul will provide you with a nearly limitless supply of savage fronds."] =
"Если вы предпочитаете охотиться на открытом воздухе, то тренты Оскверненного леса и плети Ун'Горо станут отличным источником листьев. Если вы более склонны к риску, восточное и западное крылья Забытого Города предоставят вам почти безграничный запас диких листьев."
G["If you're looking for work, shaman, grab yourself a pick and get to digging. There're ruins out there as far as the eye can see!"] =
"Если ищешь работу, шаман, бери себе кирку и принимайся копать. Насколько хватает глаз, там руины!"
G["Is this a serious question? You really don't know? If you are the cowardly sort, afraid to get their hands too dirty, you will find Dark Iron scraps on the creatures in the Burning Steppes and Searing Gorge. If you're the bloodthirsty adventuring type, the dungeons of Blackrock Spire and Blackrock Depths hold quite a large supply of the scraps."] =
"Это серьезный вопрос? Ты правда не знаешь? Если вы трусливый человек, боящийся слишком испачкать руки, вы найдете обрывки Черного железа на существах в Пылающих степях и Тлеющем ущелье. Если вы кровожадный искатель приключений, то в подземельях Пика Черной горы и Глубин Черной горы хранится довольно большой запас отходов."
G["It is a story of legend and one that I do not have the time nor the inclination to retell. Just know that Medivh was the last of the Guardians. The greatstaff of Atiesh was a focal point of his power and a focal point of corruption."] =
"Это история-легенда, пересказывать которую у меня нет ни времени, ни желания. Просто знайте, что Медив был последним из Стражей. Великий посох Атиеша был центром его власти и центром коррупции."
G["It is said that Kel'Thuzad seeks the legendary Atiesh, greatstaff of the Guardian. Yes, the very staff once held by Medivh."] =
"Говорят, что Кел'Тузад ищет легендарного Атиеша, великого посоха Стража. Да, тот самый посох, который когда-то принадлежал Медиву."
G["It looks like help has finally arrived! The Omenai welcome you to our remnant camp, $N."] =
"Похоже, помощь наконец прибыла! Оменаи приветствуют вас в нашем лагере остатков, $N."
G["It's hard to imagine that so much death and despair could be confined to such a small area; yet beyond the swamp is a land plagued by chaos and destruction. Watch your step, adventurer. The Blasted Lands are the final resting place to far greater beings than you."] =
"Трудно представить, что столько смертей и отчаяния могло быть сосредоточено на такой маленькой территории; однако за болотом находится земля, охваченная хаосом и разрушениями. Следи за своим шагом, искатель приключений. Выжженные земли — место последнего пристанища для гораздо более великих существ, чем вы."
G["Learning about new plant species is extremely important for our expedition. Not just the medicinal or edible ones either. Plants provide the foundation for many other forms of life to exist. Understanding them allows us to better understand nature as a whole."] =
"Изучение новых видов растений чрезвычайно важно для нашей экспедиции. И не только лекарственные или съедобные. Растения обеспечивают основу для существования многих других форм жизни. Их понимание позволяет нам лучше понять природу в целом."
G["Light be with you, shaman."] =
"Свет с тобой, шаман."
G["Like Kel'Thuzad, I too was once a mage of the Kirin Tor. And like Kel'Thuzad, I seek the legendary Atiesh, greatstaff of the Guardian. Our fates are intertwined as such, shaman."] =
"Как и Кел'Тузад, я тоже когда-то был магом Кирин-Тора. И, как и Кел'Тузад, я ищу легендарного Атиеша, великого посоха Стража. Наши судьбы так переплетены, шаман."
G["Maktu doesn't recognize you, draenei, but he is pleased to meet you. If ever you need to buy or repair armor, look no further than Maktu."] =
"Макту не узнает тебя, дреней, но рад с тобой познакомиться. Если вам когда-нибудь понадобится купить или отремонтировать броню, не ищите ничего, кроме Макту."
G["Many years ago, my men and I followed the wizard Khadgar and the paladin Turalyon to this world. Our sole aim was to annihilate the orcs and their vile kin. Yet something went terribly wrong in the final hours of our war. Ultimately, this dark world was ripped asunder - and my dear friends were lost to the void."] =
"Много лет назад я и мои люди последовали за волшебником Кадгаром и паладином Туралионом в этот мир. Нашей единственной целью было уничтожить орков и их мерзких родственников. Однако в последние часы нашей войны что-то пошло не так. В конце концов, этот темный мир был разорван на части – и мои дорогие друзья потерялись в пустоте."
G["May the winds guide you, $N."] =
"Пусть ветры ведут тебя, $N."
G["Memories of this temple shroud my mind like a thick haze, yet I cannot assemble them into a coherent story. This place meant something to me once. Until I can restore that memory, I will feel as though a part of me is missing. Perhaps the draenei can help me recover what I've lost."] =
"Воспоминания об этом храме окутывают мой разум, словно густая дымка, но я не могу собрать их в связную историю. Когда-то это место что-то значило для меня. Пока я не смогу восстановить эту память, я буду чувствовать, будто какой-то части меня не хватает. Возможно, дренеи помогут мне вернуть то, что я потерял."
G["My captors were cruel beyond measure, $N. They would alternate between Lieutenant Kirith and I, torturing one while the other watched. During a lull in the activity of an especially brutal day, Kirith told me what had happened to my men and a plan he had been formulating to free them from their masters. They suffered a fate far worse than death, or even the pain Kirith and I endured."] =
"Мои похитители были безмерно жестоки, $N. Они поочередно чередовали меня и лейтенанта Кирита, пытая одного, пока другой наблюдал. Во время затишья в особенно жестокий день Кирит рассказал мне, что случилось с моими людьми, и план, который он разработал, чтобы освободить их от их хозяев. Их постигла судьба гораздо худшая, чем смерть или даже боль, которую мы с Киритом пережили."
G["My job is to care for these poor souls. I accept the help of any willing to lend a hand, be they Aldor or Scryer. We are so understaffed, I wouldn't turn an ogre away if they knew how to apply a tourniquet. The politics of the city are of little matter to me."] =
"Моя работа — заботиться об этих бедных душах. Я принимаю помощь любого, кто захочет протянуть руку помощи, будь то Алдор или Скрайер. У нас настолько не хватает персонала, что я бы не прогнал огра, если бы он умел накладывать жгут. Политика города не имеет для меня большого значения."
G["Nature is a powerful force, draenei. Those who seek to subdue never succeed in doing so permanently."] =
"Природа — могущественная сила, дренеи. Тем, кто стремится подчинить, никогда не удастся сделать это навсегда."
G["Neither you nor I could possibly imagine the pain an individual suffers when their soul is ripped from their body. They are not dead and by no means are they alive. Instead, they walk the land, servants of those that bind them to this world. Lord Razelikh, demonic overlord of these lands, enslaved them all. Nine he took for his own, placing stones of binding near the Dark Portal. The remaining nine were divided up between his subordinates."] =
"Ни вы, ни я не могли себе представить, какую боль испытывает человек, когда его душу отрывают от тела. Они не мертвы и ни в коем случае не живы. Вместо этого они ходят по земле, будучи слугами тех, кто привязывает их к этому миру. Лорд Разелих, демонический повелитель этих земель, поработил их всех. Девять из них он взял себе, положив связывающие камни возле Темного Портала. Остальные девять были разделены между его подчиненными."
G["Not long ago, this place was the site of a terrible battle. We of Nethergarde and the Argent Dawn held at bay a wave of demons, surging relentlessly from the Dark Portal. Those were dark days, full of bloodshed and despair... But the Kingdoms of Azeroth soon joined us and pushed the monsters back! The fighting continues on the far side of the Portal... This camp is now calm, but I fear the quiet here belies the madness found through that hellish gate."] =
"Не так давно на этом месте произошла страшная битва. Мы, жители Стражей Пустоты и Серебряного Рассвета, сдерживали волну демонов, неустанно хлынувшую из Темного Портала. Это были мрачные дни, полные кровопролития и отчаяния... Но вскоре Королевства Азерота присоединились к нам и отбросили монстров! Бои продолжаются на дальней стороне Портала... В этом лагере сейчас спокойно, но я боюсь, что тишина здесь скрывает безумие, которое можно найти за этими адскими вратами."
G["Oh, pay no mind to Buddy. He won't hurt you, he just likes to scratch now and then. He's just a big, loveable kitty. Aren't you Buddy? Yes, you are, you cute, little thing. You're mommy's little baby, that's what you are!"] =
"О, не обращай внимания на Бадди. Он не причинит тебе вреда, просто любит время от времени почесаться. Он просто большой и милый котёнок. Разве ты не Бадди? Да, ты такая милая, маленькая штучка. Ты маменькин сынок, вот кто ты!"
G["Only a mage can learn portal magic, shaman."] =
"Портальной магии может научиться только маг, шаман."
G["Orcs. It seems I've been fighting them all my life. Twenty years ago we shattered the Horde and tore down the walls of their Hellfire Citadel. We drove the vile greenskins to the very brink! After that, other than a few skirmishes the broken orcs never again posed a threat to us. Until now."] =
"Орки. Кажется, я боролся с ними всю свою жизнь. Двадцать лет назад мы разгромили Орду и разрушили стены их Цитадели Адского Пламени. Мы довели мерзких зеленокожих до самого края! После этого, за исключением нескольких стычек, сломленные орки больше никогда не представляли для нас угрозы. До настоящего времени."
G["Please, leave this place, $N. You know nothing of what troubles us..."] =
"Пожалуйста, покиньте это место, $N. Ты ничего не знаешь о том, что нас беспокоит..."
G["Progeny of Aegwynn, he that would be the last Guardian of Tirisfal... Medivh."] =
"Потомок Эгвинн, тот, кто станет последним Стражем Тирисфаля... Медив."
G["Race does not dictate honor, draenei. While you remain on my farmstead, I ask that you remember and respect this credo. I have known orcs who have been as honorable as the most noble of knights and humans who have been as vile as the most ruthless of Scourge. But I shall not bore you with tales of my youth! There is much work to be done - if that is what you desire."] =
"Раса не определяет честь, дреней. Пока вы остаетесь на моем подворье, я прошу вас помнить и уважать это кредо. Я знал орков, которые были такими же благородными, как самые благородные рыцари, и людей, которые были такими же мерзкими, как самые безжалостные из Плети. Но не буду утомлять вас рассказами о своей юности! Предстоит проделать большую работу – если вы этого желаете."
G["Sure thing, $N. You look like you can be trusted... Trustworthy! I can spot that a mile away... Anyway, back to what I was sayin'. Takes one Evoroot plant to make the Videre Elixir. The rest 'a the ingredients are trivial really, but the Evoroot, well, that can be a bit tricky to get."] =
"Конечно, $N. Выглядишь так, будто тебе можно доверять... Надежный! Я это вижу за милю... В общем, вернемся к тому, что я говорил. Для изготовления эликсира Видере требуется одно растение Эворут. Остальные ингредиенты на самом деле тривиальны, но Evoroot, ну, достать его может быть немного сложно."
G["Take your time, look the weapons over. I also repair weapons and armor if you need such services."] =
"Не торопитесь, осмотрите оружие. Также я ремонтирую оружие и броню, если вам нужны такие услуги."
G["Telredor has seen more change in the last 20 years than it did in prior centuries. I cannot complain, $N, for the world has changed far more in that time. The Light has brought me friends and companions I could not have met as a cloistered priest. Learn what you can of the past in your time here. It will help you to understand where your journey is leading you."] =
"За последние 20 лет в Телредоре произошло больше изменений, чем за предыдущие столетия. Я не могу жаловаться, $N, потому что мир за это время изменился гораздо сильнее. Свет принес мне друзей и товарищей, которых я не мог встретить, будучи священником в монастыре. Узнайте все, что вы можете о прошлом, находясь здесь. Это поможет вам понять, куда ведет вас ваше путешествие."
G["Telredor was once a secluded retreat for draenei priests and pilgrims. The resident priests seldom received visitors. When the orcs started to attack draenei settlements, refugees began to arrive in larger numbers. Anchorite Ahuurn and the others transformed Telredor from a shrine into a safe haven. Many draenei, myself included, owe our survival to his efforts."] =
"Телредор когда-то был уединенным убежищем для жрецов и паломников дренеев. Местные священники редко принимали посетителей. Когда орки начали атаковать поселения дренеев, беженцев стало прибывать в большем количестве. Анахорит Ахуурн и другие превратили Телредор из святилища в безопасное убежище. Многие дренеи, включая меня, обязаны своим выживанием его усилиям."
G["Thank goodness for you! Claw and I were investigating this place when we were jumped by Swamplord Musel'ek. He can control animals, even druids! Unfortunately, Claw was caught in bear form at the time, and is now the swamplord's pet. I don't dare change into cat form or he'll get me too! I'm afraid you'll have to fight Claw in order to save him. Just keep heading west; you can't miss him."] =
"Слава Богу за вас! Мы с Когтем исследовали это место, когда на нас напал Болотный Лорд Мусель'ек. Он может управлять животными, даже друидами! К сожалению, в то время Коготь был пойман в облике медведя, и теперь он является домашним питомцем болотного лорда. Я не смею принимать облик кошки, иначе он схватит и меня! Боюсь, тебе придется сразиться с Когтем, чтобы спасти его. Просто продолжайте идти на запад; ты не можешь его пропустить."
G["The Argent Dawn might be impotent idealists but their delusional leader knows that they are outmatched. I have been sent here as an emissary of the Scarlet Crusade. An ambassador, if you will... It is doubtful that we could even dent the armies of Kel'Thuzad - united or not - but we might be able to contain them long enough for some sort of miracle to happen. As for me? I'll die in battle... <Marjhan shrugs.>"] =
"Серебряный Рассвет, возможно, и бессильные идеалисты, но их бредовый лидер знает, что они превзойдены. Меня послали сюда в качестве эмиссара Алого Ордена. Посол, если хотите... Сомнительно, что мы сможем хоть как-то сломить армии Кел'Тузада - объединенные или нет - но мы, возможно, сможем сдерживать их достаточно долго, чтобы произошло какое-то чудо. Что касается меня? Я погибну в бою... <Марджан пожимает плечами.>"
G["The Illidari demons keep me here because of my knowledge of ancient draenei crystals and relics. They've enslaved many of my people and use us to look for a powerful crystal... one that in all likelihood is not even here."] =
"Демоны Иллидари держат меня здесь из-за моих знаний о древних кристаллах и реликвиях дренеев. Они поработили многих моих людей и используют нас для поиска мощного кристалла... которого, по всей вероятности, здесь даже нет."
G["The Light protect you, shaman."] =
"Свет защитит тебя, шаман."
G["The archmage Allistarj of the Shadowsworn was granted three. Lady Sevine, warlock of the Shadowsworn was also granted three. The remaining three were given to Grol the Destroyer, lord of the Dreadmaul ogres of these blasted lands. You see, $N, without a soul, the body cannot be killed. The remnants of my men are now indestructible fighting units. Thankfully, they are bound in how far they can travel by the stones of binding."] =
"Архимаг Аллистардж из Клятвы Теней получил три. Леди Севина, колдунья Присягнувших Тени, также получила три. Остальные три были отданы Гролу Разрушителю, повелителю огров Молота Ужаса в этих выжженных землях. Видишь ли, $N, без души тело невозможно убить. Остатки моих людей теперь представляют собой несокрушимые боевые единицы. К счастью, они связаны камнями связывания, как далеко они могут путешествовать."
G["The corruption of a fallen titan. The corruption of the Destroyer. After all, the staff was forged from the seed of hate. That is, of course, what has brought me here..."] =
"Порча падшего титана. Порча Разрушителя. В конце концов, посох был выкован из семени ненависти. Это, конечно, то, что привело меня сюда..."
G["The extent of the corruption in Outland is truly astonishing, shaman. The Cenarion Circle hopes to understand how these creatures have managed to survive. Studying this broken, tortured land and its inhabitants may yet teach us how to heal ailing parts of our own world."] =
"Масштабы коррупции в Запределье поистине поразительны, шаман. Круг Кенария надеется понять, как этим существам удалось выжить. Изучение этой разрушенной, измученной земли и ее обитателей еще может научить нас, как исцелять больные части нашего собственного мира."
G["The heroics of the Trollbane bloodline are legendary. I idolize the man. And to find him alive, in the Outland... <Romus gazes past you.> When I first saw him, I nearly fainted. The shock was overwhelming. As I knelt before him, I had to fight back tears. You can bet your sweet behind that I'm going to do everything in my power to make sure the Sons of Lothar are kept safe."] =
"О героизме рода Троллбэйнов ходят легенды. Я боготворю этого человека. И найти его живым в Запределье... <Ромус смотрит мимо вас.> Когда я впервые увидел его, я чуть не потерял сознание. Шок был ошеломляющим. Стоя перед ним на коленях, мне пришлось сдерживать слезы. Можете поспорить, что я сделаю все, что в моих силах, чтобы обеспечить безопасность Сынов Лотара."
G["The men and women of Honor Hold have shed such blood and have lost their youth in this monstrous land... and yet they still hold their spirits high! Now, you and your cohorts from Azeroth can help us turn the tide. You give us hope that we may one day return to our homelands."] =
"Мужчины и женщины Оплота Чести пролили столько крови и потеряли свою молодость на этой чудовищной земле… и все же они все еще сохраняют свой дух! Теперь вы и ваши соратники из Азерота можете помочь нам переломить ситуацию. Вы даете нам надежду, что однажды мы сможем вернуться на родину."
G["The plaguelands are an excellent place to strike against the Scourge!"] =
"Чумные земли — отличное место для борьбы с Плетью!"
G["The view from the top of Telredor is magnificent, isn't it?"] =
"Вид с вершины Телредора великолепен, не правда ли?"
G["There is not much more to tell. Dalaran was nearly wholly destroyed by Archimonde, the staff lost, presumably shattered by the barrier's fail-safe mechanisms. There are those that believe the staff to be the cause of Archimonde's reprisal."] =
"Больше нечего рассказать. Даларан был почти полностью уничтожен Архимондом, посох потерян, предположительно разрушенный механизмами безопасности барьера. Есть те, кто считает, что причиной расправы Архимонда стал посох."
G["They are exactly what you need to destroy in order to free the regiment! As I had told you earlier, Kirith had a plan. Each of the servants does have a weakness. Punish their physical form in proximity of their stones until they are near the state of disintegration. It is at that point, and that point alone, that the stones of binding are vulnerable to attack. You must hurry to destroy the stones, however, as once the enslaved regain their composure, they will be invulnerable to harm once more."] =
"Именно их вам и нужно уничтожить, чтобы освободить полк! Как я уже говорил вам ранее, у Кирита был план. У каждого из слуг есть слабость. Наказывайте их физическую форму рядом с их камнями, пока они не приблизятся к состоянию распада. Именно в этой точке, и только в этой точке, камни связывания уязвимы для атак. Вы должны поспешить уничтожить камни, однако, как только порабощенные обретут самообладание, они снова станут неуязвимыми."
G["Those filthy beasts are all over the place. If you prefer hunting outdoors, you'll find most of them around Plaguewood and Terrordale, with a good concentration of them in the Terrorweb tunnel. They are also likely to appear at almost any Scourge encampment in the Eastern Plaguelands. If you're a hearty dungeon crawler, you'll find a good lot of them in Stratholme and a few of the necrofiend variety in Scholomance."] =
"Эти грязные твари повсюду. Если вы предпочитаете охотиться на открытом воздухе, вы найдете большинство из них в окрестностях Чумного леса и Террордейла, а также большую их концентрацию в туннеле Террорпаутины. Они также могут появиться практически в любом лагере Плети в Восточных Чумных землях. Если вы заядлый бродяга по подземельям, вы найдете их немало в Стратхольме и несколько представителей некрофидов в Некроситете."
G["Time is running out for me... for us all..."] =
"Время истекает для меня... для всех нас..."
G["Walk always in the Light, $N."] =
"Ходите всегда во Свете, $N."
G["Watch your step, draenei. We of the Brotherhood of the Light are not as lenient as our brethren when it comes to meting justice to those that would do this world wrong. Woe unto those that would anger Korfax. Now if you have no business with me or the other members of the Brotherhood, please leave so that we may continue our meeting."] =
"Следи за своим шагом, дреней. Мы, члены Братства Света, не столь снисходительны, как наши братья, когда дело доходит до справедливости по отношению к тем, кто причиняет вред этому миру. Горе тем, кто разозлит Корфакса. А теперь, если у вас нет никаких дел со мной или другими членами Братства, пожалуйста, уходите, чтобы мы могли продолжить нашу встречу."
G["We don't know much about the burning of the Shady Rest Inn, except that James Hyal's wife and child were unable to escape. We managed to drag James out, but he hasn't been the same since. We have many leads but not much evidence. It is our hope that through the efforts of the guard and the vigilant help of the people of Theramore, we will unravel this terrible crime. If you would like to lend assistance to the investigation, what remains of the inn can be found at the border to the Barrens."] =
"Нам мало что известно о сожжении гостиницы «Шейди Рест», за исключением того, что жена и ребенок Джеймса Хайала не смогли спастись. Нам удалось вытащить Джеймса, но с тех пор он уже не тот. У нас есть много версий, но мало доказательств. Мы надеемся, что усилиями стражи и неусыпной помощью жителей Терамора мы раскроем это ужасное преступление. Если вы хотите оказать помощь в расследовании, то, что осталось от гостиницы, можно найти на границе со Степями."
G["We have all been witness to terrible tragedies, but we must not let them drag us to despair. Instead, hold those memories close so that one day, we might find a reckoning."] =
"Мы все были свидетелями ужасных трагедий, но мы не должны позволить им довести нас до отчаяния. Вместо этого держите эти воспоминания близко к себе, чтобы однажды мы могли найти расплату."
G["We must discover what's behind the mystery of the giant crystal that fell from the heavens on Fallen Sky Ridge."] =
"Мы должны раскрыть тайну гигантского кристалла, упавшего с небес на Гряду Павших Небес."
G["We, the Sons of Lothar, have remained here ever since - fighting... dying... praying that a day like today would come - a day when the Portal would open and our brothers would come to deliver us home. Overjoyed as we are, duty still calls. There is much to be done before we can depart this world and take our rest."] =
"Мы, Сыны Лотара, с тех пор остаемся здесь — сражаемся… умираем… молимся, чтобы наступил такой день, как сегодня — день, когда Портал откроется и наши братья придут, чтобы доставить нас домой. Как бы мы ни были счастливы, долг все еще зовет нас. Еще многое предстоит сделать, прежде чем мы сможем покинуть этот мир и отдохнуть."
G["Welcome to Light's Hope Chapel, stranger."] =
"Добро пожаловать в часовню Последней Надежды, незнакомец."
G["Welcome to Stormwind! I am one of the city's officers, aiding the citizenry of the city through our census bureau. If you are in need of locating someone specific, then I might be able to assist you. Through arcane methods and sharpened mental discipline, I am able to access these records. If you have business with me, then please proceed!"] =
"Добро пожаловать в Штормград! Я один из городских чиновников, помогающий жителям города через наше бюро переписи населения. Если вам нужно найти кого-то конкретного, возможно, я смогу вам помочь. Благодаря тайным методам и обостренной умственной дисциплине я могу получить доступ к этим записям. Если у вас есть ко мне дело, то, пожалуйста, продолжайте!"
G["Welcome to Telredor, shaman. If you need anything, don't hesitate to ask."] =
"Добро пожаловать в Телредор, шаман. Если вам что-нибудь понадобится, не стесняйтесь спрашивать."
G["Welcome to the Orebor Harborage, friend. You have nothing to fear here. We are Broken, but we are not your enemies. I am Ikuti of the Kurenai, a group of Broken who desire to reestablish ties with our draenei brothers and their newfound allies."] =
"Добро пожаловать в убежище Оребор, друг. Здесь вам нечего бояться. Мы Сломлены, но мы не ваши враги. Я Икути из Куренай, группы Сломленных, желающих восстановить связи с нашими братьями-дренейами и их новообретенными союзниками."
G["Well met, shaman. I'm learning the art of gryphon handling from Baldruc over there. One day, I hope to run my own stable of gryphons."] =
"Приятно познакомиться, шаман. Я учусь искусству обращения с грифонами у Бальдрука. Когда-нибудь я надеюсь завести собственную конюшню грифонов."
G["Well met, shaman. My advice to you is this: as you travel the world, be wary of magic for it will burn the untrained."] =
"Приятно познакомиться, шаман. Мой вам совет таков: путешествуя по миру, остерегайтесь магии, поскольку она сожжет неподготовленного человека."
G["What can you do at an inn? Well when you stay at an inn, you rest very comfortably. Because of this, you will become \"well rested\" much more quickly than you would in the wilderness. When you are well rested, you learn more from experience. You may also speak with any innkeeper to get a hearthstone, and can later use the hearthstone in order to quickly return to that inn."] =
"Что можно делать в гостинице? Что ж, когда вы останавливаетесь в гостинице, вы отдыхаете очень комфортно. Благодаря этому вы «отдохнете» гораздо быстрее, чем в пустыне. Когда вы хорошо отдохнули, вы многому научитесь на собственном опыте. Вы также можете поговорить с любым трактирщиком, чтобы получить камень возвращения, а позже использовать его, чтобы быстро вернуться в эту гостиницу."
G["What followed were a series of tragic events, leading to the death of every Kirin Tor mage that came into contact with Atiesh. You see, it was an artifact with sentience. A sentience granted to it by Sargeras..."] =
"За этим последовала серия трагических событий, приведших к гибели каждого мага Кирин-Тора, вступившего в контакт с Атиешем. Видите ли, это был разумный артефакт. Чувство, дарованное ему Саргерасом..."
G["What for? If Illidan's demons don't catch me and enslave me again, then the naga of Zangarmarsh will. Joining Illidan and his allies has turned out to mean nothing but slavery to most of the Broken tribes. There is no hope for my people."] =
"Зачем? Если демоны Иллидана не поймают меня и не поработят снова, то это сделают наги Зангартопи. Присоединение к Иллидану и его союзникам, как оказалось, означало не что иное, как рабство для большинства племен Сломленных. У моего народа нет надежды."
G["What is the Brotherhood of the Light? Well... We are all members of the Argent Dawn at the core - members of the Argent Dawn that aren't held in check by morals, guilt and useless human emotion. Consider us Scarlet Crusade minus the stupidity, lack of leadership, and blind zealotry. Don't let the Scarlet Commander tell you otherwise. And don't let Tyrosus know I said that... It would be a terrible shame if I had to brutally maim him should a brawl break out."] =
"Что такое Братство Света? Что ж... По своей сути мы все члены Серебряного Рассвета – члены Серебряного Рассвета, которых не сдерживают мораль, чувство вины и бесполезные человеческие эмоции. Представьте нас, Алый Орден без глупости, отсутствия лидерства и слепого фанатизма. Не позволяйте командиру Алого ордена говорить вам обратное. И пусть Тирос не знает, что я это сказал... Было бы ужасно жаль, если бы мне пришлось жестоко покалечить его, если бы началась драка."
G["What's that Private? You want your mommy? Well too bad. Maybe you should pay a visit to the Thrallmar officer's club to get her back?"] =
"Что такое, рядовой? Хочешь к мамочке? Ну очень плохо. Может быть, вам стоит посетить офицерский клуб Траллмара, чтобы вернуть ее?"
G["Would you believe that in my darkest hour, at the apex of my being, I failed. As I fled from the wanton destruction of the forces that overwhelmed us, the only sounds I could hear were the screams of my soldiers and the rapid beat of my own heart. A short while later, I returned to the Blasted Lands in hopes of rescuing my men and restoring my honor. Instead I was captured and beaten until dead. What I found out during my inquisition and subsequent torture was horrifying."] =
"Поверите ли вы, что в самый темный час моей жизни, на пике своего существования, я потерпел неудачу. Когда я бежал от бессмысленного уничтожения подавляющих нас сил, единственными звуками, которые я мог слышать, были крики моих солдат и быстрое биение моего собственного сердца. Некоторое время спустя я вернулся в Выжженные Земли в надежде спасти своих людей и восстановить свою честь. Вместо этого меня схватили и избили до смерти. То, что я узнал во время дознания и последующих пыток, было ужасающим."
G["Yer no warrior... Why ye wouldn't even last a day under my training regimen! A shaman who thinks he's a warrior. Ha!"] =
"Да нет, воин... Почему ты не продержался и дня при моем режиме тренировок! Шаман, который думает, что он воин. Ха!"
G["You wish to speak to me, draenei?"] =
"Ты хочешь поговорить со мной, дреней?"
G["Ysiel expected some enemy opposition to her foray into Outland. That's why us wardens were brought along. We never expected our opposition to come in the strength or numbers that the naga have shown."] =
"Исиэль ожидала, что ее набегу на Запределье будет противодействовать враг. Вот почему нас, надзирателей, взяли с собой. Мы никогда не ожидали, что наше сопротивление окажется таким сильным или численным, как наги."
G["Shaman, hold your attack, this is just a disguise! I'm a spy working for the Lower City coalition out of Shattrath City. I hope you're here to help!"] =
"Шаман, останови атаку, это всего лишь маскировка! Я шпион, работаю на коалицию Нижнего Города из Шаттрата. Надеюсь, ты здесь, чтобы помочь!"
G["Tell me of the Sons of Lothar."] =
"Расскажи мне о Сынах Лотара."
G["We've a duty out here, boy, to see to it that we don't let anyone surprise us. That means proactive action!"] =
"У нас здесь есть долг, парень: следить, чтобы нас никто не застал врасплох. А значит — действовать на опережение!"
G["I hope this place pans out as a forward base for Shadow Council operations. I know it sounds weird, but I kind of miss the Shadow Labyrinth."] =
"Надеюсь, это место сгодится как передовая база для операций Совета Теней. Знаю, звучит странно, но я вроде как скучаю по Лабиринту Теней."
G["What are you staring at, draenei?"] =
"Чего уставился, дреней?"
G["Do you like fish, draenei? I have fish here. If you like fresh fish, the freshest, come and sample my wares."] =
"Любишь рыбу, дреней? У меня тут есть рыба. Если любишь свежую рыбу, самую свежую, — подходи, попробуй мой товар."
G["These wastes are scarred by terrible magic. We must do what we can to heal this great wound."] =
"Эти пустоши изранены ужасной магией. Мы должны сделать всё возможное, чтобы исцелить эту великую рану."
G["<Sal'salabim growls at you, then goes back to drinking his frothy beverage.>"] =
"<Сал'салабим рычит на вас, а затем возвращается к своему пенному напитку.>"
G["Just browsing my wares or is there something specific I can help you find today?"] =
"Просто разглядываешь товар или тебе помочь найти что-то конкретное?"
G["I came to this land to cleanse troubled spirits, but after the attack I fear that my mission has failed. So many have been taken by the wastes. Please, you must help them."] =
"Я пришёл в эти земли, чтобы очистить страждущие души, но после нападения боюсь, что моя миссия провалилась. Столько душ поглотили пустоши. Прошу, ты должен помочь им."
G["Yes, private, what matter of import do you have to bring to my attention?"] =
"Да, рядовой, какое важное дело ты хочешь до меня донести?"
G["Who are you? What do you want here?"] =
"Кто ты? Что тебе здесь нужно?"
G["Why did you do this to us?"] =
"Зачем ты так с нами поступил?"
G["Auchindoun is home to my ancestor's spirits. We might not look it, but all Broken were once draenei... our spirits are all the same."] =
"Аукиндон — обитель духов моих предков. Пусть по нам и не скажешь, но все Сломленные когда-то были дренеями... души у нас у всех одинаковые."
G["What are you doing there?"] =
"Что ты там делаешь?"
G["Oh no, not you again! Go away!"] =
"О нет, снова ты! Уходи!"
G["Grant me your mark, mighty ancient."] =
"Даруй мне свою метку, могучий древень."
G["Why are you fixing all of this up?"] =
"Зачем ты всё это чинишь?"
G["I'm going to figure out what this shadowy group is up to no matter what!"] =
"Я во что бы то ни стало выясню, что затевает эта теневая шайка!"
G["Scryers Bank"] =
"Банк Провидцев"
G["I wish to make Honor Hold my home, Sid."] =
"Я хочу сделать Оплот Чести своим домом, Сид."
G["If you're expecting some kind of official welcome, you're going to be disappointed, shaman. We don't stand on tradition, here. What works is what goes."] =
"Если ждёшь какого-то официального приёма, то будешь разочарован, шаман. Мы тут не держимся за традиции. Что работает — то и годится."
G["Welcome. Will you take your rest here, or perhaps a meal?"] =
"Добро пожаловать. Желаешь отдохнуть здесь или, может быть, перекусить?"
G["Have you honed your skills enough to learn what I have to teach?"] =
"Достаточно ли ты отточил своё мастерство, чтобы усвоить то, чему я могу научить?"
G["Flight Master"] =
"Распорядитель полётов"
G["There are two banks in Shattrath, both along the rim of the central city hub. One is run by the draenei Aldor, the other by the blood elf Scryers."] =
"В Шаттрате два банка, оба по краю центральной части города. Одним заправляют дренеи-Алдоры, другим — эльфы крови из Провидцев."
G["I can instruct you in jewelcrafting. Interested?"] =
"Я могу обучить тебя ювелирному делу. Интересно?"
G["Practicing! Soon I'll be good enough to join the other summoners and take my turn inside the Shadow Labyrinth at Auchindoun. I hope that I'll get the chance to summon something big! Maybe something as big as Murmur, though I wouldn't lose control of him!"] =
"Тренируюсь! Скоро я стану достаточно умел, чтобы присоединиться к другим призывателям, и настанет мой черёд войти в Лабиринт Теней в Аукиндоне. Надеюсь, мне выпадет шанс призвать что-нибудь большое! Может, такое же большое, как Мурмур, — но уж я-то не потеряю над ним контроль!"
G["Well met, warlock. My advice to you is this: as you travel the world, be wary of magic for it will burn the untrained."] =
"Приветствую, чернокнижник. Мой тебе совет: странствуя по миру, остерегайся магии — она обжигает неумелых."
G["Please, sit and make yourself comfortable."] =
"Прошу, присаживайся и устраивайся поудобнее."
G["What can I do at an inn?"] =
"Что можно делать в таверне?"
G["Be careful going into the thicket, shaman. There is a harmful aura lingering about the place. It must be the residue from whatever destroyed my fellow druids."] =
"Будь осторожен, входя в чащу, шаман. Над этим местом висит пагубная аура. Должно быть, это след того, что погубило моих собратьев-друидов."
G["The World's End Tavern has nothing to offer those of my kind. However, I find that it attracts the type of clientele that are interested in what I have for sale. I specialize in exotic engineering goods acquired from far and wide. From time to time I might even have a rare thing or two for purchase. What might I interest you in?"] =
"Таверна «Край света» ничего не может предложить таким, как я. Однако я замечаю, что она привлекает как раз ту публику, которую занимает мой товар. Я специализируюсь на экзотических инженерных штуковинах, добытых по всему свету. Порой у меня даже найдётся редкая вещица-другая на продажу. Чем могу тебя заинтересовать?"
G["Advisor, what's the latest news?"] =
"Советник, какие последние новости?"
G["Romus informed me of the tragedies that beset my beautiful city. There are no fitting words for the sorrow I felt upon hearing of Lordaeron's fate - and the fate of my own, beloved Stromgarde. Twenty years ago, no one had heard of the 'Burning Legion'... Damn those cursed devils! Rest assured, $N; should I ever return to Azeroth, Stromgarde will once more rise as a force of reckoning. This I swear..."] =
"Ромус поведал мне о бедах, обрушившихся на мой прекрасный город. Нет слов, что передали бы скорбь, которую я испытал, узнав о судьбе Лордерона — и о судьбе моего любимого Стромгарда. Двадцать лет назад никто и не слыхал о «Пылающем Легионе»... Будь прокляты эти изверги! Не сомневайся, $N: если я когда-нибудь вернусь в Азерот, Стромгард вновь восстанет как грозная сила. В этом я клянусь..."
G["What's it look like I'm doing? I'm fixing the place up - all on my own I might add - so that we can move in! With a base of operations out here in the forest, it'll be easier to keep track of what Shattrath, Allerian, Stonebreaker and the Cenarion druids are all up to. Our base in Auchindoun is just too inconvenient for that. Wait a minute, do I know you?"] =
"А на что это похоже? Привожу тут всё в порядок — заметь, в одиночку, — чтобы мы могли сюда перебраться! С базой операций здесь, в лесу, будет проще следить за тем, что затевают Шаттрат, Аллерия, Оплот Камнеломов и друиды Кенария. Наша база в Аукиндоне для этого попросту слишком неудобна. Погоди-ка, разве я тебя знаю?"
G["Welcome, $N. We are the Aldor, priests of the Light and servants of the Sha'tar. You are welcome to stay with us for as long as you need."] =
"Добро пожаловать, $N. Мы — Алдоры, жрецы Света и слуги Ша'тар. Оставайся с нами столько, сколько потребуется."
G["Welcome to the Allerian Stronghold, $N."] =
"Добро пожаловать в Аллерийский Оплот, $N."
G["I would like to train."] =
"Я хотел бы обучиться."
G["Alchemy Lab"] =
"Алхимическая лаборатория"
G["Hi! Do you think you might help me to get out of here?"] =
"Привет! Как думаешь, ты мог бы помочь мне выбраться отсюда?"
G["Very busy... very busy! What?"] =
"Очень занят... очень занят! Ну что?"
G["Yeah, what do you want? Can't you see I'm busy here? The Shadow Council isn't paying me by the hour!"] =
"Ну, чего тебе? Не видишь, я занят? Совет Теней мне не по часам платит!"
G["Tell me of your homeland."] =
"Расскажи мне о своей родине."
G["Hey, citizen! You look like a stout one. We guards are spread a little thin out here, and I could use your help..."] =
"Эй, гражданин! С виду ты крепкий малый. Нас, стражников, тут маловато, и мне бы пригодилась твоя помощь..."
G["<A soothing light fills you as you approach the naaru. Slow musical chimes echo within your mind and, though a word is not uttered, you feel an assurance of safety. You are welcome in Shattrath City.>"] =
"<Умиротворяющий свет наполняет вас, когда вы приближаетесь к наару. Медленный музыкальный перезвон отзывается в вашем сознании, и, хотя не произнесено ни слова, вы ощущаете уверенность в своей безопасности. Вам рады в городе Шаттрат.>"
G["The war against the Horde has reached full tilt, $N. This is a time of great need for the Alliance and it's necessary that all of us do our part to help."] =
"Война с Ордой разгорелась в полную силу, $N. Для Альянса настали тяжёлые времена, и каждый из нас должен внести свою лепту."
G["The Horde isn't the only danger in this forest. Don't let its seeming tranquility fool you."] =
"Орда — не единственная опасность в этом лесу. Не дай его мнимому спокойствию себя обмануть."
G["Welcome to Shattrath City, seat of the Sha'tar in Outland. You seek guidance?"] =
"Добро пожаловать в город Шаттрат, оплот Ша'тар в Запределье. Ищешь наставления?"
G["The Aldor bank is located northwest of the the city's center."] =
"Банк Алдоров находится к северо-западу от центра города."
G["Oh, what a sacred place is here overthrown!"] =
"О, какое священное место здесь низвергнуто!"
G["Well, I was just giving our leader here a progress report on how everything is proceeding according to plan. It should only be a few more weeks and we'll have this place back in shape. We may want the Shadow Council to only staff the village with orcs, however. That way we can make an ancestral claim and work undercover. Wait a minute. Do I know you? What's your name?"] =
"Ну, я как раз докладывал нашему предводителю, как всё идёт по плану. Ещё пара недель — и мы приведём это место в порядок. Хотя, пожалуй, стоит попросить Совет Теней заселить деревню одними орками. Так мы сможем заявить на неё родовые права и работать под прикрытием. Погоди-ка. Разве я тебя знаю? Как тебя зовут?"
G["And what is it exactly that you think I can do for you? Can't you see that I'm very busy here discussing matters of import with our illustrious leader? Be quick about your business or I'll have you beaten, dog!"] =
"И что же, по-твоему, я могу для тебя сделать? Не видишь, я тут занят — обсуждаю важные дела с нашим прославленным предводителем? Говори, что тебе нужно, да поживее, не то прикажу тебя вздуть, пёс!"
G["Do they never rest?! If we're to secure a future for the people of the Lower City, we must deal with the Shadow Council before they cause an even greater cataclysm than the Bone Wastes! Because the leadership of Shattrath City will not move quickly, we the free people of the Lower City have taken matters into our own hands. But our spies have been discovered. We will hold off the Shadow Council's agents while you slip into the labyrinth and see what you can uncover."] =
"Неужели они никогда не угомонятся?! Если мы хотим обеспечить будущее народу Нижнего Города, нужно разобраться с Советом Теней прежде, чем они устроят катаклизм пострашнее Костяных Пустошей! Раз уж власти Шаттрата не спешат действовать, мы, вольный народ Нижнего Города, взяли дело в свои руки. Но наших шпионов раскрыли. Мы задержим агентов Совета Теней, пока ты проберёшься в лабиринт и разузнаешь, что сможешь."
G["No, don't feel bad. I get that a lot. <Taela looks both amused and annoyed.> I'm a HIGH elf, not a blood elf. Don't worry, I'm not going to suck all of the magic out of you."] =
"Нет-нет, не смущайся. Мне часто так говорят. <Таэла выглядит одновременно позабавленной и раздражённой.> Я ВЫСШАЯ эльфийка, а не эльфийка крови. Не бойся, я не собираюсь высасывать из тебя всю магию."
G["\"Born from light\" would be a close translation for Sha'tar. It is the name we gave to the naaru who reclaimed Shattrath City from the agents of Illidan."] =
"«Рождённые из света» — так примерно переводится Ша'тар. Это имя мы дали наару, что отвоевали город Шаттрат у прислужников Иллидана."
G["Sid's the name. It's nice to see some new faces around here. What can I do you for?"] =
"Меня звать Сид. Приятно видеть тут новые лица. Чем могу помочь?"
G["I am interested in warlock training."] =
"Меня интересует обучение чернокнижника."
G["Inn"] =
"Таверна"
G["The arcane only corrupts those who are weak. Even if you do not follow the path of the warlock, you would do well to remember that."] =
"Тайная магия развращает лишь слабых. Даже если ты не идёшь путём чернокнижника, тебе не помешает это помнить."
G["Let's see what you have."] =
"Посмотрим, что у тебя есть."
G["Show me your wares, Maktu."] =
"Покажи свой товар, Макту."
G["Welcome to the Allerian Stronghold, shaman."] =
"Добро пожаловать в Аллерийский Оплот, шаман."
G["When I first arrived, I'd hoped to meet the town's namesake. <Ros'eleth glances around.> Most young high elves outgrow the 'I wanna be a Farstrider' phase by the time they're taken as apprentices. Then, it's onto the 'I'm going to be a magister' stage. I don't think I ever quite outgrew the Farstrider phase, to be honest. No one dreams of growing up to be a seamstress, but we can't have the Farstriders running around naked, as my mother used to say."] =
"Когда я только прибыла, я надеялась встретить того, в чью честь назван этот город. <Рос'элет оглядывается по сторонам.> Большинство юных высших эльфов перерастают пору «хочу быть Странником» ещё до того, как их берут в ученики. Потом наступает пора «стану магистром». Честно говоря, я, кажется, так и не переросла пору Странника. Никто не мечтает стать швеёй, но не бегать же Странникам нагишом, как говаривала моя матушка."
G["Who are the Sha'tar?"] =
"Кто такие Ша'тар?"
G["Gem Merchant"] =
"Торговец самоцветами"
G["My early classes are always filled with bright-eyed young lads. Few make it past the first test, though. I've given up on shouting, 'when I yell vanish, you need to vanish.' They never listen. Now, the test simply kills the inept."] =
"Мои первые занятия всегда полны юнцов с горящими глазами. Вот только мало кто проходит первое испытание. Я уже бросил кричать: «когда я ору „исчезни“ — ты должен исчезнуть». Они не слушают. Теперь испытание просто убивает неумех."
G["Yes? Darn it all, now I'll have to start over from scratch!"] =
"Да? Проклятье, теперь придётся начинать всё сначала!"
G["<more>"] =
"<ещё>"
G["Have you seen the way Ros'eleth winks at me whenever I go to pick up a garment or hat? When things settle down around here, I'm going to take her for a nice walk in the woods. For once, I miss all those fancy taverns in Stormwind."] =
"Ты видел, как Рос'элет подмигивает мне всякий раз, когда я захожу за одеждой или шляпой? Когда тут всё утихнет, я поведу её на славную прогулку по лесу. Впервые я скучаю по всем этим шикарным тавернам Штормграда."
G["Bank"] =
"Банк"
G["Dinner guests should show more respect!"] =
"Гостям за ужином следует вести себя почтительнее!"
G["With new enemies on our doorsteps, we must not allow our ancient enemies to take advantage of our situation!"] =
"Когда новые враги у нашего порога, нельзя позволить давним врагам воспользоваться нашим положением!"
G["With the Allerian Stronghold surrounded by enemies on all sides it's time for us to take the fight to them."] =
"Раз Аллерийский Оплот окружён врагами со всех сторон, самое время перейти в наступление."
G["Mana Loom"] =
"Ткацкий станок маны"
G["Now that I've been beaten to within an inch of my life what do you want?"] =
"Ну, меня избили до полусмерти — так чего тебе надо?"
G["If you're interested, a couple of us are going into Shattrath for drinks later."] =
"Если интересно, попозже несколько наших собираются в Шаттрат пропустить по стаканчику."
G["Aldor Bank"] =
"Банк Алдоров"
G["World's End Tavern"] =
"Таверна «Край света»"
G["WUT YOU WANT!?"] =
"ЧË ТЕ НАДА?!"
G["Empoor, you're going to tell me what I want to know, or else!"] =
"Эмпур, ты расскажешь мне то, что я хочу знать, иначе тебе несдобровать!"
G["The Lightwarden's job is twofold. Protect the priesthood at all costs first and foremost. Destroy the enemies of the Light wherever they may hide second."] =
"У Стража Света две задачи. Первая и главная — любой ценой защищать жречество. Вторая — уничтожать врагов Света, где бы они ни прятались."
G["The opening of the Dark Portal brought news of my people's fate. In a way, my exile shielded me from sharing in their downfall, but to see the Farstriders throw their lot in with Kael'thas... I never imagined my one-time brethren capable of such a thing. The homecoming I once dreamt of will never happen. This forest is the only home I have left."] =
"С открытием Темного портала пришли вести о судьбе моего народа. В каком-то смысле изгнание уберегло меня от их участи, но видеть, как Странники связали свою судьбу с Кель'тасом... Я и представить не мог, что мои некогда братья способны на такое. Возвращению домой, о котором я когда-то мечтал, не бывать. Этот лес — единственный дом, что у меня остался."
G["What is your major malfunction?!"] =
"Да что с тобой не так?!"
G["Shattrath is more than a staging ground for war against the Burning Legion and Illidan. It serves as a sanctuary to those seeking to escape the violence surrounding us. We would be hypocrites if we turned the refugees away. If your question refers to the Scryers, then I will respond that while I may not like them or their leader's wild claims of visions of redemption, it is not for us to question the wisdom of the naaru. These are difficult times, $N. We need allies where we can find them."] =
"Шаттрат — не просто плацдарм для войны с Пылающим Легионом и Иллиданом. Он служит убежищем для тех, кто ищет спасения от окружающего нас насилия. Мы были бы лицемерами, если бы прогнали беженцев. Если твой вопрос о Провидцах, то отвечу так: пусть мне и не по душе ни они, ни безумные заявления их вождя о видениях искупления, — не нам оспаривать мудрость наару. Настали трудные времена, $N. Союзники нужны нам всюду, где их можно найти."
G["It is said that those who are blessed by the spirits of Auchindoun possess the ability to capture powerful souls in the form of Spirit Shards. I have come across a few of these Spirit Shards throughout my travels but have yet to unlock their secrets. The only thing I have been able to discern is that they seem to originate from the depths of Auchindoun itself. If you happen to come across any of these Spirit Shards I'm sure I could make it worth your while to allow me to take them off your hands..."] =
"Говорят, что благословлённые духами Аукиндона способны заключать могущественные души в Осколки душ. За свои странствия я раздобыл несколько таких Осколков душ, но их тайны мне пока не открылись. Всё, что мне удалось понять, — что происходят они, похоже, из самых недр Аукиндона. Если тебе доведётся наткнуться на такие Осколки душ, уверен, я сумею вознаградить тебя за то, что ты уступишь их мне..."
G["We'll get to the bottom of this massacre if it's the last thing we do!"] =
"Мы доберёмся до сути этой резни, чего бы нам это ни стоило!"
G["Isn't Shattrath a draenei city? Why do you allow others here?"] =
"Разве Шаттрат не город дренеев? Почему вы пускаете сюда чужаков?"
G["I can teach you how to cook!"] =
"Я могу научить тебя готовить!"
G["I would like to take a look at your wares, Sid."] =
"Я хотел бы взглянуть на твой товар, Сид."

G["$N! Come here! Surely you know of the battle that rages within Alterac Valley back on Azeroth. We need every able-bodied fighter we can muster. Fight with the Stormpike Guard and defeat the Frostwolves!"] = "$N! Иди сюда! Наверняка ты знаешь о битве, которая бушует в Альтеракской долине на Азероте. Нам нужен каждый боеспособный боец, которого мы можем собрать. Сразись со стражей Грозовой Вершины и разбей клан Северного Волка!"
G["'Netherstorm' was not always as you see it now. There was a time when this crumbling land was known as the Plains of Farahlon. Little of those days has survived the evil that has taken hold here."] = "«Пустоверть» не всегда была такой, какой ты видишь ее сейчас. Было время, когда эта разрушающаяся земля была известна как Равнины Фаралона. Мало что из тех дней пережило зло, овладевшее здесь."
G["2v2 Rating Cutoffs"] = "Ограничение рейтинга 2 на 2"
G["3v3 Rating Cutoffs"] = "Ограничение рейтинга 3 на 3"
G["5v5 Rating Cutoffs"] = "Ограничение рейтинга 5 на 5"
G["<Altruis turns to face you and smiles.> I do not. <Altruis points to his steed, Nethrandamus.> We must stop them before these forge camps are able to complete whatever it is that they are building."] = "<Алтруис поворачивается к тебе и улыбается.> Нет. <Алтруис указывает на своего коня Нетрандамуса.> Мы должны остановить их, прежде чем эти лагеря Легиона смогут завершить то, что они строят."
G["<Archmage Vargoth favors you with a wry smile.> Plenty of room at the cursed Violet Tower. Any time of year, you can find me here."] = "<Верховный маг Варгот одаривает тебя кривой улыбкой.> В проклятой Аметистовой башне достаточно места. В любое время года ты можешь найти меня здесь."
G["<Back>"] = "<Назад>"
G["<Floon makes a series of strange clicking and clucking sounds.>"] = "<Флун издает странные щелкающие и кудахчущие звуки.>"
G["<Khadgar grins to himself> I convinced A'dal and his brethren to return here with me. I believe that only their power can drive the Legion from this universe. But as you will no doubt find - their power must first live in our hearts. To combat the darkness, we must become beacons of their eternal Light."] = "<Кадгар ухмыляется про себя> Я убедил А'дала и его братьев вернуться сюда со мной. Я верю, что только их сила сможет изгнать Легион из этой вселенной. Но ты, несомненно, убедишься, что их сила должна прежде всего жить в наших сердцах. Чтобы бороться с тьмой, мы должны стать маяками их вечного Света."
G["<Lantresor glares at you as if he were looking through you.> Perhaps there is another way... I will agree to your leader's demands, only if you do exactly as I ask. With your assistance, we may be able to help each other out greatly."] = "<Лантрезор пристально смотрит на тебя, как будто смотрит сквозь тебя.> Возможно, есть другой способ... Я соглашусь на требования твоего лидера, только если ты сделаешь именно то, что я прошу. С твоей помощью мы сможем значительно помочь друг другу."
G["<Lantresor laughs heartily.> Do you know where you are, fool? This is ogre land. Before orc, before draenei, there was ogre. Yet, you wish to start a war that you will inevitably lose? Boulderfist will crush you. And if Boulderfist does not destroy you, Warmaul will... But I think your leaders already know this..."] = "<Лантрезор от души смеется.> Ты знаешь, где ты, дурак? Это земля огров. До орков, до дренеев был огр. И все же ты хочешь начать войну, которую неизбежно проиграешь? Тяжелый Кулак раздавит тебя. А если Тяжелый Кулак не уничтожит тебя, это сделает Боевой Молот... Но я думаю, твои лидеры уже это знают..."
G["<Lump shrugs.> You bring da war to da Boulderfist. We put it in da stew."] = "<Глыб пожимает плечами.> Ты нести войну Тяжелому Кулаку. Мы класть её в рагу."
G["<Nuainn Stormwing shakes his head.> With the Legion on one side and Illidan's minions on the other, it's going to take everything we've got to defend the stronghold, and defend it we will! Every true Wildhammer would sooner die than surrender our home."] = "<Нуаинн качает головой.> С Легионом с одной стороны и приспешниками Иллидана с другой, нам понадобится всё, что у нас есть, чтобы защитить цитадель, и мы её защитим! Каждый истинный Громовой Молот скорее умрет, чем сдаст наш дом."
G["<Push a random button.>"] = "<Нажми случайную кнопку.>"
G["<Read more>"] = "<Читать далее>"
G["<Several documents from the Steamwheedle Fighting Circuit are pinned to the bulletin board.>"] = "<На доске объявлений приколото несколько документов Боевой лиги Картеля.>"
G["<The earth rumbles as Gordawg's movements come to a halt.> Speak."] = "<Земля содрогается, движения Гордауга останавливаются.> Говори."
G["<The light surrounding Xi'ri pulses blue. The naaru welcomes you as an ally in the field of battle.>"] = "<Свет, окружающий Зи'ри, пульсирует синим. Наару приветствует тебя как союзника на поле битвы.>"
G["A large humanoid hand print is embedded on the surface of the orb. Despite what appears to be constant manipulation and handling, the orb remains unmarred."] = "На поверхности сферы виден большой отпечаток руки гуманоида. Несмотря на, казалось бы, постоянное обращение с ней, сфера остается невредимой."
G["A mortal possessed of arcane and dark knowledge that none could surpass, he devised a method to enhance his summoning through the capture and use of souls untold. Whole civilizations were brought to extinction through his soul devices to fuel the ritual through which he and his conspirators would bring Murmur into their world."] = "Смертный, обладающий тайными и темными знаниями, которые никто не мог превзойти, он разработал метод, позволяющий улучшить свой призыв посредством захвата и использования бессчетного количества душ. Целые цивилизации были уничтожены из-за его духовных устройств, которые подпитывали ритуал, посредством которого он и его заговорщики привели Бормотуна в свой мир."
G["Ah, another shaman looking to be a gladiator, eh? Good! I sell various arena services related to participation in ranking Steamwheedle Fighting Circuit matches."] = "А, еще один шаман, мечтающий стать гладиатором, да? Отлично! Продаю разные услуги, связанные с участием в рейтинговых поединках Боевой лиги Картеля."
G["Ahaha, ya see this? Griftah's BACK! Back in my stall, back with my old wares, and ready to pass on the deals to ya! Want to be better, stronger, faster? Each one of these amulets be guaranteed to do just what I say they be doin'. Step up and buy one of these miraculous baubles! Cheap at twice the price!"] = "Ахаха, ты видишь это? Жуль ВЕРНУЛСЯ! Вернулся в свой ларек, вернулся со своими старыми товарами и готов передать тебе выгодные предложения! Хочешь стать лучше, сильнее, быстрее? Каждый из этих амулетов гарантированно будет делать именно то, что я говорю. Подходи и покупай одну из этих чудесных безделушек! Дешево, хоть цена и в два раза выше обычной!"
G["All right, shaman. You think you have what it takes to make it in the Steamwheedle Fighting Circuit's arena battlegrounds?"] = "Ладно, шаман. Думаешь, у тебя есть все, чтобы преуспеть на аренах Боевой лиги Картеля?"
G["Alliance Battlemasters"] = "Военачальники Альянса"
G["Alright, muffin man, show me your muffins!"] = "Ладно, булочник, покажи мне свои кексы!"
G["Altruis sent me. He said that you could help me."] = "Меня послал Алтруис. Он сказал, что ты можешь мне помочь."
G["An orc... <Lantresor scoffs.> I am a blademaster of half-orc descent."] = "Орк... <Лантрезор усмехается.> Я мастер клинка, наполовину орк по крови."
G["An order is whispered upon the nether winds and Mah'duun hears. A man comes before Mah'duun, and they speak of those which the winds demand be slain today."] = "Приказ шепчется в ветрах Пустоты, и Ма'дуун слышит. Человек приходит к Ма'дууну, и они говорят о тех, кого сегодня требуют уничтожить ветры."
G["And lo, how the mighty fell trembling at its feet, fearful that it might direct its words upon them. But still did these charlatans, these worshipping pretenders to a non-existent religion, rail against the inevitable in a vain attempt to control their 'god.' Uncaring, and likely not even noticing them, Murmur yawned and they knew oblivion. Yet one somehow managed to survive, and in his insanity found a way to bring Murmur into the world."] = "И вот, как сильный пал, дрожа, к его ногам, опасаясь, что он может направить на них свои слова. Но эти шарлатаны, эти поклоняющиеся претендентам на несуществующую религию, продолжали протестовать против неизбежного в тщетных попытках контролировать своего «бога». Равнодушный и, скорее всего, даже не заметивший их, Бормотун зевнул, и они познали забвение. И все же одному каким-то образом удалось выжить, и в своем безумии он нашел способ привести Бормотуна в мир."
G["And now?"] = "А сейчас?"
G["And summon forth Murmur they did. Powerful magics of containment and silencing were employed, held together by the constant supply of souls being fed into them. Yet still they could not control the beast, could not bend it to their will. These mortals began to devise different strategies, and one after the other they all failed. And in so doing, they weakened the rituals, accidentally giving Murmur the slightest modicum of freedom. It was all that was needed."] = "И они вызвали Бормотуна. Была использована мощная магия сдерживания и молчания, удерживаемая постоянным притоком душ, подаваемых в них. И все же они не могли контролировать зверя, не могли подчинить его своей воле. Эти смертные начали придумывать разные стратегии, но одна за другой все они потерпели неудачу. И тем самым они ослабили ритуалы, случайно дав Бормотуну хоть малейшую толику свободы. Это было все, что было нужно."
G["And the other half?"] = "А другая половина?"
G["And what do your people want of Lantresor, draenei?"] = "А чего твой народ хочет от Лантрезора, дреней?"
G["And you think you can just eat anything you want? You're obviously trying to eat the Broken of Telaar."] = "И ты думаешь, что можешь есть всё, что захочешь? Ты явно пытаешься съесть Сломленных из Телаара."
G["Archmage Alvareux once wrote a treatise exploring a fascinating theory. He proposed the existence of an exact copy of Karazhan in a world other than our own and that both somehow shared the same space. He went mad soon after. A real pity."] = "Верховный маг Альварё однажды написал трактат, исследующий увлекательную теорию. Он предположил, что точная копия Каражана существовала в другом мире, отличном от нашего, и что оба каким-то образом находились в одном и том же пространстве. Вскоре после этого он сошел с ума. Очень жаль."
G["Archmage Vargoth enstrusted me with his staff when he told me to flee from the blood elf attack on Violet Tower. I did as he told me, hoping to take refuge in the old draenei settlement of Arklon. There was to be no respite. I had walked right into the leading edge of a Burning Legion force. The demons wrested the staff from me, but I managed to escape with my life. Though my master knows nothing of my failure, it still shames me."] = "Верховный маг Варгот доверил мне свой посох, когда сказал мне бежать от нападения эльфов крови на Аметистовую башню. Я сделал, как он мне сказал, надеясь найти убежище в старом поселении дренеев Арклоне. Передышки не должно было быть. Я вошел прямо в передний край сил Пылающего Легиона. Демоны отобрали у меня посох, но мне удалось спастись. Хотя мой хозяин ничего не знает о моей неудаче, мне все равно стыдно."
G["Are you looking for reagents or poison supplies? If so, you've come to the right place!"] = "Ты ищешь реагенты или яды? Если да, то ты попал по адресу!"
G["Are you lost? Most of the town's vendors are situated near the center of town."] = "Ты потерялся? Большинство городских продавцов расположены недалеко от центра города."
G["Are you ready to rumble? The arena season has begun calling forth the finest combatants in all of Outland to converge and compete in three arenas- Ring of Trials in Nagrand, the Circle of Blood in Bladge's Edge Mountains, and the Ruins of Lordaeron above Undercity. Up for grabs are gear, mounts, title rewards, and most importantly- immortal glory. Step into the arena, champion, and test your mettle!"] = "Готов зажечь? Сезон арен начался, собрав лучших бойцов во всем Запределье, которые сойдутся и сразятся на трех аренах: «Кольцо испытаний» в Награнде, «Круг крови» в Острогорье и «Руины Лордерона» над Подгородом. Тебя ждут снаряжение, средства передвижения, титульные награды и, самое главное, бессмертная слава. Выйди на арену, чемпион, и проверь свои силы!"
G["Are you serious? He already killed me! What more could he want?"] = "Ты серьезно? Он уже убил меня! Чего еще он мог желать?"
G["Are you the correspondent from the Gadgetzan Times? If you just follow me, I'll show you my experimental apparatus... <You tell the magus that you're not the reporter she's expecting.> Oh, you're not? Well then, if you need reagents, find what you need and don't tarry. I'm expecting someone."] = "Ты корреспондент «Прибамбасских ведомостей»? Если ты последуешь за мной, я покажу тебе свой экспериментальный аппарат... <Ты говоришь магу, что ты не тот репортер, которого она ждет.> О, разве нет? Что ж, если тебе нужны реагенты, найди то, что тебе нужно, и не медли. Я жду кое-кого."
G["Arena Battlemasters"] = "Военачальники арены"
G["As a representative of the Consortium, I am always mindful of the ramifications that my interactions have upon our business dealings. It is unfortunate that the blood elves do not treat their partnerships with such respect."] = "Как представитель Консорциума, я всегда осознаю последствия моего взаимодействия для наших деловых отношений. К сожалению, эльфы крови не относятся к своим партнерским отношениям с таким уважением."
G["As a representative of the Lower City, I'm here to put forward our case that Auchindoun must be cleared of its Shadow Council infestation. That is, if we're to have any hope for a future and stave off the possibility of a cataclysm greater than the creation of the Bone Wastes! All of our peoples have suffered too much already. I am here to see to it that the suffering stops!"] = "Как представитель Нижнего города, я здесь, чтобы высказать наше мнение о том, что Аукиндон должен быть очищен от заражения Советом Теней. То есть, если мы хотим иметь хоть какую-то надежду на будущее и предотвратить возможность катаклизма большего, чем создание Костяных пустошей! Все наши народы уже слишком много пострадали. Я здесь, чтобы позаботиться о том, чтобы страдания прекратились!"
G["As a reward for his years of service, Illidan allowed Kael'thas to send him five warriors to train under him. It would be the first time blood elves would be allowed to train as demon hunters. The training was brutal. Illidan put Kael's warriors through trials that would defeat most fully capable demon hunters. Three of Kael's elves died in training - another went mad. One succeeded."] = "В награду за годы службы Иллидан позволил Кель'тасу прислать ему пять воинов для обучения под его началом. Это будет первый раз, когда эльфам крови будет разрешено обучаться охоте на демонов. Обучение было жестоким. Иллидан подверг воинов Келя испытаниям, которые позволили победить наиболее способных охотников на демонов. Трое эльфов Келя погибли на тренировках, еще один сошёл с ума. Одному это удалось."
G["Battlemasters"] = "Военачальники"
G["Beat it, kid. I got business to attend to..."] = "Проваливай, малыш. У меня есть дела, которыми надо заняться..."
G["Beware, mortal, beyond this hall lies dangers unheard of in your world. Tread carefully..."] = "Берегись, смертный, за этим залом таятся опасности, неслыханные в твоем мире. Действуй осторожно..."
G["Bite your tongue, draenei. I have seen things in my lifetime that you have only heard about in legends. I have killed man, woman, and child without remorse. Under the banner of two Warchiefs of the Horde I have served... And now, I rule Boulderfist."] = "Прикуси язык, дреней. Я видел на своем веку вещи, о которых ты слышал только в легендах. Я убил мужчину, женщину и ребенка без угрызений совести. Я служил под знаменами двух вождей Орды... И теперь я управляю Тяжелым Кулаком."
G["Blessings of the Naaru. What can I help you find?"] = "Благословение Наару. Что я могу помочь тебе найти?"
G["Boots, what do you have back there that goes down smooth?"] = "Бутс, что у тебя там сзади, что плавно работает?"
G["Boulderfist hungry! Need food! Warmaul ogre tribe kick Boulderfist out of mound to north. Many more Boulderfist to feed now."] = "Тяжелый Кулак голоден! Нужна еда! Племя огров Боевого Молота выгнало Тяжелый Кулак из кургана на севере. Теперь надо кормить еще много бойцов Тяжелого Кулака."
G["Come and I will show you how to ride the finest beasts you have ever seen. You... do have enough gold to cover the cost, I trust?"] = "Приходи, и я покажу тебе, как ездить на лучших зверях, которых ты когда-либо видел. Надеюсь, у тебя... хватит золота, чтобы покрыть расходы?"
G["Congratulations, your mind has been expanded."] = "Поздравляю, твой разум расширился."
G["Dat not true. Me just want to nibble. I don't eat all. Ok, maybe I eat da little ones. Dey so delicious!"] = "Это неправда. Мне просто хочется погрызть. Я не ем все. Хорошо, может быть, я ем маленьких. Они такие вкусные!"
G["Death's Door is a portal that opens upon the world that the Burning Legion uses to breed their fel hounds and other canine-like terrors. Any time that you see one of those creatures, that is where it came from, and it passes through here, first. Lately, we became aware that the Burning Legion have ramped up their summoning of these creatures through the portal. You must shut down Death's Door before it becomes an inexorable tide, and all is lost!"] = "Врата Смерти — портал, открывающийся в мир, который Пылающий Легион использует для разведения своих гончих Скверны и других собачьих ужасов. Каждый раз, когда ты видишь одно из этих существ, оно приходит оттуда и сначала проходит здесь. Недавно нам стало известно, что Пылающий Легион активизировал призыв этих существ через портал. Ты должен закрыть Врата Смерти, прежде чем они станут неумолимой волной и все будет потеряно!"
G["Do not be fooled by the ruins surrounding us, shaman. Dalaran is as powerful as ever."] = "Не обманывайся окружающими нас руинами, шаман. Даларан могуч как никогда."
G["Do you know what I see? A precursor to invasion. Aye, the master was wise in sealing the portals but has since lost his... how shall I put this? The master has lost his focus. Yes... Focus. With this loss, the Legion has seized opportunity. They seep out now, growing in number day by day."] = "Знаешь, что я вижу? Предвестник вторжения. Да, мастер поступил мудро, запечатав порталы, но с тех пор потерял свою... как бы это сказать? Мастер потерял концентрацию. Да... Концентрацию. С этой потерей Легион воспользовался возможностью. Сейчас они просачиваются наружу, их число растет с каждым днем."
G["Draenei... And because of this, I am neither. Not orc, not draenei. My own kind are a rare breed. Most having been killed decades ago... I live because of my strength of will."] = "Дренеи... И поэтому я ни то, ни другое. Не орк, не дреней. Мои сородичи — редкая порода. Большинство из них были убиты десятилетия назад... Я живу благодаря своей силе воли."
G["Druid"] = "Друид"
G["Existing only for chaos, its slightest whisper meant the destruction of whole worlds! Yet still, there were those that would try to worship this mindless being. There were even those more insane who dared to think to control it!"] = "Существуя только ради хаоса, его малейший шепот означал разрушение целых миров! И все же находились те, кто пытался поклоняться этому безмозглому существу. Были даже ещё более безумные, которые осмелились подумать, чтобы контролировать это!"
G["Ezekiel said that you might have a certain book..."] = "Иезекииль сказал, что у тебя может быть определенная книга..."
G["Forge camps?"] = "Лагеря Легиона?"
G["Fshhhhhhsssfhhhhh?"] = "Фшшшшшшшшшшшшшшшш?"
G["Get me out of here, draenei!"] = "Вытащи меня отсюда, дреней!"
G["Gezhe is here to get a job done. I'm here to make sure no one bothers him while he does it."] = "Геже здесь, чтобы закончить работу. Я здесь, чтобы убедиться, что никто не беспокоит его, пока он это делает."
G["Glory to the naaru, $N. The Light will soon triumph over its enemies."] = "Слава наару, $N. Свет скоро одержит победу над своими врагами."
G["Go on, please."] = "Продолжай, пожалуйста."
G["Good to see you again, $N! Just a few more adjustments and the trajectory of the jump will be perfect!"] = "Рад видеть тебя снова, $N! Еще несколько корректировок и траектория прыжка будет идеальной!"
G["Greetings, shaman. You seek to push yourself to the limits of your hunting prowess? Look no further. Hemet Nesingwary has assembled the finest expedition the remnant of this world has ever known. Join us on safari if you dare."] = "Приветствую, шаман. Ты стремишься достичь предела своего охотничьего мастерства? Не смотри дальше. Хеминг Эрнестуэй собрал лучшую экспедицию, которую когда-либо знал остаток этого мира. Присоединяйся к нам на сафари, если осмелишься."
G["Grok look for help. Little draenei go to the mountains and help the Bloodmaul!"] = "Грок ищет помощи. Малыш-дреней, ступай в горы и помоги Кровавому Молоту!"
G["Hail, adventurer. Heed my warnings before venturing into the Black Morass."] = "Приветствую тебя, искатель приключений. Прислушайся к моим предупреждениям, прежде чем отправиться в Черную трясину."
G["He wants his \"golds.\" Pay up or die... again..."] = "Он хочет свое «золото». Плати или умри... снова..."
G["Hemet Nesingwary, what are you doing here in the Outland?"] = "Хеминг Эрнестуэй, что ты делаешь здесь, в Запределье?"
G["Here are more of the incendiary devices, $N. Be careful with these, they can cause a great deal of disruption to time if used improperly."] = "Вот еще зажигательные устройства, $N. Обращайся с ними осторожно: при неправильном использовании они могут привести к серьезным нарушениям времени."
G["Horde Battlemasters"] = "Военачальники Орды"
G["How can my people fight when the elements are in such turmoil? Do they not see that without the support of the elements, the world simply cannot be."] = "Как мои люди могут сражаться, когда стихия находится в таком смятении? Разве они не видят, что без поддержки стихий мир просто не может существовать."
G["How do you see them now?"] = "Какими ты видишь их сейчас?"
G["I am Khadgar, former apprentice to the fallen Guardian, Medivh. I'm sure you've heard his name before. It was I who discovered that Medivh had been possessed by the Evil One, Sargeras - and that he had opened the Dark Portal between this world and Azeroth. Though I honored my Master, I was forced to slay him and put his tortured soul to rest."] = "Я Кадгар, бывший ученик павшего Стража Медива. Я уверен, что ты уже слышал его имя раньше. Именно я обнаружил, что Медив был одержим Злым Саргерасом и что он открыл Темный Портал между этим миром и Азеротом. Хоть я и чтил своего Учителя, мне пришлось убить его и упокоить его измученную душу."
G["I am Untrag of the Earthen Ring. Try not to upset the elements while you remain at the Throne of the Elements."] = "Я Унтраг из Служителей Земли. Постарайся не расстраивать стихии, пока ты остаешься у Трона стихий."
G["I can instruct you in herbalism. Interested?"] = "Я могу научить тебя травничеству. Интересует?"
G["I can instruct you in skinning. Interested?"] = "Я могу научить тебя снимать шкуры. Интересует?"
G["I can take you to Durnholde directly, if that is your wish."] = "Если ты хочешь, я могу отвезти тебя прямо в Дарнхольд."
G["I carry odds and ends, but mostly just odds."] = "Я ношу всякую всячину, но в основном просто мелочь."
G["I fought alongside Lord Anduin Lothar as we drove the Horde from our lands on Azeroth. As the heir of Medivh's legacy, I could do no less. When the call finally came to invade this grim world - and put an end to the orcs' evil forever - I stepped forward along with my friends Turalyon, Alleria, Danath and Kurdran."] = "Я сражался плечом к плечу с лордом Андуином Лотаром, когда мы изгнали Орду с наших земель на Азероте. Как наследник наследия Медива, я не мог сделать меньшего. Когда наконец прозвучал призыв вторгнуться в этот мрачный мир и навсегда положить конец злу орков, я вышел вперед вместе со своими друзьями Туралионом, Аллерией, Данатом и Курдраном."
G["I have a proposal for you, draenei. Please consider your choices carefully - your decision cannot be easily reversed. It is time we formalized your allegiance to our organization. I must know in what capacity you wish to serve us so that we may reward you appropriately."] = "У меня есть для тебя предложение, дреней. Пожалуйста, обдумай свой выбор внимательно: твое решение не так-то легко изменить. Пришло время официально закрепить твою преданность нашей организации. Я должен знать, в каком качестве ты желаешь служить нам, чтобы мы могли вознаградить тебя соответствующим образом."
G["I have been sent by Sal'salabim to collect a debt that you owe. Pay up or I'm going to have to hurt you."] = "Саль'салабим послал меня взыскать твой долг. Плати, иначе мне придется причинить тебе боль."
G["I have every confidence that we will recover that which Nexus-Prince Haramad desires."] = "Я абсолютно уверен, что мы вернем то, чего желает принц нексуса Харамад."
G["I have heard of your kind, but I never thought to see the day when I would meet a half-breed."] = "Я слышал о твоем роде, но никогда не думал, что доживу до того дня, когда встречу полукровку."
G["I have just the thing you need to cast your spell."] = "У меня есть именно то, что тебе нужно, чтобы произнести заклинание."
G["I have killed many of your ogres, Lantresor. I have no fear."] = "Я убил многих твоих огров, Лантрезор. У меня нет страха."
G["I have marks to redeem!"] = "У меня есть баллы, которые нужно обменять!"
G["I have seen many dangers in these wastes. Who knows what creatures yet lurk in the dust to ambush the unwary?"] = "Я видел много опасностей в этих отходах. Кто знает, какие существа еще прячутся в пыли и устраивают засаду на неосторожных?"
G["I need a pack of incendiary bombs."] = "Мне нужна пачка зажигательных бомб."
G["I need answers, ogre!"] = "Мне нужны ответы, огр!"
G["I offer what shelter I can in our shattered lands."] = "Я предлагаю то убежище, которое могу, на наших разрушенных землях."
G["I see twisted steel and smell sundered earth."] = "Я вижу искореженную сталь и чувствую запах расколотой земли."
G["I see."] = "Я понимаю."
G["I seek training to ride a steed."] = "Я ищу обучение верховой езде."
G["I sell wares that crafters need. Just the basics, nothing fancy."] = "Продаю товары, необходимые мастерам. Только основы, ничего особенного."
G["I think I'll make my own money on the side while the others try to decide whether it's okay to go into Oshu'gun. Time is profit!"] = "Я думаю, что подзаработаю себе деньги, пока остальные будут решать, можно ли идти в Ошу'гун. Время – прибыль!"
G["I used to amuse myself by accepting challenges from anyone who would offer them, but I've long since grown tired of such easy victories. For now, I'm taking some time to get my reagent business off the ground and write a book about my experiences in Twilight's Hammer."] = "Раньше я развлекался, принимая вызовы от любого, кто их предлагал, но такие легкие победы мне уже давно надоели. А сейчас я трачу некоторое время на то, чтобы начать свой бизнес по производству реагентов и написать книгу о своем опыте в «Сумеречном Молоте»."
G["I used to be known as Iolol until a secret vote was passed around town that resulted in me having to change my name. It was either change it or go the way of Corki. You would have done the same. What do you think of my new name? Huge improvement, right? By the way, check the bulletin board if you're looking for work."] = "Раньше меня называли Иолол, пока в городе не было проведено тайное голосование, в результате которого мне пришлось сменить имя. Либо изменить его, либо пойти по пути Корки. Ты бы сделал то же самое. Что ты думаешь о моем новом имени? Огромное улучшение, правда? Кстати, загляни на доску объявлений, если ищешь работу."
G["I will have my revenge on Kael'thas for this outrage against the Kirin Tor! He once walked among us as a brother, but we are brothers no more. There will be a reckoning. <The archmage nods grimly, not relishing the prospect.> Kael'thas is more than a mere rogue mage. Once I am free from my tower, Ravandwyr and I will assist anyone who opposes him."] = "Я отомщу Кель'тасу за это насилие над Кирин-Тором! Когда-то Он ходил среди нас как брат, но мы больше не братья. Будет расплата. <Верховный маг мрачно кивает, не наслаждаясь перспективой.> Кель'тас — больше, чем просто маг-изгой. Как только я освобожусь из своей башни, мы с Равандвиром окажем помощь любому, кто выступит против него."
G["I wish to join the battle!"] = "Я желаю присоединиться к битве!"
G["I won't challenge you, but I'd like to see your wares."] = "Я не буду бросать тебе вызов, но мне бы хотелось увидеть твои товары."
G["I would like to fight in an arena."] = "Я хотел бы драться на арене."
G["I'll... take a look."] = "Я... посмотрю."
G["I'm afraid there is little I can teach you, shaman. You're free to browse my wares, of course, but you will not find them of use to you."] = "Боюсь, я мало чему могу тебя научить, шаман. Ты, конечно, можешь просматривать мои товары, но они не принесут тебе пользы."
G["I'm listening."] = "Я слушаю."
G["I'm neither slim nor shady. As a matter of fact, I find both references insulting. Now, get out of my sight before I plant my staff up your backside."] = "Я не стройный и не худой. На самом деле я считаю обе ссылки оскорбительными. А теперь уйди с глаз моих, прежде чем я воткну свой посох тебе в зад."
G["I'm ready to go to Durnholde Keep."] = "Я готов отправиться в крепость Дарнхольд."
G["I'm sorry, shaman, but my wares are best suited to those who know which end of the needle the thread goes through. I can assure you, tailoring is about far more than monogramming handkerchiefs."] = "Прости, шаман, но мои изделия лучше всего подойдут тем, кто знает, через какой конец иглы проходит нить. Уверяю тебя, пошив одежды – это нечто большее, чем просто носовые платки с монограммами."
G["I've heard your name spoken only in whispers, mage. Who are you?"] = "Я слышал, как твое имя произносилось только шепотом, маг. Кто ты?"
G["I've seen you prancing around. Why don't you do us all a favor and just drop your gear off at the armory?"] = "Я видел, как ты гарцевал. Почему бы тебе не сделать нам всем одолжение и просто не сдать свое снаряжение в оружейную?"
G["If you are ready and wish to quickly return to the normal time stream, I can transport you to Andormu in the Caverns of Time."] = "Если ты готов и желаешь побыстрее вернуться в нормальный поток времени, я могу перевезти тебя в Андорму, в Пещеры Времени."
G["If you desire, in addition to training, I have it within my power to erase the knowledge of your talents from your mind. Be warned that every time you undergo this procedure the more difficult it is to perform, and therefore the more expensive it becomes."] = "Если ты пожелаешь, помимо обучения, я в силах стереть из твоей памяти знание о твоих талантах. Имей в виду, что каждый раз, когда ты проходишь эту процедуру, ее становится все сложнее и, следовательно, дороже."
G["If you have to ask, you don't know me anywhere near well enough to be using that appellation."] = "Если тебе нужно спросить, ты не знаешь меня достаточно хорошо, чтобы использовать это имя."
G["If you haven't already, make sure that you offer your assistance to Rina Moonspring."] = "Если ты еще этого не сделал, обязательно предложи свою помощь Рине Лунный Родник."
G["If you need reagents, you've come to the right place. You won't find a finer selection in all of Shattrath."] = "Если тебе нужны реагенты, ты попал по адресу. Во всем Шаттрате ты не найдешь лучшего выбора."
G["If you're looking for information that the Cenarion Circle might have archived somewhere, then I'm the one to talk to. Then again, you need to know what information you're looking for first before I can really help you. See how that works? Brilliant!"] = "Если ты ищешь информацию, которую Круг Кенария мог где-то заархивировать, то тебе стоит поговорить со мной. Опять же, тебе нужно сначала знать, какую информацию ты ищешь, прежде чем я смогу тебе действительно помочь. Видишь, как это работает? Великолепно!"
G["If you're not a tailor, I don't think any of my patterns will interest you, but you're welcome to browse!"] = "Если ты не портной, я не думаю, что какие-либо из моих выкроек тебя заинтересуют, но ты можешь их просмотреть!"
G["If you've been sent to kill me, please take a number and wait your turn."] = "Если тебя послали убить меня, пожалуйста, возьми номер и жди своей очереди."
G["Ikan tries and tries. I think these Dreghood are much like the Lost Ones, you know... lost."] = "Икан пытается и пытается. Я думаю, что эти Осквернители очень похожи на Заблудших, ну, знаешь... заблудших."
G["Illidan's grasp on this land is slipping. Can you feel it, $N?"] = "Власть Иллидана над этой землей ослабевает. Ты чувствуешь это, $N?"
G["Interesting."] = "Интересно."
G["It feels good to walk about and stretch all four limbs. Is there something I can help you with, shaman?"] = "Приятно ходить и размять все четыре конечности. Чем я могу тебе помочь, шаман?"
G["It is a good day to be alive and one with the elements."] = "Это хороший день, чтобы быть живым и единым со стихией."
G["It is good to see a friend of the Aldor around these remote parts. I fear I cannot stand for much more of these elves' insolent chatter."] = "Приятно видеть друга Алдоров в этих отдаленных уголках. Боюсь, я больше не смогу выносить наглую болтовню этих эльфов."
G["It is good to see you again, $N. Would you like me to take you to the master's lair?"] = "Рад снова видеть тебя, $N. Хочешь, я отведу тебя в логово хозяина?"
G["It is not surprising that a blood elf's potential for power as a demon hunter is so high. After all, the sin'dorei do not have the natural aversion to demonic magic that night elves do. However, I do not expect many to succeed. Most of them, Varedis included, pursue power for its own sake. That power will consume them, for they are not driven by the pure fire that burns inside a true demon hunter's heart."] = "Неудивительно, что потенциал силы эльфа крови как охотника на демонов настолько высок. В конце концов, у син'дорай нет естественного отвращения к демонической магии, как у ночных эльфов. Однако я не ожидаю, что многие добьются успеха. Большинство из них, включая Варедиса, стремятся к власти ради власти. Эта сила поглотит их, поскольку ими не движет чистый огонь, горящий в сердце настоящего охотника на демонов."
G["It will take a sharp blade and reinforced armor to bring tranquility back to Nagrand. Shall I repair your equipment so that you may mete justice?"] = "Чтобы вернуть спокойствие в Награнд, понадобится острый клинок и усиленные доспехи. Починить тебе снаряжение, чтобы ты смог вершить правосудие?"
G["It will take a while, but these Broken Ones will learn the ways of the Light!"] = "Это займет некоторое время, но эти Сломленные познают пути Света!"
G["It's driving me crazy. I cannot reach those damned eggs!"] = "Это сводит меня с ума. Я не могу добраться до этих проклятых яиц!"
G["Jewelcrafting"] = "Ювелирное дело"
G["Karazhan wasn't always quite as... ominous. The darkening of Karazhan only came with Medivh's death. Or what we believe was Medivh's death."] = "Каражан не всегда был таким... зловещим. Тьма Каражана пришла только со смертью Медива. Или то, что мы считаем смертью Медива."
G["Keep a sharp eye, shaman. You never know when some beastie is stalking you instead of the other way around."] = "Будь зорким, шаман. Никогда не знаешь, когда какая-то тварь преследует тебя, а не наоборот."
G["Kirin'Var survived 20 long years and countless orc assaults, but it could not withstand the forces of Kael'thas. A man who once called himself a member of the Kirin Tor murdered all of us, save one. Archmage Vargoth survived the attack, so Kael'thas imprisoned him within the Violet Tower, warding it with a magic that forbids the passage of any of the Kirin Tor."] = "Кирин'Вар пережил 20 долгих лет и бесчисленные нападения орков, но не смог противостоять силам Кель'таса. Человек, который когда-то называл себя членом Кирин-Тора, убил всех нас, кроме одного. Верховный маг Варгот пережил атаку, поэтому Кель'тас заточил его в Аметистовой башне, защитив ее магией, запрещающей проход любому из Кирин-Тора."
G["Knowledge of a demon's true name is rumored to give a certain amount of power over that demon. The Book of Fel names is said to contain the true name of every demon ever to have existed. By memorizing the passages in the book, Varedis had found a source of power to rival Illidan's own drinking from the Skull of Gul'dan. At Illidan's request, Varedis now runs the training grounds at the Ruins of Karabor - along with the three masters that mentored Varedis."] = "Ходят слухи, что знание настоящего имени демона дает определенную власть над этим демоном. Говорят, что Книга имен Скверны содержит настоящие имена всех когда-либо существовавших демонов. Запомнив отрывки из книги, Варедис нашел источник силы, способный соперничать с тем, как Иллидан пил из Черепа Гул'дана. По просьбе Иллидана Варедис теперь управляет тренировочной площадкой в ​​Руинах Карабора вместе с тремя мастерами, которые были наставниками Варедиса."
G["Legion?"] = "Легион?"
G["Let me browse your reagents and poison supplies."] = "Позволь мне просмотреть твои реагенты и запасы ядов."
G["Listen lad. I left the expedition in the capable hands of me son, Junior. When you've stalked the finest game in all of Azeroth you start to itch for something more. And have you seen the size of the beasties here?! I'm here hunting the most dangerous prey you'll ever lay your eyes on. I mean to bag myself Tusker and take her heart as my trophy!"] = "Слушай, парень. Экспедицию я оставил в надёжных руках своего сына, Младшего. Когда ты преследуешь лучшую дичь во всем Азероте, начинаешь жаждать чего-то большего. А ты видел здесь размеры зверей?! Я здесь охочусь на самую опасную добычу, которую ты когда-либо видел. Я собираюсь заполучить Таскер и забрать ее сердце в качестве трофея!"
G["Long ago, in a dimension of the cosmos unfathomable to mortal minds, there was born - if such a term can be used for it - a being of such unbelievable power that its very entrance into existence shattered all reality around it. Known only as Murmur, it was the essence of sound, and to hear it speak was to know death eternal!"] = "Давным-давно, в измерении космоса, непостижимом для смертных умов, родилось - если для этого можно использовать такой термин - существо такой невероятной силы, что само его появление разрушило всю реальность вокруг него. Известный только как Бормотун, он был сущностью звука, и услышать его голос означало познать вечную смерть!"
G["Many are the rare and precious objects that my clientele seek. You could be the one to bring them to me, shaman. In return I offer that which you covet. Shall we speak more on that which I look to procure today?"] = "Многие из них являются редкими и ценными предметами, которые ищут мои клиенты. Ты можешь принести их мне, шаман. Взамен я предлагаю то, чего ты жаждешь. Поговорим подробнее о том, что я хочу получить сегодня?"
G["My apologies. I did not mean to offend. I am here on behalf of my people."] = "Мои извинения. Я не хотел обидеть. Я здесь от имени моего народа."
G["My comrades and I called ourselves the Sons of Lothar - in honor of the greatest, most selfless man we ever knew. We gave our all to defeat Ner'zhul and end his madness. As this doomed world fell apart around us, we shattered the Dark Portal to prevent any further harm befalling our beloved Azeroth."] = "Мои товарищи и я называли себя Сынами Лотара – в честь величайшего и самого самоотверженного человека, которого мы когда-либо знали. Мы отдали все силы, чтобы победить Нер'зула и положить конец его безумию. Когда этот обреченный мир вокруг нас развалился, мы разрушили Темный Портал, чтобы предотвратить дальнейший вред, постигающий наш любимый Азерот."
G["My people ask that you pull back your Boulderfist ogres and cease all attacks on our territories. In return, we will also pull back our forces."] = "Мои люди просят тебя отозвать своих огров Тяжелого Кулака и прекратить все нападения на наши территории. В ответ мы также отведем наши силы."
G["My sight is filled with visions of events taking place throughout the world and ones that may yet happen. Many of them are grim, but we needn't believe they are incapable of changing."] = "Мой взгляд наполнен видениями событий, происходящих во всем мире, и событий, которые еще могут произойти. Многие из них мрачны, но нам не нужно верить, что они неспособны измениться."
G["Never look these Broken directly in the eyes. I think they can suck the soul right out of you if they're so inclined!"] = "Никогда не смотри этим Сломленным прямо в глаза. Я думаю, они могут высосать из тебя душу, если захотят!"
G["OK! Lump tell you anything you want!"] = "ХОРОШО! Глыб скажет тебе все, что ты хочешь!"
G["Oh yeah, I got muffins!"] = "О да, у меня есть кексы!"
G["Only this book survived the cataclysm that destroyed their world. Those proud and foolish men who thought to control a cosmic being of untold power. Would you, the possessor of the codex, do the same? Have you devised a foolproof method to summon forth Murmur, or any of the other entities cautiously whispered of in these unhallowed pages? We shall see."] = "Только эта книга пережила катаклизм, разрушивший их мир. Эти гордые и глупые люди, которые думали контролировать космическое существо неисчислимой силы. Сделал бы ты, обладатель кодекса, то же самое? Изобрел ли ты надежный метод вызова Бормотуна или любого другого существа, о котором осторожно шепчутся на этих нечестивых страницах? Посмотрим."
G["Please take me to the master's lair."] = "Пожалуйста, отведи меня в логово хозяина."
G["Purchase a Dual Talent Specialization."] = "Приобрести специализацию с двумя талантами."
G["Read on, if you dare..."] = "Читай дальше, если осмелишься..."
G["Registrants are required to speak with Warden Moi'bff Jill before posting any task. Those found making unapproved postings will be prosecuted. Post no bills."] = "Прежде чем публиковать какое-либо задание, зарегистрировавшимся необходимо поговорить со старостой Мой'прн Джилл. Уличенные в несанкционированных публикациях будут привлечены к ответственности. Самовольная расклейка объявлений запрещена."
G["Rewards Information"] = "Информация о вознаграждениях"
G["Rocket-Chief Fuselage, commander of B.O.O.M - the Braintrust of Orbital Operations and Mechanics - at your service. Are all systems go?! It looks like the X-52 Nether-Rocket still needs a lot of work! Come on people... we're T-minus NEVER here!"] = "Ведущий ракетостроитель Фьюзеляж, командир МОЗГа – Мозгового Отдела Заатмосферных Гонок – к твоим услугам. Все системы готовы?! Похоже, над X-52 «Ракетой Пустоты» еще предстоит много работы! Да ладно, народ... у нас вечно Т-минус НИКОГДА!"
G["Season 2 - 2v2 rating cutoffs |TInterface\\ICONS\\Achievement_Arena_2v2_7.blp:20|t 2620 - Rank One |TInterface\\ICONS\\Achievement_Arena_2v2_6.blp:20|t 2401 - Gladiator |TInterface\\ICONS\\Achievement_Arena_2v2_4.blp:20|t 2011 - Duelist |TInterface\\ICONS\\Achievement_Arena_2v2_2.blp:20|t 1674 - Rival |TInterface\\ICONS\\Achievement_Arena_2v2_1.blp:20|t 1447 - Challenger"] = "Сезон 2 – ограничение рейтинга 2 на 2 |TInterface\\ICONS\\Achievement_Arena_2v2_7.blp:20|t 2620 – первый ранг |TInterface\\ICONS\\Achievement_Arena_2v2_6.blp:20|t 2401 – гладиатор |TInterface\\ICONS\\Achievement_Arena_2v2_4.blp:20|t 2011 – дуэлянт |TInterface\\ICONS\\Achievement_Arena_2v2_2.blp:20|t 1674 – соперник |TInterface\\ICONS\\Achievement_Arena_2v2_1.blp:20|t 1447 – претендент"
G["Season 2 - 3v3 rating cutoffs |TInterface\\ICONS\\Achievement_Arena_3v3_7.blp:20|t 2440 - Rank One |TInterface\\ICONS\\Achievement_Arena_3v3_6.blp:20|t 2259 - Gladiator |TInterface\\ICONS\\Achievement_Arena_3v3_4.blp:20|t 1947 - Duelist |TInterface\\ICONS\\Achievement_Arena_3v3_2.blp:20|t 1699 - Rival |TInterface\\ICONS\\Achievement_Arena_3v3_1.blp:20|t 1482 - Challenger"] = "Сезон 2 – ограничение рейтинга 3 на 3 |TInterface\\ICONS\\Achievement_Arena_3v3_7.blp:20|t 2440 – первый ранг |TInterface\\ICONS\\Achievement_Arena_3v3_6.blp:20|t 2259 – гладиатор |TInterface\\ICONS\\Achievement_Arena_3v3_4.blp:20|t 1947 – дуэлянт |TInterface\\ICONS\\Achievement_Arena_3v3_2.blp:20|t 1699 – соперник |TInterface\\ICONS\\Achievement_Arena_3v3_1.blp:20|t 1482 – претендент"
G["Season 2 - 5v5 rating cutoffs |TInterface\\ICONS\\Achievement_Arena_5v5_7.blp:20|t 2406 - Rank One |TInterface\\ICONS\\Achievement_Arena_5v5_6.blp:20|t 2197 - Gladiator |TInterface\\ICONS\\Achievement_Arena_5v5_4.blp:20|t 1908 - Duelist |TInterface\\ICONS\\Achievement_Arena_5v5_2.blp:20|t 1677 - Rival |TInterface\\ICONS\\Achievement_Arena_5v5_1.blp:20|t 1471 - Challenger"] = "Сезон 2 – ограничение рейтинга 5 на 5 |TInterface\\ICONS\\Achievement_Arena_5v5_7.blp:20|t 2406 – первый ранг |TInterface\\ICONS\\Achievement_Arena_5v5_6.blp:20|t 2197 – гладиатор |TInterface\\ICONS\\Achievement_Arena_5v5_4.blp:20|t 1908 – дуэлянт |TInterface\\ICONS\\Achievement_Arena_5v5_2.blp:20|t 1677 – соперник |TInterface\\ICONS\\Achievement_Arena_5v5_1.blp:20|t 1471 – претендент"
G["Shaping the flow of time is a very difficult and quite delicate task, but you have performed admirably today."] = "Формировать течение времени – очень сложная и достаточно деликатная задача, но сегодня тебе это удалось просто превосходно."
G["Shattrath's battlemasters often congregate on the stairwells between the upper and lower city. The Alliance battlemasters gather in one place, the Horde in another, with the arena battlemasters between and across from them."] = "Военачальники Шаттрата часто собираются на лестничных клетках между верхним и нижним городом. Военачальники Альянса собираются в одном месте, Орды — в другом, а военачальники арены между ними и напротив них."
G["Should I know? You look like an orc to me."] = "Должен ли я знать? Для меня ты похож на орка."
G["Show me what I've earned the right to purchase."] = "Покажи мне, что я заслужил право купить."
G["Show me what you have for sale."] = "Покажи мне, что у тебя есть на продажу."
G["Show me your gryphons, Brunn."] = "Покажи мне своих грифонов, Брунн."
G["Specialist, eh? Just what kind of specialist are you, anyway?"] = "Специалист, да? Да какой же ты специалист?"
G["Take me back to my time."] = "Верни меня в мое время."
G["Tell me about the demon hunter training grounds at the Ruins of Karabor."] = "Расскажи мне о тренировочной площадке охотников на демонов в Руинах Карабора."
G["Tell me more about this thing you call \"cooking?\""] = "Расскажи мне больше о том, что ты называешь «готовкой»?"
G["Tell me of your past, Farseer."] = "Расскажи мне о своем прошлом, Предсказатель."
G["That Shaffar is a clever bastard. He's rigged the entrance with some sort of ward to prevent other ethereal groups from entering. We're working on breaking through his defenses so we can get in there and take what's ours. I've got top ethereals working on this around the clock. We'll have it open any minute now. I can feel it..."] = "Этот Шаффар умный ублюдок. Он оборудовал вход какой-то защитой, чтобы предотвратить вход других эфирных групп. Мы работаем над тем, чтобы прорвать его оборону, чтобы мы могли проникнуть туда и забрать то, что принадлежит нам. Над этим круглосуточно работают лучшие эфириалы. Мы откроем его в любую минуту. Я чувствую это..."
G["That child gives me chills. He stands there all day long communing with his grandfather. He'll then turn to tell his mother what the grandfather told him and she - of course - just smiles and nods her head. Lambs! Lemmings! All of them!"] = "Этот ребенок вызывает у меня озноб. Он стоит там целый день и общается со своим дедушкой. Затем он поворачивается, чтобы рассказать матери то, что сказал ему дедушка, и она, конечно же, просто улыбается и кивает головой. Ягнята! Лемминги! Все они!"
G["That is what these structures that litter the landscape are called. The Legion have employed the mo'arg and gan'arg to build weapons of mass destruction at these mobile forge camps. Let us not find out what it is that they intend to build here in Nagrand! You will be my eyes. Your weapons will be my fury."] = "Именно так называются эти сооружения, засоряющие ландшафт. Легион нанял мо'арга и ган'арга для создания оружия массового поражения в этих мобильных лагерях Легиона. Давай не будем выяснять, что они собираются построить здесь, в Награнде! Ты будешь моими глазами. Твоё оружие будет моей яростью."
G["That's quite a story."] = "Это целая история."
G["The Battle of Mount Hyjal is one of the most well-guarded events of this timeline. Should an intruder alter its outcome, the impact would extend to all subsequent moments in history. As the Aspect's prime mate I'm far more in tune with the flow of time than other bronze dragons. I recently sensed a minute ripple in time emanating from the events surrounding the Battle of Mount Hyjal. Someone or something is attempting to change this timeline and they must be stopped."] = "Битва за гору Хиджал — одно из наиболее хорошо охраняемых событий этой временной шкалы. Если злоумышленник изменит результат, воздействие распространится на все последующие моменты истории. Как главный помощник Аспекта, я гораздо лучше настроен на течение времени, чем другие бронзовые драконы. Недавно я почувствовал небольшую пульсацию времени, возникшую в результате событий, связанных с битвой у горы Хиджал. Кто-то или что-то пытается изменить эту временную шкалу, и их необходимо остановить."
G["The Burning Legion. Demons. I see them as clearly as you can see your own hand in front of your face. That is, I used to be able to see them clearly. With the Legion's return come new machinations. Under normal circumstances, I am able to sense the presence of a demon from a thousand paces. <Altruis grimaces.>"] = "Пылающий Легион. Демоны. Я вижу их так же ясно, как ты видишь свою руку перед лицом. То есть раньше я мог ясно их видеть. С возвращением Легиона появились новые махинации. В обычных обстоятельствах я могу почувствовать присутствие демона на расстоянии тысячи шагов. <Алтруис гримасничает.>"
G["The Cenarion Expedition rescued me from certain death inside the mines. I owe them my life! I offer up my services of repair and reagent sales to those that are allies of the Cenarion Expedition."] = "Кенарийская экспедиция спасла меня от верной смерти в шахтах. Я обязан им своей жизнью! Я предлагаю свои услуги по ремонту и продаже реагентов союзникам Кенарийской экспедиции."
G["The Consortium has been planning this operation for months! We were to dig Oshu'gun, the largest known diamond in the universe. Minutes before we were to begin, Nexus-Prince Haramaad sends word that we're to hold off until a political matter is resolved in Netherstorm. I've transformed our operation into a clearing house for smuggled gems in the meantime, but this is slowly eating into our profits."] = "Консорциум планировал эту операцию несколько месяцев! Нам предстояло выкопать Ошу'гун, самый крупный из известных алмазов во Вселенной. За несколько минут до того, как мы должны были начать, принц нексуса Харамад сообщил, что нам следует подождать, пока в Пустоверти не будет решен политический вопрос. Тем временем я превратил нашу деятельность в расчетную палату по контрабандным драгоценным камням, но это медленно съедает нашу прибыль."
G["The Consortium will exact its revenge upon the Zaxxis betrayers!"] = "Консорциум отомстит предателям из братства Заксис!"
G["The Dual Talent Specialization allows you to keep two active talent sets. You will be able to easily switch between these two specializations. When you switch between sets, you will also gain access to a second set of action bars. Switching cannot be performed while in combat, and will consume your available resources."] = "Специализация «Двойной талант» позволяет тебе сохранить два активных набора талантов. Ты сможешь легко переключаться между этими двумя специализациями. При переключении между наборами ты также получишь доступ ко второму набору панелей действий. Переключение невозможно выполнить во время боя, оно потребует использования имеющихся ресурсов."
G["The Earthen Ring seeks to preserve the strength and majesty of the elements."] = "Служители Земли стремятся сохранить силу и величие стихий."
G["The Sons of Gruul must be defeated if we are to shake off our shackles and live as free ogres once more! We must work quietly, yet quickly, if our underground resistance is to have a chance of success."] = "Сыны Груула должны быть побеждены, если мы хотим сбросить с себя оковы и снова жить как свободные огры! Мы должны работать тихо, но быстро, если мы хотим, чтобы наше подпольное сопротивление имело шанс на успех."
G["The World's End Tavern may be found in the easternmost portion of the lower city."] = "Таверну «На краю земли» можно найти в самой восточной части нижнего города."
G["The control panel shifts and rotates on its axis."] = "Панель управления смещается и вращается вокруг своей оси."
G["The druids protect me from the naga and evil Lost Ones. In exchange, I teach them about the plants and animals of the marsh."] = "Друиды защищают меня от наг и злых Заблудших. Взамен я рассказываю им о болотных растениях и животных."
G["The interrogator is trying to find out what these blood elves are doing here in Nagrand. From what I hear, they're after crystal powder residue from Oshu'gun, the diamond mountain to the west. No doubt to use in some insidious scheme or concoction... If you are looking to help our cause and stop these blood elves, the conflict is happening right now to the northwest at Halaa. Blood elves and those Hand of Argus soldiers are battling! Join in and show them what's right!"] = "Следователь пытается выяснить, что эти эльфы крови делают здесь, в Награнде. Насколько я слышал, они ищут остатки кристаллического порошка из Ошу'гуна, алмазной горы на западе. Без сомнения, для использования в какой-то коварной схеме или вымысле... Если ты хочешь помочь нашему делу и остановить этих эльфов крови, конфликт происходит прямо сейчас на северо-западе в Халаа. Эльфы крови и солдаты Длани Аргуса сражаются! Присоединяйся и покажи им, что правильно!"
G["The land is in worse shape than I could've imagined. If the damage continues at this rate, Farahlon -- err, Netherstorm will be nothing but cosmic gravel very soon. Where will it stop, I wonder? Perhaps the better question is, 'will it stop?'"] = "Земля находится в худшем состоянии, чем я мог себе представить. Если разрушения будут продолжаться такими темпами, Фаралон… эээ, Пустоверть очень скоро превратится в космический гравий. Интересно, где это остановится? Возможно, лучший вопрос: «Остановится ли это?»"
G["The musty pages of the codex seem to magically turn themselves, guiding your attention to a specific chapter past horrors no mortal eyes should ever perceive. The book opens to a page that somehow feels 'right,' yet so very wrong."] = "Заплесневелые страницы кодекса, кажется, волшебным образом переворачиваются, направляя твое внимание на конкретную главу, мимо ужасов, которые ни один смертный никогда не должен видеть. Книга открывается на странице, которая почему-то кажется «правильной», но в то же время совершенно неправильной."
G["The naaru are wise beyond our understanding. I've learned more from A'dal in the last five months than all the years I spent in the libraries of Dalaran."] = "Наару мудры за пределами нашего понимания. За последние пять месяцев я узнал от А'дала больше, чем за все годы, проведенные в библиотеках Даларана."
G["The night Kael'thas leveled the village, I could do nothing to help. His magic had already sealed me in the tower, exacerbating my torment by forcing me to witness the deaths of my fellows. And still their voices are calling from far away, waking me up in the middle of the night."] = "В ту ночь, когда Кель'тас сровнял с землей деревню, я ничем не мог помочь. Его магия уже запечатала меня в башне, усугубив мои мучения, заставив меня стать свидетелем смерти моих собратьев. И все же их голоса зовут издалека, будя меня посреди ночи."
G["The orb behind me was once capable of glimpsing into the happenings on Azeroth. Kael'thas's curse changed all that, of course, but during our years of isolation many of the mages found solace in its images. Some scried to remember; some scried to forget."] = "Сфера позади меня когда-то была способна видеть происходящее в Азероте. Проклятие Кель'таса, конечно, всё изменило, но в годы нашей изоляции многие маги находили утешение в его изображениях. Некоторые жаждали вспомнить; некоторые мечтали забыть."
G["The spirits are restless, draenei. Be mindful of your surroundings while in Nagrand lest you be consumed by their fury."] = "Духи беспокойны, дренеи. Будь внимателен к тому, что тебя окружает, пока ты в Награнде, чтобы не поддаться их ярости."
G["Then you are a fool. Do you not know what I am?"] = "Тогда ты дурак. Разве ты не знаешь, кто я?"
G["There I was tumbling in a patch of prickly undergrowth with a talbuk stag, hand-to-hand, only my sharp knife...<cough>... and keen hunter's intellect to save me. All of a sudden I'm jumped by a pair of fierce windroc hunters that came at me from the skies! Their cowardly attack...<cough>... didn't help them any though. And while I have their beaks as trophies, I received an infected scratch out of the ordeal. Kind of nasty, and I'm in a lot of pain, but I'm sure it'll heal up in a day or two."] = "Там я кувыркался в колючем подлеске с оленем-талбуком, врукопашную, и только мой острый нож... <кашель>... и охотничья смекалка могли меня спасти. Внезапно на меня набросилась пара свирепых ветрухов-охотников, налетевших на меня с небес! Их трусливая атака... <кашель>... однако им ничем не помогла. И хотя их клювы у меня в качестве трофеев, в результате мытарств я получил зараженную царапину. Немного противно, и мне очень больно, но я уверен, что через день или два все заживет."
G["There are some who call me 'Tim,' but to my friends, I am 'the specialist.'"] = "Некоторые называют меня «Тим», но для моих друзей я «специалист»."
G["There was something else I wanted to ask you, Altruis."] = "Я хотел спросить тебя еще кое о чем, Алтруис."
G["There was something else I wanted to ask you."] = "Я хотел спросить у тебя еще кое-что."
G["There's an old saying, \"Give a man a fish; you have fed him for a day. Teach a man to fish; and you have fed him for a lifetime.\" Of course, you might want to cook that fish and that is where I come in."] = "Есть старая поговорка: «Дай человеку рыбу, и ты накормишь его на один день. Научи человека ловить рыбу, и ты накормишь его на всю жизнь». Конечно, ты можешь захотеть приготовить эту рыбу, и именно здесь я вступаю в игру."
G["These druids have tapped a tremendous source of power! They can turn into animals... project lightning and intense moonlight... I must discover how they do it! Perhaps they're wearing batteries underneath those robes..."] = "Эти друиды воспользовались огромным источником силы! Они могут превращаться в животных... излучать молнии и яркий лунный свет... Я должен узнать, как они это делают! Возможно, у них под мантией спрятаны батарейки..."
G["These great beasts know paths that ye can't find on foot, they'll get ye there fast and maybe show ye something new at the same time."] = "Эти огромные звери знают тропы, которых тебе не найти пешком, они быстро домчат тебя туда и, глядишь, покажут кое-что новое."
G["These people arrived from Shattrath a few nights ago and they haven't stopped arguing since then. I'm glad to see that hasn't turned you away, I was beginning to think they were scaring off potential customers."] = "Эти люди прибыли из Шаттрата несколько ночей назад и с тех пор не перестают спорить. Я рад видеть, что это не отпугнуло тебя, я начал думать, что они отпугивают потенциальных клиентов."
G["They elude me. I cannot see past their defenses. They have put in place wards to prevent detection. <Altruis points westward.> They fear us because they know that we fear nothing. The cost for such power is great, the sacrifices many."] = "Они ускользают от меня. Я не могу видеть сквозь их защиту. Они установили защитные барьеры, чтобы предотвратить обнаружение. <Алтруис указывает на запад.> Они боятся нас, потому что знают, что мы ничего не боимся. Цена такой власти велика, жертв много."
G["This is just horrible. I care not for our own discomforts here, but we must do something to ease the pain of the dead in the Bone Wastes!"] = "Это просто ужасно. Меня не волнуют наши собственные неудобства здесь, но мы должны что-то сделать, чтобы облегчить боль мертвецов в Костяных пустошах!"
G["This is what I have gathered from the information that you collected from the survey. There are two primary forge camps: Forge Camp: Hate, directly west of where we stand and Forge Camp: Fear, directly southwest. Each camp has a Legion transporter, one forge, and several spell warding towers. Additionally, the camps are guarded by wrathguards manning fel cannons. Lastly, each camp has a pit lord overseer. Right then, this should be no problem at all... <Altruis laughs.>"] = "Это то, что я понял из информации, которую ты собрал в ходе разведки. Есть два основных лагеря Легиона: Лагерь Легиона: Ненависть, прямо к западу от того места, где мы стоим, и Лагерь Легиона: Страх, прямо к юго-западу. В каждом лагере есть транспортер Легиона, одна кузница и несколько башен защиты от заклинаний. Кроме того, лагеря охраняют стражи гнева, оснащенные пушками Скверны. Наконец, в каждом лагере есть надзиратель лорда преисподней. Ну что ж, с этим вообще не должно быть проблем... <Алтруис смеется.>"
G["This means war, Lump! War I say!"] = "Это означает войну, Глыб! Война, говорю!"
G["Times are changing, $N. War has arrived. Will our people rise to the occasion and aid our allies... or will we linger in the sidelines?"] = "Времена меняются, $N. Война пришла. Сможет ли наш народ оказаться на высоте и помочь нашим союзникам... или мы задержимся в стороне?"
G["To many of my people I am known as a traitor... as Illidan's lapdog. It is best that they continue to think that for now."] = "Многим из моего народа я известен как предатель... как болонка Иллидана. Лучше всего, чтобы они пока продолжали так думать."
G["Trapped in this broken wasteland, we did our best to survive. Over time we sensed that a new evil was closing in around us from the Twisting Nether. More foul than the dark orcs - it was the Burning Legion itself that sought to take hold of this... Outland."] = "Запертые в этой разрушенной пустоши, мы изо всех сил старались выжить. Со временем мы почувствовали, что новое зло приближается к нам из Круговерти Пустоты. Еще более мерзкие, чем темные орки, — это сам Пылающий Легион стремился завладеть этим… Запредельем."
G["Varedis was his name. To Illidan's surprise, not only did he succeed in the excruciating rites of passage that are part of the training; Varedis was already displaying better command over his powers than many veteran demon hunters. Illidan sensed the potential in Varedis and assigned three master demon hunters to train him further in their ways."] = "Его звали Варедис. К удивлению Иллидана, он не только преуспел в мучительных обрядах посвящения, которые являются частью обучения; Варедис уже демонстрировал лучшее владение своими силами, чем многие опытные охотники на демонов. Иллидан почувствовал потенциал Варедиса и поручил трем мастерам-охотникам на демонов обучать его дальше."
G["We are ready to get you out of here, Thrall. Let's go!"] = "Мы готовы вытащить тебя отсюда, Тралл. Пойдем!"
G["We will fight you until the end, then, Lantresor. We will not stand idly by as you pillage our towns and kill our people."] = "Тогда мы будем сражаться с тобой до конца, Лантрезор. Мы не будем бездействовать, пока ты грабишь наши города и убиваешь наших людей."
G["We've got to get those supply crates back!"] = "Мы должны вернуть эти ящики с припасами!"
G["Weapon Master"] = "Мастер оружия"
G["Welcome to the Cenarion Refuge, $N. I've been instructed to offer you basic supplies for purchase, should you need them."] = "Добро пожаловать в Кенарийский приют, $N. Мне поручено предложить тебе приобрести основные материалы, если они тебе понадобятся."
G["Welcome, friend of the free people of the Lower City, but do not tarry long. There are sounds of battle coming from within. My compatriots could use your assistance!"] = "Добро пожаловать, друг свободных жителей Нижнего города, но не задерживайся надолго. Изнутри доносятся звуки битвы. Моим соотечественникам не помешала бы твоя помощь!"
G["Well look at you. Aren't you big and tough... Maybe you think you're tough enough to step into the Ring of Blood and face the Warmaul champion? <The pitfighter laughs.> Not very likely but if you ever wanna test your strength, the Ring of Blood is far to the north against the mountains dividing Nagrand and Zangarmarsh. Gurgthock runs the show at the old Laughing Skull Ruins and he also dispenses the prizes. Speaking of prizes, I hear the prizes this season are incredible!"] = "Ну посмотри на себя. Разве ты не большой и сильный... Может быть, ты думаешь, что достаточно силен, чтобы выйти на Кольцо Крови и сразиться с чемпионом Боевого Молота? <Боец ямы смеется.> Маловероятно, но если ты когда-нибудь захочешь проверить свои силы, Кольцо Крови находится далеко на севере, среди гор, разделяющих Награнд и Зангартопь. Гаргток заправляет всем в старых руинах Веселого Черепа, а также раздает призы. Говоря о призах, я слышал, что призы в этом сезоне невероятные!"
G["What are you after? Speak up."] = "Что тебе нужно? Говори."
G["What did you do then?"] = "Что ты сделал тогда?"
G["What do I need to do?"] = "Что мне нужно сделать?"
G["What do you have for sale?"] = "Что у тебя есть на продажу?"
G["What do you see when you look to the west, mortal?"] = "Что ты видишь, когда смотришь на запад, смертный?"
G["What do you think when you think Wildhammer, eh? Gryphon riders, if you've any sense! Shadowmoon is no Aerie Peak, but we've still got fine stock for you, aye, fine stock. Take a look at my beauties and see if one of 'em catches your eye!"] = "Что ты думаешь, когда думаешь о Громовом Молоте, а? Наездники на грифонах, если у тебя есть хоть немного здравого смысла! Призрачная Луна — это не Заоблачный Пик, но у нас еще есть для тебя отличный запас, да, отличный запас. Взгляни на моих красавиц и посмотри, привлечёт ли кто-то из них твое внимание!"
G["What elekks are for sale?"] = "Какие элекки продаются?"
G["What happened next?"] = "Что произошло дальше?"
G["What sort of trainer were you looking for?"] = "Какого тренера ты искал?"
G["What trainer do you seek?"] = "Какого тренера ты ищешь?"
G["What's an \"Ologist?\" A better question might be what isn't an \"Ologist.\" It means I study everything! In fact, I'm so well versed in \"everything\" that I'm guaranteed to be the most intelligent ethereal you'll ever meet - or your money back. Apologies. That's the dealer in me talking..."] = "Что такое «Олог»? Лучше спросить, кто не является «ологом». Это значит, что я изучаю все! На самом деле, я настолько хорошо разбираюсь во «всем», что гарантированно стану самым умным эфириалом, которого ты когда-либо встретишь, — или верну тебе деньги. Извини. Это говорит дилер во мне..."
G["What's your pleasure? Pull up a seat and knock one back. I'm Boots, lead mixologist for B.O.O.M. and bartender extraordinaire! If it's got kick, Ol' Boots can give it to ya."] = "Что будешь пить? Присаживайся и опрокинь стаканчик. Я Бутс, ведущий бармен МОЗГа и бармен экстра-класса! Если у напитка есть крепость, старина Бутс тебе нальет."
G["When I was young I trained hard to become an anchorite in the priesthood. Female exarchs were practically unheard of. Nowadays gender matters little - it is courage and conviction that make all the difference."] = "В молодости я усердно тренировался, чтобы стать отшельником в священстве. О женщинах-экзархах практически не было слышно. В наши дни пол не имеет большого значения: решающее значение имеют смелость и убежденность."
G["While my comrades held the line against the encroaching darkness, I used my magic to reach out into the Great Dark Beyond. There, I sensed beings of immense Light - of unfathomable purity. It was A'dal and his naaru I had found. It was nothing short of a... miracle."] = "Пока мои товарищи сдерживали наступающую тьму, я использовал свою магию, чтобы добраться до Великой Тьмы Запредельного. Там я почувствовал существ безмерного Света, непостижимой чистоты. Я нашел А'дала и его наару. Это было не что иное, как... чудо."
G["Who are you? Just leave me be."] = "Кто ты? Просто оставь меня в покое."
G["Who so boldly stands before Lantresor of the Blade? Do you not know death by sight, boy?"] = "Кто так смело стоит перед Лантрезором Клинка? Разве ты не узнаешь смерть в лицо, мальчик?"
G["Why are Boulderfist out this far? You know that this is Kurenai territory."] = "Почему Тяжелый Кулак зашел так далеко? Ты знаешь, что это территория Куренай."
G["Why you mean to Lump? Lump hungry, dat's all."] = "За что ты так с Глыбом? Глыб просто голодный, вот и все."
G["Within a year of training under Illidan's best three demon hunters, Varedis had surpassed them. No longer content with the training they had to offer, Varedis infiltrated the Shadow Council where he learned of a powerful relic known as the Book of Fel Names. He secretly read from this book, committing each passage to memory."] = "За год обучения под руководством трех лучших охотников на демонов Иллидана Варедис превзошел их. Больше не довольствуясь обучением, которое они могли предложить, Варедис проник в Совет Теней, где узнал о могущественной реликвии, известной как Книга Имен Скверны. Он тайно читал из этой книги, запоминая каждый отрывок."
G["Ya may know a thing or two about handlin' animals, but have ya ever taken ta the skies? We Wildhammers know how ta ride the wind with the best of 'em. Fer a small fee, if ya've got the mettle, I'll train ya good and proper."] = "Возможно, ты кое-что знаешь об обращении с животными, но поднимался ли ты когда-нибудь в небо? Мы, Громовые Молоты, знаем, как оседлать ветер вместе с лучшими из них. За небольшую плату, если у тебя хватит смелости, я обучу тебя хорошо и правильно."
G["Yes. I do."] = "Да, хочу."
G["You - come here. Are these blades not the finest quality? Surely you wish to purchase from me. You will not find such workmanship and care wrought into such weapons anywhere else, draenei."] = "Ты - иди сюда. Разве эти лезвия не самого высокого качества? Наверняка ты захочешь купить у меня. Дреней, ты больше нигде не найдешь такого мастерства и тщательности изготовления такого оружия."
G["You look like a reasonable draenei. Perhaps we could be of mutual assistance."] = "Ты похож на разумного дренея. Возможно, мы могли бы помочь друг другу."
G["You must use the incendiary bombs at the barrels inside the internment lodges of Durnholde Keep. Once five bombs have been ignited and the diversion has been set, find Thrall in the basement prison of Durnholde and set him free. Follow him and make sure that he does not die! Brazen will fly you to Durnholde when you are ready."] = "Ты должен использовать зажигательные бомбы в бочках внутри палаток для интернированных в крепости Дарнхольд. Как только пять бомб будут взорваны и диверсия будет организована, найди Тралла в подвальной тюрьме Дарнхольда и освободи его. Следуй за ним и убедись, что он не погиб! Бронзень отвезет тебя в Дарнхольд, когда ты будешь готов."
G["You should recieve a pack of incendiary bombs from Erozion before I fly you to Durnholde. You wouldn't want to waste time, after all."] = "Прежде чем я отправлю тебя в Дарнхольд, ты должен получить от Эрозиона пачку зажигательных бомб. В конце концов, тебе не хотелось бы терять время зря."
G["You will find a number of shaman trainers in the Crystal Hall. Perhaps you should visit Farseer Nobundo there, and show the Broken some pity. Light be with you."] = "Ты найдешь несколько тренеров шаманов в Кристальном зале. Возможно, тебе стоит навестить там Предсказателя Нобундо и проявить жалость к Сломленным. Свет да пребудет с тобой."
G["You will stage a series of events that will lead the Kil'sorrow orcs of Kil'sorrow Fortress to believe that the Warmaul ogres have attacked their base and then another series of events to make the Warmaul ogres believe the Kil'sorrow orcs are attacking their base. Do this and you solve both of our problems. The Boulderfist will have their territory back and your people will be free from attack from Boulderfist, Warmaul and Shadow Council."] = "Ты устроишь серию событий, которые заставят орков Кил'Скорби в Крепости Кил'Скору поверить, что огры Боевого Молота напали на их базу, а затем еще одну серию событий, которые заставят огров Боевого Молота поверить в то, что орки Кил'Скору нападают на их базу. Сделай это, и ты решишь обе наши проблемы. Тяжёлый Кулак вернет свою территорию, а твой народ будет свободен от атак со стороны Тяжелого Кулака, Боевого Молота и Совета Теней."
G["You're definitely strong, draenei, but do you have what it takes to become the Warmaul champion?"] = "Ты определенно силен, дреней, но хватит ли у тебя качеств, чтобы стать чемпионом Боевого Молота?"
G["I don't want excuses, I demand results! You think what we're doing here is a joke? If we don't do this right, then not only will the so-called do-gooders come calling, but we'll be found unworthy for elevation within the ranks of the Blackwing. Is that what you want?"] = "Никаких оправданий, мне нужны результаты! Думаешь, то, чем мы тут занимаемся, — шутка? Если мы не сделаем всё как надо, сюда сбегутся так называемые доброхоты, а нас сочтут недостойными возвышения в рядах Крыла Тьмы. Ты этого хочешь?"
G["I can instruct you in mining. Interested?"] = "Я могу обучить тебя горному делу. Интересно?"
G["Your help was invaluable, my friend. I can assure you that the Cenarion Expedition will do everything in its power to counter any future tainted crystals dropped from the heavens by Illidan."] = "Твоя помощь была бесценна, друг мой. Смею заверить, Кенарийская экспедиция сделает все возможное, чтобы противостоять новым оскверненным кристаллам, которые Иллидан может обрушить с небес."
G["Where can I find the relics of Terokk?"] = "Где можно найти реликвии Терокка?"
G["The Ethereum have grown dark... twisted. Vengeance has become their only recourse and any that would stand in their way or not join their cause are considered enemies. Many saw that the Ethereum were plummeting into madness and left. Several of the Nexus-Princes of the Ethereum council abandoned the Ethereum to form other groups and factions with different goals. The Consortium are one such example of an off-shoot group. The Protectorate another..."] = "Братство Эфириум обратилось ко тьме... исказилось. Месть стала их единственным прибежищем, и всякий, кто встанет у них на пути или не поддержит их дело, считается врагом. Многие увидели, что братство Эфириум погружается в безумие, и ушли. Несколько принцев Эфириума покинули Братство и создали другие группы и фракции, с иными целями. Консорциум – одна из таких отделившихся групп, другая же – Протекторат."
G["Dealer Hazzin, what do you have to offer?"] = "Делец Хаззин, что ты можешь предложить?"
G["Control Human Cleric"] = "Управление Священником"
G["Soon I will plant roots and sleep. Before I rest there are things that must yet be done."] = "Скоро я пущу корни и засну. Но прежде чем я погружусь в отдых, мне нужно сделать некоторые дела..."
G["The Ethereum were the ruling class of ethereal on my homeworld of K'aresh. Tragically, we were forced to evacuate K'aresh shortly before the void lord, Dimensius, unleashed his void armies upon the world and utterly decimated all that stood in his way. For this act, the Ethereum vowed vengeance. They have been tracking Dimensius ever since... The Protectorate, however, were not a reaction to Dimensius. We were a reaction to Ethereum."] = "Эфириум был правящим классом эфириалов на моей родине, К'ареше. Трагическим образом нам пришлось эвакуироваться из К'ареша незадолго до того, как повелитель Бездны Пространствус обрушил на мир свои армии Бездны и уничтожил все, что стояло на его пути. За это Эфириум поклялся отомстить. С тех пор они выслеживают Пространствуса... Протекторат же возник не в ответ на Пространствуса. Мы возникли в ответ на Эфириум."
G["Greetings, fleshling. I am Navuud, chief researcher here at the Protectorate Watch Post."] = "Приветствую, смертный. Я – Навууд, главный исследователь на заставе стражей Протектората."
G["What do you have to sell, Tuluman?"] = "Что ты продаешь, Тулуман?"
G["What's needed for the cauldron at Gahrron's Withering?"] = "Что нужно для котла на пустоши Гаррона?"
G["My loathing of interruptions is overshadowed only by my hatred of Gruul the Dragonkiller and his seven sons!"] = "Больше, чем помехи, я ненавижу лишь Груула Драконобоя и семь его сыновей!"
G["I'm fine, thank you. You asked for me?"] = "Я в порядке, спасибо. Ты искал меня?"
G["That's the spirit! I'm glad that we had this little meeting. I feel much better about the attack now. With leaders like you on the front, how can we lose? Alright, you have your marching orders. Now get back to the Ruuan Weald and make it happen!"] = "Вот это боевой дух! Я рад, что мы устроили эту небольшую встречу. Теперь я гораздо увереннее смотрю на предстоящую атаку. С такими командирами, как ты, во главе — разве мы можем проиграть? Ну что ж, приказ ты получил. Возвращайся в чащобу Рууан и проведи операцию!"
G["The Sons of Lothar have been fighting a war without end. I'm amazed we've kept our equipment in as good a shape as it is!"] = "Сыны Лотара бесконечно сражались. Я удивлен, что мы сохранили нашу экипировку в столь хорошем виде!"
G["Karazhan is more than a mere building, $N. If you traced the ley-lines traversing Azeroth you would find that they all converge right about there. <Alturus points at an invisible spot below the tower.> Fascinating, isn't it?"] = "Каражан — это не просто здание, $N. Если проследить силовые линии, пронизывающие Азерот, окажется, что все они сходятся прямо вон там. <Альтур указывает на невидимую точку у подножия башни.> Занятно, не правда ли?"
G["What are Ethereum?"] = "Что такое братство Эфириум?"
G["I heard that Kolphis Darkscale has been looking for you."] = "Я слыхала, тебя искал Колфис Черная Чешуя."
G["I am here at the behest of my master, Baron Sablemane, to help the Cenarion Expedition with its wyrmcult problems. I'm something of an expert on these things."] = "Я здесь по велению моего господина, барона Черногрива, чтобы помочь Кенарийской экспедиции с проблемами культа Змея. В этих делах я, можно сказать, эксперт."
G["There's trouble in the woods. We must uncover its source before it is too late!"] = "В лесу неспокойно. Мы должны выяснить, в чем дело, пока не стало слишком поздно!"
G["Overseer, I am here to negotiate on behalf of the Cenarion Expedition."] = "Надзиратель, я прибыл сюда для переговоров от имени Кенарийской экспедиции."
G["We're putting the final preparations together even as we speak. The rest will depend upon how quickly you can organize your forces at Ruuan Weald. Do you think that you can handle that and get it done quickly?"] = "Мы завершаем последние приготовления прямо сейчас, пока мы говорим. Все остальное зависит от того, как быстро ты сможешь собрать свои силы в чащобе Рууан. Как думаешь, справишься и сделаешь это быстро?"
G["We've come to the Ruuan Weald to see if we can reestablish the balance of nature to these mountains. The interference of the arakkoa and the wyrmcult is making this a difficult task, however. Luckily, there are those like you and Samia that are willing to lend us a hand."] = "Мы пришли в чащобу Рууан, чтобы попытаться восстановить природное равновесие в этих горах. Однако вмешательство араккоа и культа Змея сильно осложняет эту задачу. К счастью, есть такие, как ты и Самия, кто готов протянуть нам руку помощи."
G["Now's our chance! Let me out of this cage!"] = "Вот он, наш шанс! Выпусти меня из клетки!"
G["<Isfar sighs.> A couple of treehouses don't make a home, but it was vast improvement over the Sethekk Halls. Comfortable as it was in Shattrath, I can't bring myself to return to my true home in Skettis without my sister. She's still trapped in the Sethekk Halls, held prisoner by our older brother."] = "<Исфар вздыхает.> Пара домиков на деревьях — это, конечно, не дом, но все же куда лучше Сетеккских залов. Как бы уютно ни было в Шаттрате, я не могу заставить себя вернуться в родной Скеттис без сестры. Она все еще томится в плену в Сетеккских залах у нашего старшего брата."
G["Welcome to the Stormspire, shaman. Please do not be put off by my being present through this imaging device. I have many enemies that would like to see me dead, so it is only a precaution. I assure you that you are perfectly safe here."] = "Добро пожаловать в Штормовую Вершину, шаман. Прошу, пусть тебя не смущает, что я предстаю перед тобой через это проекционное устройство. У меня много врагов, которые желали бы моей смерти, так что это лишь мера предосторожности. Уверяю, здесь ты в полной безопасности."
G["The Sethekk believe themselves to be the true and most loyal followers of the master of all arakkoa. Do not ask about the master, draenei, for his mysteries are for the feathered people alone. The Sethekk interpreted the destruction of Auchindoun to be the arrival of our master on this planet. They set out for the ruins, taking with them the relics of our greatest hero, Terokk. They still seek the master in the temple's ruins, but I came to see through their lies. I am no longer one of them."] = "Сетекки считают себя истинными и самыми верными последователями владыки всех араккоа. Не спрашивай о владыке, дреней, — его тайны предназначены только для пернатого народа. Сетекки истолковали разрушение Аукиндона как явление нашего владыки в этот мир. Они отправились к руинам, забрав с собой реликвии нашего величайшего героя, Терокка. Они до сих пор ищут владыку среди руин храма, но я сумел разглядеть их ложь. Я больше не один из них."
G["What could you be selling?"] = "Что ты можешь продать?"
G["You could at least try to sound a little bit convincing. Look, Nuaar, I wasn't going to tell you this, but I might as well because it's going to involve you, too. Maxnar is planning an all-out attack on the druids at Ruuan Weald. And he intends to wipe them out. It's bad enough that we've been fighting with the Boulder'mok ogres, so we can't afford another front to deal with. I've arranged for a temporary truce with the arakkoa. Well, what do you think?"] = "Ты бы хоть постарался звучать убедительнее. Слушай, Нуаар, я не собирался тебе этого говорить, но так уж и быть, скажу — это все равно тебя коснется. Макснар готовит полномасштабное нападение на друидов в чащобе Рууан. Он намерен стереть их с лица земли. Нам и так хватает войны с ограми Камен'мока, так что еще один фронт мы не потянем. Я договорился о временном перемирии с араккоа. Ну, что скажешь?"
G["Right, the meeting. Let's get down to it then. The fact is that the lumber and livestock being gathered from the Ruuan Weald, which you're responsible for, has slowed to a trickle. We need those resources, but you've allowed the druids of the Cenarion Expedition to get in the way!"] = "Ладно, встреча так встреча. Тогда сразу к делу. Дело в том, что поставки леса и скота из чащобы Рууан, за которые отвечаешь ты, превратились в жалкий ручеек. Нам нужны эти ресурсы, а ты позволил друидам из Кенарийской экспедиции встать у нас на пути!"
G["So what is your purpose?"] = "И какова твоя цель?"
G["I would like to go to the battleground."] = "Я хочу отправиться на поле боя."
G["Fairweather and I are up here representing Sylvanaar's interests. The druids have been more than accomodating, but allowing the Horde to travel through here gives me the willies."] = "Мы с Файрвезером находимся здесь, представляя интересы Сильванаара. Друиды были более чем гостеприимны, но от одной мысли, что через эти земли свободно ходит Орда, у меня мурашки по коже."
G["Who is this Terokk you keep mentioning?"] = "Кто этот Терокк, которого ты то и дело упоминаешь?"
G["Negotiations? NEGOTIATIONS! Allow me to make our stance perfectly clear. We are a free people, able to do whatever we want and come and go as we please. The Cenarion Expedition does not own this mountain range. There will be no negotiations! Now, go back to the druids and tell them that we will continue to do as we please."] = "Переговоры? ПЕРЕГОВОРЫ! Позволь мне высказаться предельно ясно. Мы свободный народ, вольны делать, что хотим, и приходить и уходить, как нам вздумается. Кенарийская экспедиция не владеет этим горным краем. Никаких переговоров не будет! А теперь возвращайся к друидам и передай им, что мы и дальше будем поступать так, как считаем нужным."
G["I am here at the behest of Nexus-Prince Haramad. Strange things are afoot at the Stormspire."] = "Я здесь по приказу принца нексуса Харамада. Странные вещи происходят у Штормовой Вершины..."
G["In Outland, our forces fight against the Horde to control the Eye of the Storm. It is dangerous, fighting amidst the raging energies of the Nether. Do you have what it takes to join us?"] = "Здесь, в Запределье, наши войска сражаются с Ордой за обладание Оком Бури. Это очень опасно – биться посреди бушующей энергии Пустоты. У тебя есть необходимые данные для участия в битве?"
G["He is the greatest hero the arakkoa have ever known. It is said that in ancient times, he built the city of Skettis with his own claws. He was our greatest champion and defender, but he left us when we turned away from the veneration of Rukhmar. We came to worship a new master, one who promised us untold power and status in the cosmos. There are some who say that Terokk and Rukhmar are one, and he withdrew his presence from us when we turned away from him."] = "Он величайший герой из всех, кого когда-либо знали араккоа. Говорят, в древние времена он построил город Скеттис собственными когтями. Он был нашим величайшим защитником и поборником, но покинул нас, когда мы отвернулись от почитания Рухмара. Мы стали поклоняться новому владыке, который посулил нам невиданную силу и место среди звезд. Некоторые говорят, что Терокк и Рухмар — одно и то же, и что он лишил нас своего присутствия именно тогда, когда мы отвернулись от него."
G["Who are the Sethekk?"] = "Кто такие Сетекки?"
G["You are always welcome with us here in the Raven's Wood, $N."] = "Ты всегда будешь $gжеланным гостем:желанной гостьей; в лесу Ворона, $N."
G["All things for sale, my friend! Large and small, whatever you need, Hazzin will provide. If you value your life, do not approach Manaforge Ultris without a resupply. Hazzin is the last chance that you have."] = "Все на продажу, дружище! Большое и малое — что бы тебе ни понадобилось, у Хаззина все найдется. Если дорожишь жизнью, не суйся к манагорну Ультрис без припасов. Хаззин — твой последний шанс запастись всем необходимым."
G["I don't understand. What do you mean, Ameer?"] = "Я не понимаю. О чем ты, Амир?"
G["They fear my words. They make an example out of me. A mockery of the one true god, Neptulon. <Skar'this spits.> Retribution comesss, mortal. The glorious hand of the Tidehunter will one day sweep through the non-believers like a scythe against a new harvest."] = "Они боятся моих слов. Делают из меня пример для устрашения. Насмешку над единственным истинным богом, Нептулоном. <Скар'тис плюется.> Возмездие свершитсссся, смертный. Однажды славная длань Хозяина Приливов пройдется по неверующим, точно коса по свежему урожаю."
G["<The cleric stares at you through the corner of its eye.>"] = "<Краем глаза священник смотрит на тебя.>"
G["I'll have you out of there in just a moment."] = "Я тебя в минуту оттуда достану."
G["Ah, such an odd place to find potential customers!"] = "Хм, какое странное место для поиска покупателей!"
G["Fleshling, I am Captain Saeed of the Protectorate and these soldiers that stand by me are my avengers. We await orders from the fleshling who destroyed the void conduit. On that fleshling's word, we will make our way up to Dimensius's lair and wait for the word to make a final strike! Too long it has been... The void lord will soon face our combined might!"] = "Смертный, я капитан Саид из Протектората, а эти солдаты рядом со мной — мои мстители. Мы ждем приказа от смертного, который уничтожил стержень Бездны. По его слову мы двинемся к логову Пространствуса и будем ждать сигнала для последнего удара! Слишком долго это тянулось... Скоро повелитель Бездны познает нашу совместную мощь!"
G["I cannot thank you enough for making my pilgrimage possible!"] = "Я прямо не знаю, как отблагодарить тебя за возможность совершить паломничество!"
G["I have neither the time, nor the inclination, to explain things to you, scumbag! Now do you have something important to say, or are you just here to ask me out for a drink, princess?"] = "У меня нет ни времени, ни желания объяснять тебе что бы то ни было, дрянь! А теперь – говори, и лучше пусть это будет нечто толковое, или ты здесь для того, чтобы пригласить меня на рюмочку, принцесса?"
G["'Talon King' Ikiss is one of the leaders of the Sethekk, along with my brother, Darkweaver Syth. It was they who led the exodus of the Sethekk from Skettis to the ruins of Auchindoun. In the beginning, Ikiss was a charismatic leader, but he has descended into madness. Now, he openly proclaims that he is Terokk reborn! He truly expects the arakkoa to bend knee to him as their ruler. Can you believe his arrogance?"] = "«Король воронов» Айкисс — один из предводителей Сетекков наравне с моим братом, Темнопрядом Ситом. Именно они возглавили исход Сетекков из Скеттиса к руинам Аукиндона. Поначалу Айкисс был харизматичным лидером, но затем скатился в безумие. Теперь он открыто заявляет, что он — переродившийся Терокк! Он всерьез рассчитывает, что араккоа преклонят перед ним колени как перед своим правителем. Можешь поверить в подобную дерзость?"
G["If you have come all the way out here, then it must be that you dare to venture near Manaforge Ara. Care to buy or sell before you head over?"] = "Если ты забрался в такую даль, то, должно быть, решился отправиться к манагорну Ара. Не желаешь купить или продать что-нибудь, прежде чем пойдешь дальше?"
G["We feel that the Ethereum are as great a threat to our existence as Dimensius. Both must be stopped..."] = "Мы чувствуем, что братство Эфириум так же опасно для нас, как и Пространствус. И их, и его надо остановить..."
G["Alright, Bite, I'll let you out."] = "Хорошо, Кус, я тебя выпущу."
G["We know that the wyrmcultists are massing on the other side of the tunnel. We'll make our stand here."] = "Мы знаем, что служители культа Змея собираются на другом конце туннеля. Мы будем защищаться!"
G["I need another Argent Dawn Commission."] = "Мне нужен новый Жетон Серебряного Рассвета."
G["Um, no... no, I don't want that at all."] = "Э... нет, нет, я этого не хочу."
G["Welcome to Eco-Dome Midrealm, traveler. I would warn you to be wary of dealing with that goblin, Shauly. I don't believe I've ever heard anyone use the word \"buddy\" as punctuation before."] = "Добро пожаловать в заповедник \"Срединные земли\", $gпутник:странница;. Я хотел бы предупредить тебя: будь осторожнее вон с тем гоблином, Шоли. Мне еще не доводилось слышать, чтобы кто-нибудь использовал слово \"приятель\" в качестве вводного слова."
G["Absolutely!"] = "Конечно!"
G["Among ethereals, certain members deal specifically with flesh and beings of flesh. Those individuals are known as flesh handlers."] = "Некоторые эфириалы охотятся только на существ из плоти. Их называют мясоводами."
G["It is sad to see what has happened to this land. The Cenarion Expedition will do what it can to understand and heal the damage that has been done."] = "Грустно наблюдать за тем, что произошло с этой землей. Кенарийская экспедиция сделает все возможное, чтобы разобраться в случившемся и возместить нанесенный ущерб."
G["Well, well, well, what have we here? A Private? Isn't that precious? You'll get no special treatment from me!"] = "Так-так-так, и кто тут у нас? Рядовой? Ну разве не прелесть? От меня особого отношения не жди!"
G["Nuaar, are you feeling well? You don't look like yourself today."] = "Нуаар, что с тобой? Ты как-то странно выглядишь сегодня."
G["Oh, it's not my fault, I can assure you."] = "О, уверяю тебя, это не моя вина..."
G["Who is Talon King Ikiss?"] = "Кто такой король воронов Айкисс?"
G["There are only 3 kinds of people in this world: competitors, customers, and employees. Competitors are to be crushed ruthlessly, customers indulged, and employees strictly supervised. Independent contractors are a myth.They want to be paid better than employees, but treated like customers. Never trust one who calls himself by that title."] = "В этом мире есть только три типа людей: конкуренты, покупатели и работники. Конкурентов нужно безжалостно уничтожать, покупателей — баловать, а работников — держать под строгим надзором. Независимые подрядчики — это миф. Они хотят, чтобы им платили больше, чем работникам, но обращались с ними как с покупателями. Никогда не доверяй тому, кто называет себя этим словом."
G["Impressive. When do we attack?"] = "Впечатляет. Когда мы нападем?"
G["I almost made it! I came in here to prove the existence of Quagmirran, that most mythical of fungal giants. I got my wish, sort of. You must let me free! In return I will grant you a boon to help you to deal with Quagmirran."] = "Я почти справился! Я пришел сюда, чтобы доказать существование Зыбуна, того самого мифического грибного великана. И, в некотором роде, мое желание исполнилось. Ты должен освободить меня! В награду я одарю тебя благословением, которое поможет тебе справиться с Зыбуном."
G["Ameer might be worried about what the Ethereum are doing but I'm squarely focused on the real danger here: Dimensius."] = "Может, Амир и беспокоится насчет братства Эфириум, но меня сейчас волнует только одна настоящая опасность – Пространствус."
G["Hello, overseer. Ready for the attack?"] = "Здравствуй, надзиратель. Ты $gготов:готова; к атаке?"
G["What do you know about ethereals, fleshling? You undoubtedly view us all in the same light, oblivious to the conflicts and struggles between the differing factions. Perhaps it is time for an introduction. I am Commander Ameer of the Protectorate - also your only hope of resolving the infestation of both void creature and Ethereum in this area."] = "Что ты знаешь об эфириалах, смертный? Ты наверняка судишь о всех нас одинаково, не подозревая о распрях и противоборстве между разными фракциями. Пожалуй, пришло время познакомиться. Я командир Амир из Протектората — и твоя единственная надежда справиться с нашествием созданий Бездны и братства Эфириум в этих краях."
G["I think I understand now. Can I help with any of this? The Ethereum and void creatures are a threat to our survival as well."] = "Кажется, теперь я понимаю. Могу я чем-нибудь помочь? Братство Эфириума и создания Бездны угрожают и нашей жизни..."
G["I don't suppose you've come bearing news about the mines, have you?"] = "Не думаю, что ты $gпринес:принесла; новости о рудниках, верно?"
G["Sometimes the straightforward approach to a problem is the best."] = "Иногда проблемы лучше всего решать \"в лоб\"."
G["The Blade's Edge Mountains are a place of great opportunity. How unfortunate that some deem themselves above all others on matters that pertain to taking advantage of such opportunities. Who do the Cenarion Expedition think they are to tell us what we can and cannot do here?"] = "Острогорье — место огромных возможностей. Как жаль, что некоторые считают себя выше остальных, когда дело доходит до того, кому пользоваться этими возможностями. Кем себя возомнила Кенарийская экспедиция, указывая, что нам тут можно, а что нельзя?"
