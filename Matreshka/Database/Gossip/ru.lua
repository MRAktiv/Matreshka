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
