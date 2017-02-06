
import UIKit
import CoreData
class MasterViewController: UITableViewController {
  
  // MARK: - Properties
  var detailViewController: DetailViewController? = nil
  var cities = [City]()
  
  var filteredCandies = [City]()
  let searchController = UISearchController(searchResultsController: nil)
  
  // MARK: - View Setup
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Setup the Search Controller
    searchController.searchResultsUpdater = self
    searchController.searchBar.delegate = self
    definesPresentationContext = true
    searchController.dimsBackgroundDuringPresentation = false
    
    // Setup the Scope Bar
  //  searchController.searchBar.scopeButtonTitles = ["Город", "Chocolate", "Hard", "Other"]
 //   tableView.tableHeaderView = searchController.searchBar
   
 
    cities = [
        City(id:1,category:"Город", name:"Абзаково",text:"Оздоровительно-спортивный центр Абзаково расположен в Башкортостане, на восточных склонах одного из южно-урвльских хребтов Кырыкты-Тау, на склонах горы Шайтан, на высоте 820 метров над уровнем моря.Здесь любят отдыхать не только жители блиайшего города - Магнитогорска, но и жители Урала, Сибири, а так же любител  зимних видов спорта из тенральных районов Росии. Абзаково располагает горнолыжными трассами всех категорий , включая трассы для слалома и слалома-гиганта , имеющие FIS сертификаты.Современные подъемники обеспечивают катание без очередей. Снегоуплотнительные машины осуществляют подготовку трасс.",coordinateX:53.83249709999999,coordinateY:58.596172000000024),
        City( id:2,category:"Город",name:"Адлер",text:"Адлер-курорт на Черном море, отдаленный микрорайон города Сочи. Этот район расположен на равнине, при впадении в Чёрное море реки Мзымты, с севера защищен Главным Кавказским хребтом с его вечными льдами и не тающими даже летом, вершинами, что тем самым обуславливает здесь относительно высокие среднегодовые температуры воздуха.Купальный сезон здесь продолжается 5 месяцев с июня по октябрь, летом средняя температура воздуха +26,5С, воды +24,5С. Благоприятные сезоны для санаторно-курортного лечения: осень, зима, весна. В период «зимы», средняя температура воздуха составляет +9, +10С.",coordinateX:43.427991 ,coordinateY:39.928844),
        City(id:3,category:"Город",name:"Адыгея",text:"Адыгею каждый год посещают тысячи туристов. Они приезжают сюда, чтобы сплавиться по рекам, пройти горными тропами, совершить восхождения, покататься на сноубордах и лыжах. Обширные территории девственной природы, большое разнообразие рельефа, дремучие заповедные леса, прекрасные каньоны горных рек, потрясающие альпийские луга манят к себе почитателей активного отдыха.Адыгея предлагает туристам и отдыхающим огромный спектр видов активного отдыха - водный туризм, альпинизм, каньонинг, горные лыжи, дельтапланеризм, спелеотуризм, езду на снегоходах, внедорожниках и квадроциклах. Также популярными видами отдыха в республике являются пеший, велосипедный и конный туризм.",coordinateX: 43.966332 ,coordinateY:39.272692),
        City(id:4,category:"Город",name:"Анапа",text:"Анапа находится в юго-западной части Краснодарского края РФ, на берегу Черного моря. Это один из крупнейших курортов России. Ландшафты курорта и окружающих его местностей весьма разнообразны: плавни, лиманы, соленые озера, предгорья с живописными долинами, реликтовыми лесами и растениями. Природно-климатические условия окрестностей позволяют выращивать лучшие лечебные сорта винограда, богатого глюкозой, витаминами и минеральными солями.",coordinateX:44.885701,coordinateY: 37.319919),
        City(id :5,category:"Город",name:"Астрахань",text:"Астраханская рыбка и астраханские арбузы — каждый житель Союза хоть раз да слыхал о них, а то и самолично пробовал. Красавица-Астрахань, стоящая на Волге и Каспии, всегда представлялась русскому человеку краем изобилия. И до сих пор это остается справедливым. Лидирующие направления в области туризма в Астрахани — это охота и рыбалка, ставшие своего рода брендом региона. Кроме того, начинаясь в Москве, в Астрахани заканчиваются разнообразные речные круизы по Волге. А многочисленные архитектурные и культурные достопримечательности дают все основания задержаться здесь на несколько дней даже равнодушным к копченой осетрине и балыку из белуги путешественникам.Нынешняя Астрахань — наследница множества народов, веками сменявших друг друга на Каспии, и по сей день она остается одним из самых многонациональных и мультикультурных городов России. Недаром поэт Велимир Хлебников назвал ее «треугольником Христа, Будды и Магомета».",coordinateX: 46.358805,coordinateY: 48.059935),
        City(id :6,category:"Город",name:"Волгоград",text:"Любители активного отдыха в Волгограде могут совершить незабываемые прогулки на катерах, лодках и туристических теплоходах. Для рыбаков здесь есть прекрасные туристические базы, которые кроме основных рекреационных услуг, организуют выезды в рыболовные угодья под руководством опытного егеря. Для рыбалки турбазы предоставляют рыбакам всё самое необходимое: рыболовные снасти, лодки и многое другое.Город Волгоград издавна славится как город-герой и поэтому большая часть его достопримечательностей напрямую связанная с событиям Великой Отечественной войны и, в частности, Сталинградской битвы. Безусловно, самой главной достопримечательностью города является Мамаев курган, именно здесь проходили самые ожесточенные бои.Кроме Мамаева кургана в Волгограде стоит посетить музей-панораму «Сталинградская битва», площадь Павших Борцов, планетарий, Танцующий мост и другие достопримечательности.Отдых в Волгограде представлен на любой вкус. Для любителей природы и свежего воздуха идеальными будут волгоградские туристические базы. Отличный отдых на берегах Ахтубы, Волги или Дона понравится как взрослым, так и детям.",coordinateX: 48.708599, coordinateY: 44.510883),
        City(category:"Город",name:"Геленджик",text:"Набережная города-курорта Геленджик считается самой длинной в мире, и по праву самой красивой и удобной для пеших прогулок на всем черноморском побережье. Берущая свое начало с одного мыса города она заканчивается в противоположном, вдоль всей бухты Геленджика. Но самая знаменитая часть набережной Геленджика называется Лермонтовский бульвар.Любители активного отдыха и ярких впечатлений по достоинству оценят широкий выбор экскурсий. Вы сможете посетить исторические памятники — дольмены, познав историю древних народов; полюбоваться красотой стремительных водопадов; совершить увлекательные конные прогулки и походы на лошадях или джиппинг-тур в горы.Ну а какой же отдых без морских развлечений?! В Геленджике вы сможете приобщиться к виндсерфингу, кайтсерфингу, погрузиться с аквалангом, покататься на гидроциклах или оправиться на морскую прогулку на яхте или теплоходе.",coordinateX: 44.587533, coordinateY: 38.037028),
       City(category:"Город",name:"Казань",text:"Казань – столица Татарстана, расположена на левом берегу Волги, при впадении в неё реки Казанка. Это один из древнейших приволжских городов, основанный как пограничная крепость в 1005 году волжскими булгарами. С 1438 года город становится столицей Казанского ханства. В 1552 году Казань была завоёвана Иваном Грозным и Казанское ханство было присоединено к России. В 2005 году Казань торжественно отметила свое тысячелетие. К этому событию были отреставрированы многие памятники архитектуры, пущена первая линия метро. Обратной стороной подготовки к празднику стало масштабное разрушение исторической застройки центра города.Главная достопримечательность Казани – кремль, построенный во времена Ивана Грозного. В кремле расположена построенная совсем недавно мечеть Кул-Шариф, поражающая своими размерами и красотой убранства. Также в кремле находится символ города - падающая башня Сююмбике, с которой связано множество легенд и преданий. В Крестовоздвиженском соборе паломники и туристы могут увидеть знаменитую икону Казанской божьей матери.",coordinateX:  55.830431 , coordinateY:49.066081),
        City(category:"Город",name:"Киров",text:"Киров – административный центр Кировской области, город в среднем течении реки Вятки. До 1780 года – город Хлынов, с 1780 по 1934 год Вятка, после 1934 года - Киров.По данным археологов, более 2,5 тысяч лет назад в долине Вятки обитали племена предков современных удмуртов и коми. В Повести о стране Вятской упоминается, что город был основан после 1181 года. На Вятских землях возникла вечевая республика – образец древнерусской демократии, где главным политическим органом являлось народное вече.Разрозненным русским княжествам пришлось объединиться перед угрозой захвата Золотой Ордой. Хлынов вошел в состав Московского царства. Совместно с московскими войсками вятичи ходили в поход против татар, а затем еще неоднократно выступали против общих врагов. На смену вечевой республике пришла централизованная царская власть. В царской России Хлынов стал крупным культурным, религиозным и просветительским центром, славящимся своими учебными заведениями, библиотекой, театрами, а затем и первыми кинотеатрами.В советское время город сохранил свое культурное значение, здесь также начали строить заводы и фабрики. В 1934 году город был переименован и получил название Киров.Многие туристы едут в Киров специально ради того, чтобы приобрести знаменитые дымковские игрушки. Здесь также есть Музей дымковской игрушки, насчитывающий более 700 экспонатов. Здесь можно узнать историю развития ремесла и увидеть раритетные экземпляры дымковской игрушки.В Кирове построен один из лучших планетариев страны, оборудованный оптикой знаменитой фирмы Карл Цейс. Проводятся лекции как для взрослых, так и для детей старше 5 лет.",coordinateX:  58.603532 , coordinateY: 49.666798),
       City(category:"Город",name:"Краснодар",text:"Краснодар – это не только экономический и деловой город, но и известный туристический центр. В XIX ст. здесь появилось огромное количество деревянных домов, выполненных в стиле классицизма, некоторые сохранились до сегодняшних дней и все также влияют на формирование внешнего облика города.Все самые важные культурные объекты расположены на главной улицей города – Красной. В начале XX ст. город называли маленьким Парижем. В Краснодаре имеются сооружения, выполненные в разных архитектурных стилях, в зависимости от эпох - это барокко, классицизм и модерн. Особо интересны доходный дом барона Штейгеля и здания художественного музея. В Краснодаре располагается один из самых крупных в России кинотеатров - «Аврора», немало интересных музеев. Например, Краеведческий музей, который рассказывает своим посетителям о развитии, культуре края и истории народов, проживающих здесь, начиная с древних времен, музей истории казачества на Кубани, литературный музей. Имеются в городе и достаточно необычные музеи, к примеру, музей «Самсон», посвященный культуристам.",coordinateX: 45.039267 , coordinateY: 38.987221),
          
        
         City(category:"Город",name:"Пенза",text:"Пенза – административный центр Пензенской области, расположенный в центральном районе Европейской части России на Приволжской возвышенности на берегах реки Суры.Пензенская крепость была построена в 1663 году по приказу царя Алексея Михайловича для охраны юго-восточных рубежей России. Постепенно, с расширением Российской империи, военное значение крепости было утрачено. Город разрастался, становясь культурным и торговым центром уезда. В 1858 году половина города сгорела в большом пожаре. В 1874 году в Пензе была построена железнодорожная станция ветки Моршанск – Сызрань.Важную роль сыграла Пенза во время Великой Отечественной войны, когда в город были эвакуированы промышленные предприятия с запада страны. В послевоенные годы в Пензе бурными темпами строились промышленные предприятия.В Пензе работает множество разнообразных музеев и театров. Особой популярностью пользуется Пензенский планетарий, построенный в парке имени В.Г. Белинского, где в 1928 году была открыта Народная Обсерватория. Планетарий оборудован отличной современной цейсовской оптической системой. Здесь проводятся лекции по астрономии для взрослых и детей.Рядом с поселком Сосновка под Пензой находится действующая детская железная дорога протяженностью 2,5 км.Областная картинная галерея имени К.А. Савицкого располагает обширной коллекцией русского искусства с XIII по XX века. Фонд галереи насчитывает более 12 тысяч экспонатов.",coordinateX: 53.22729 , coordinateY: 45),
         
          City(category:"Город",name:"Пермь",text:"Пермь – административный центр Пермского края, расположен в предгорьях Урала на реке Каме. В 1720 году по приказу царя Петра I выдающийся русский географ и путешественник капитан-поручик В.Н. Татищев отправился на разведку месторождений медных руд, чтобы построить медеплавильный завод и основать город металлургов. Им было выбрано место возле устья реки Егошихи. В 1721 году вместо отозванного Татищева проект завода и города продолжил назначенный на его место Г.В. де Геннин. В 1723 году завод был построен и начал работать. В 1788 году Егошинский рудник был полностью выработан и закрыт, но к этому времени город Пермь уже стал крупным транспортным узлом и административным центром края. В 1878 году была построена Уральская железная дорога. В годы советской власти Пермь развивалась как промышленный город.       Пермь – старинный город, богатый достопримечательностями. Здесь сохранилось много православных храмов. Последние десятилетия они переданы верующим и восстановлены. Среди них - старейший Петропавловский собор, построенный в стиле барокко в XVIII столетии. Снова действует Бахаревский Богородице-Казанский Серафимо-Алексеевский женский монастырь, знаменитый еще и своими чудотворными святыми источниками.       Музей Пермских древностей представляет более 2000 экспонатов, многие из которых уникальны. Музей оборудован по последнему слову техники и экскурсии в нем очень познавательны. Здесь можно увидеть реконструированных ящеров, доисторические растения, вымершие древние обитатели пермского моря и многое другое. Уникальная экспозиция установлена у железнодорожного вокзала. Называется она «Сад камней» - это современный арт-объект, аналогов которого нет в России.",coordinateX:58.014009  , coordinateY:56.263347 ),
         City(category:"Город",name:"Самара",text:"Самара – город в Среднем Поволжье, административный центр Самарской области. Расположен на левом берегу Волги, в месте, где в нее впадает река Самара.Укрепленный город был заложен в 1586 году по приказу русского царя Федора Иоанновича с целью охраны речного торгового пути по Волге. Однако, еще до того, как дальновидный государь решил построить здесь военное укрепление, город возле Самарской Луки упоминался в русских летописях за 1361 год.В смутные времена XVII-XVIII веков Самара оказалась вовлечена в крестьянские восстания Степана Разина и Емельяна Пугачева. Благодаря своему выгодному положению Самара стала центром торговли сельскохозяйственными, ремесленными, мануфактурными товарами. Город богател и благоустраивался. Самарская пристань стала одной из лучших в стране. В 1850 году город стал административным центром губернии. В 1874 году открылось движение по Оренбургской железной дороге.При советской власти в 1935 году Самара, а вместе с ней и Самарская область, были переименованы в Куйбышев и Куйбышевскую область. Во время Великой Отечественной войны в Самару были эвакуированы заводы, а также правительственные, дипломатические и культурные учреждения. Для Сталина даже был построен личный бункер. Годы эвакуации серьезно повлияли как на количество населения, так и на промышленный, культурный, административный потенциал города.В 1991 году городу было возвращено его историческое название.  Самарский художественный музей располагает интересной коллекцией русской живописи, также в музее немало внимания уделено европейскому и азиатскому искусству.Секретный бункер, построенный для Сталина, теперь открыт для посещения туристами.Особняк А.П. Курлиной – здание построенное в стиле модерн. Памятников архитектуры этого самобытного направления в городе сохранилось очень немного. В особняке восстановлены оригинальные интерьеры 22 комнат.Самара - многоконфессиональный город. Здесь можно увидеть множество культовых сооружений - старинных православных церквей, католическую и лютеранскую церковь, молитвенные дома баптистов и пятидесятников, синагогу, мечети.",coordinateX: 53.241504 , coordinateY:50.221246 ),
        
        /* City(category:"Город",name:"",text:"",coordinateX:  , coordinateY: ),
         City(category:"Город",name:"",text:"",coordinateX:  , coordinateY: ),
         City(category:"Город",name:"",text:"",coordinateX:  , coordinateY: ),
         City(category:"Город",name:"",text:"",coordinateX:  , coordinateY: ),*/
    ]
    

    
    if let splitViewController = splitViewController {
      let controllers = splitViewController.viewControllers
      detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
    super.viewWillAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table View
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if searchController.isActive && searchController.searchBar.text != "" {
      return filteredCandies.count
    }
    return cities.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let city: City
    if searchController.isActive && searchController.searchBar.text != "" {
      city = filteredCandies[(indexPath as NSIndexPath).row]
    } else {
      city = cities[(indexPath as NSIndexPath).row]
    }
    cell.textLabel!.text = city.name
    cell.detailTextLabel!.text = city.category
    return cell
  }
  
  func filterContentForSearchText(_ searchText: String, scope: String = "All") {
    filteredCandies = cities.filter({( city : City) -> Bool in
      let categoryMatch = (scope == "All") || (city.category == scope)
      return categoryMatch && city.name.lowercased().contains(searchText.lowercased())
    })
    tableView.reloadData()
  }
  
  // MARK: - Segues
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      if let indexPath = tableView.indexPathForSelectedRow {
        let city: City
        if searchController.isActive && searchController.searchBar.text != "" {
          city = filteredCandies[(indexPath as NSIndexPath).row]
        } else {
          city = cities[(indexPath as NSIndexPath).row]
        }
        let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
        controller.detailCity = city
        controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        controller.navigationItem.leftItemsSupplementBackButton = true
      }
    }
  }
  
}

extension MasterViewController: UISearchBarDelegate {
  // MARK: - UISearchBar Delegate
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
  }
}

extension MasterViewController: UISearchResultsUpdating {
  // MARK: - UISearchResultsUpdating Delegate
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
    filterContentForSearchText(searchController.searchBar.text!, scope: scope)
  }
}
