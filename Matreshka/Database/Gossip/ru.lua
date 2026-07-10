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
