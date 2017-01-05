
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
        City(category:"Город", name:"Абзаково",text:"Оздоровительно-спортивный центр Абзаково расположен в Башкортостане, на восточных склонах одного из южно-урвльских хребтов Кырыкты-Тау, на склонах горы Шайтан, на высоте 820 метров над уровнем моря.Здесь любят отдыхать не только жители блиайшего города - Магнитогорска, но и жители Урала, Сибири, а так же любител  зимних видов спорта из тенральных районов Росии. Абзаково располагает горнолыжными трассами всех категорий , включая трассы для слалома и слалома-гиганта , имеющие FIS сертификаты.Современные подъемники обеспечивают катание без очередей. Снегоуплотнительные машины осуществляют подготовку трасс.",coordinateX:53.83249709999999,coordinateY:58.596172000000024),
        City( category:"Город",name:"Адлер",text:"Адлер-курорт на Черном море, отдаленный микрорайон города Сочи. Этот район расположен на равнине, при впадении в Чёрное море реки Мзымты, с севера защищен Главным Кавказским хребтом с его вечными льдами и не тающими даже летом, вершинами, что тем самым обуславливает здесь относительно высокие среднегодовые температуры воздуха.Купальный сезон здесь продолжается 5 месяцев с июня по октябрь, летом средняя температура воздуха +26,5С, воды +24,5С. Благоприятные сезоны для санаторно-курортного лечения: осень, зима, весна. В период «зимы», средняя температура воздуха составляет +9, +10С.",coordinateX:43.427991 ,coordinateY:39.928844),
        City(category:"Город",name:"Адыгея",text:"Адыгею каждый год посещают тысячи туристов. Они приезжают сюда, чтобы сплавиться по рекам, пройти горными тропами, совершить восхождения, покататься на сноубордах и лыжах. Обширные территории девственной природы, большое разнообразие рельефа, дремучие заповедные леса, прекрасные каньоны горных рек, потрясающие альпийские луга манят к себе почитателей активного отдыха.Адыгея предлагает туристам и отдыхающим огромный спектр видов активного отдыха - водный туризм, альпинизм, каньонинг, горные лыжи, дельтапланеризм, спелеотуризм, езду на снегоходах, внедорожниках и квадроциклах. Также популярными видами отдыха в республике являются пеший, велосипедный и конный туризм.",coordinateX: 43.966332 ,coordinateY:39.272692),
        City(category:"Город",name:"Анапа",text:"Анапа находится в юго-западной части Краснодарского края РФ, на берегу Черного моря. Это один из крупнейших курортов России. Ландшафты курорта и окружающих его местностей весьма разнообразны: плавни, лиманы, соленые озера, предгорья с живописными долинами, реликтовыми лесами и растениями. Природно-климатические условия окрестностей позволяют выращивать лучшие лечебные сорта винограда, богатого глюкозой, витаминами и минеральными солями.",coordinateX:44.885701,coordinateY: 37.319919),
        City(category:"Город",name:"Астрахань",text:"Астраханская рыбка и астраханские арбузы — каждый житель Союза хоть раз да слыхал о них, а то и самолично пробовал. Красавица-Астрахань, стоящая на Волге и Каспии, всегда представлялась русскому человеку краем изобилия. И до сих пор это остается справедливым. Лидирующие направления в области туризма в Астрахани — это охота и рыбалка, ставшие своего рода брендом региона. Кроме того, начинаясь в Москве, в Астрахани заканчиваются разнообразные речные круизы по Волге. А многочисленные архитектурные и культурные достопримечательности дают все основания задержаться здесь на несколько дней даже равнодушным к копченой осетрине и балыку из белуги путешественникам.Нынешняя Астрахань — наследница множества народов, веками сменявших друг друга на Каспии, и по сей день она остается одним из самых многонациональных и мультикультурных городов России. Недаром поэт Велимир Хлебников назвал ее «треугольником Христа, Будды и Магомета».",coordinateX: 46.358805,coordinateY: 48.059935),
        City(category:"Город",name:"Волгоград",text:"Любители активного отдыха в Волгограде могут совершить незабываемые прогулки на катерах, лодках и туристических теплоходах. Для рыбаков здесь есть прекрасные туристические базы, которые кроме основных рекреационных услуг, организуют выезды в рыболовные угодья под руководством опытного егеря. Для рыбалки турбазы предоставляют рыбакам всё самое необходимое: рыболовные снасти, лодки и многое другое.Город Волгоград издавна славится как город-герой и поэтому большая часть его достопримечательностей напрямую связанная с событиям Великой Отечественной войны и, в частности, Сталинградской битвы. Безусловно, самой главной достопримечательностью города является Мамаев курган, именно здесь проходили самые ожесточенные бои.Кроме Мамаева кургана в Волгограде стоит посетить музей-панораму «Сталинградская битва», площадь Павших Борцов, планетарий, Танцующий мост и другие достопримечательности.Отдых в Волгограде представлен на любой вкус. Для любителей природы и свежего воздуха идеальными будут волгоградские туристические базы. Отличный отдых на берегах Ахтубы, Волги или Дона понравится как взрослым, так и детям.",coordinateX: 48.708599, coordinateY: 44.510883),
        City(category:"Город",name:"Геленджик",text:"Набережная города-курорта Геленджик считается самой длинной в мире, и по праву самой красивой и удобной для пеших прогулок на всем черноморском побережье. Берущая свое начало с одного мыса города она заканчивается в противоположном, вдоль всей бухты Геленджика. Но самая знаменитая часть набережной Геленджика называется Лермонтовский бульвар.Любители активного отдыха и ярких впечатлений по достоинству оценят широкий выбор экскурсий. Вы сможете посетить исторические памятники — дольмены, познав историю древних народов; полюбоваться красотой стремительных водопадов; совершить увлекательные конные прогулки и походы на лошадях или джиппинг-тур в горы.Ну а какой же отдых без морских развлечений?! В Геленджике вы сможете приобщиться к виндсерфингу, кайтсерфингу, погрузиться с аквалангом, покататься на гидроциклах или оправиться на морскую прогулку на яхте или теплоходе.",coordinateX: 44.587533, coordinateY: 38.037028),
        City(category:"Город",name:"Краснодар",text:"Краснодар – это не только экономический и деловой город, но и известный туристический центр. В XIX ст. здесь появилось огромное количество деревянных домов, выполненных в стиле классицизма, некоторые сохранились до сегодняшних дней и все также влияют на формирование внешнего облика города.Все самые важные культурные объекты расположены на главной улицей города – Красной. В начале XX ст. город называли маленьким Парижем. В Краснодаре имеются сооружения, выполненные в разных архитектурных стилях, в зависимости от эпох - это барокко, классицизм и модерн. Особо интересны доходный дом барона Штейгеля и здания художественного музея. В Краснодаре располагается один из самых крупных в России кинотеатров - «Аврора», немало интересных музеев. Например, Краеведческий музей, который рассказывает своим посетителям о развитии, культуре края и истории народов, проживающих здесь, начиная с древних времен, музей истории казачества на Кубани, литературный музей. Имеются в городе и достаточно необычные музеи, к примеру, музей «Самсон», посвященный культуристам.",coordinateX: 45.039267 , coordinateY: 38.987221)
        
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
