//
//  PhotoGalerryView.swift
//  CandySearch
//
//  Created by Admin on 16.12.16.
//  Copyright © 2016 Peartree Developers. All rights reserved.
//

import UIKit

class PhotoGaleryView: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate{
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var detailDescriptionLabel: UILabel!
    
    
    var selectedImage = String()
    var selectedLabels = String()
 
    
    var detailCity: City!
    var photos = [PhotoImage]()
    var phim = [PhIm]()
    var ph = [Phh]()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        photos = [
            /*     PhotoImage(cityId: 1, image: "http://t-ec.bstatic.com/images/hotel/max1024x768/668/6681563.jpg",coordx: 53.811014,coordy:58.635951,name:"Отель Эдельвейс"),
             PhotoImage(cityId: 1, image: "http://t-ec.bstatic.com/images/hotel/max1024x768/578/57834867.jpg",coordx:53.793161 ,coordy:53.793161 ,name:"База Отдыха Кизиловая"),
             PhotoImage(cityId: 1, image: "http://s-ec.bstatic.com/images/hotel/max1024x768/347/34728136.jpg",coordx: 53.812346 ,coordy:58.630643 ,name:"Гостевой дом «Межгорье»"),
             PhotoImage(cityId: 1, image: "http://t-ec.bstatic.com/images/hotel/max1024x768/118/11868489.jpg",coordx: 53.806046,coordy:58.633824 ,name:"Актив-Отель Горки"),
             PhotoImage(cityId: 1, image: "http://i.otzovik.com/2013/09/01/521963/img/17082923.jpg",coordx:53.795353  ,coordy: 58.626502,name:"Зоопарк"),
             PhotoImage(cityId: 2, image: "http://s-ec.bstatic.com/images/hotel/max1024x768/553/55382096.jpg",coordx:43.407405 ,coordy: 39.941437,name:"Апарт-отель Имеретинский - Морской квартал"),
             PhotoImage(cityId: 2, image: "http://t-ec.bstatic.com/images/hotel/max1024x768/738/73801631.jpg",coordx:43.392263 ,coordy: 39.97789,name:"Арфа Парк-Отель")
             */
            //Абзаково+
            PhotoImage( cityId : 1,image:"http://www.openarium.ru/%D1%84%D0%BE%D1%82%D0%BE/%D1%80%D0%BE%D1%81%D1%81%D0%B8%D1%8F/%D0%B0%D0%B1%D0%B7%D0%B0%D0%BA%D0%BE%D0%B2%D0%BE/%D0%BF%D0%B5%D1%89%D0%B5%D1%80%D0%B0-%D1%81%D0%B0%D0%BB%D0%B0%D0%B2%D0%B0%D1%82%D0%B0-%D1%8E%D0%BB%D0%B0%D0%B5%D0%B2%D0%B0.jpg" ,coordx:53.600948 ,coordy:56.646645,name:"Салаватская пещера"),
            PhotoImage( cityId : 1,image:"http://www.bashturist.ru/gallery/data/media/169/bashturist-ru_skal2.jpg" ,coordx:53.600948 ,coordy:56.646645,name:"Салаватская пещера"),
            PhotoImage( cityId : 1,image:"http://abzak.ru/wps/wp-content/uploads/2013/02/%D0%90%D0%B1%D0%B7%D0%B0%D0%BA%D0%BE%D0%B2%D0%BE-3.jpg" ,coordx:53.813353 ,coordy: 58.625193 ,name:"Канатная дорога «Абзаково» - горнолыжный центр"),
            PhotoImage( cityId : 1,image:"http://storage.russiantraveller.ru/abzakovo-6.jpg" ,coordx:53.812967 ,coordy:58.628658  ,name:"«Абзаково» - горнолыжный центр "),
            PhotoImage( cityId : 1,image:"http://www.active-hotel-gorki.ru/public/tabs/9953/21359.jpg" ,coordx:53.815228 ,coordy:58.625944 ,name:"Аква-бар «Дельфин». Аквапарк"),
            PhotoImage( cityId : 1,image:"http://abzak.ru/wps/wp-content/uploads/2014/12/%D0%9A%D0%B0%D1%82%D0%BE%D0%BA-%D0%B2-%D0%90%D0%B1%D0%B7%D0%B0%D0%BA%D0%BE%D0%B2%D0%BE.jpg" ,coordx: 53.812967 ,coordy:58.628658  ,name:"Каток Абзаково"),
            PhotoImage( cityId : 1,image:"http://abzak.ru/wps/wp-content/uploads/2015/12/%D0%97%D0%B8%D0%BC%D0%BD%D0%B8%D0%B9-%D0%BA%D0%B0%D1%80%D1%82%D0%B8%D0%BD%D0%B3-%D0%B2-%D0%90%D0%B1%D0%B7%D0%B0%D0%BA%D0%BE%D0%B2%D0%BE.jpg" ,coordx: 53.812967 ,coordy: 58.628658,name:"Картинг в Абзаково"),
            //Адлер+
            PhotoImage( cityId : 2,image:"https://edemnayug.com/wp-content/uploads/2014/11/%D1%81%D0%BA%D1%83%D0%BB%D1%8C%D0%BF%D1%82%D1%83%D1%80%D1%8B.jpg" ,coordx:43.471857 ,coordy: 39.897108 ,name:"Океанариум"),
            PhotoImage( cityId : 2,image:"http://sochiplay.ru/uploads/images/catalog/item/91816f030b/edbf50cf75_500.jpg" ,coordx:43.405515 ,coordy: 39.955162 ,name:"Светомузыкальный фонтан в Олимпийском парке"),
            PhotoImage( cityId : 2,image:"http://sochiplay.ru/uploads/images/catalog/item/0ff4441652/99ade68a7c_1000.jpg" ,coordx:43.404673 ,coordy:39.94998  ,name:"Ледовый дворец «Большой»"),
            PhotoImage( cityId : 2,image:"http://www.tourprom.ru/site_media/cache/3b/d7/3bd7119118d108dca8e0c423696591c3.jpg" ,coordx:43.61318 ,coordy: 39.978712,name:"Каньон реки Псахо"),
            PhotoImage( cityId : 2,image:"http://www.tourprom.ru/site_media/cache/7e/ee/7eee2d8b8cf3f91c7a9d272a84edf49b.jpg" ,coordx:43.40226 ,coordy:39.951905  ,name:"Олимпийская Ледовая арена «Шайба»"),
            PhotoImage( cityId : 2,image:"http://www.tourprom.ru/site_media/cache/14/c0/14c0512399d1cc79dd1b56af6305e46d.jpg" ,coordx:43.51712 ,coordy:39.992878  ,name:"Форелевое хозяйство в Адлере"),
            PhotoImage( cityId : 2,image:"http://www.tourprom.ru/site_media/cache/ff/26/ff26a693f63540ded4c60c0d71d0e660.jpg" ,coordx:43.398956 ,coordy: 39.949564 ,name:"Олимпийская Нижнеимеретинская набережная"),
            PhotoImage( cityId : 2,image:"http://news.momondo.com/wp-content/uploads/2016/01/Tesla_Sochi_3.jpg" ,coordx: 43.404568,coordy: 39.960794 ,name:"Электрический музей Николы Тесла"),
            PhotoImage( cityId : 2,image:"http://www.tourprom.ru/site_media/cache/69/e5/69e530175d249d231b2a60a78b2d3e5b.jpg" ,coordx: 43.557701,coordy: 39.820632 ,name:"Орлиные скалы и памятник Прометею"),
            //Адыгея+
            PhotoImage( cityId : 3,image:"http://vetert.ru/rossiya/adygeya/sights/275-partizanskaya-polyana/03.jpg" ,coordx:44.011367 ,coordy:40.035317,name:"Партизанская поляна"),
            PhotoImage( cityId : 3,image:"http://vetert.ru/rossiya/adygeya/sights/256-svyato-mihajlovskij-afonskij-muzhskoj-monastyr/02.jpg" ,coordx:44.290374 ,coordy:40.317094  ,name:"Свято-Михайловский Афонский мужской монастырь"),
            PhotoImage( cityId : 3,image:"http://vetert.ru/rossiya/guzeripl/sights/308-muzej-prirody-kavkazskogo-zapovednika/05.jpg" ,coordx:43.823397 ,coordy: 40.305866 ,name:"Музей природы Кавказского биосферного заповедника "),
            PhotoImage( cityId : 3,image:"http://vetert.ru/rossiya/krasnodarskij-kraj/sights/244-bolshaya-azishskaya-peschera/01.jpg" ,coordx:44.121479 ,coordy: 40.028472 ,name:"Большая Азишская пещера"),
            PhotoImage( cityId : 3,image:"http://vetert.ru/rossiya/adygeya/sights/280-gora-dzhemaruk/01.jpg" ,coordx: 43.827778,coordy:40.263611
                ,name:"Гора Джемарук"),
            PhotoImage( cityId : 3,image:"http://vetert.ru/rossiya/adygeya/sights/250-skala-chertov-palec/01.jpg" ,coordx: 44.239221,coordy:  40.237248
                ,name:"Скала Чертов палец"),
            PhotoImage( cityId : 3,image:"http://vetert.ru/rossiya/adygeya/sights/265-gora-psheho-su/01.jpg" ,coordx:43.989167 ,coordy:39.888056 ,name:"Гора Пшехо-Су "),
            PhotoImage( cityId : 3,image:"http://vetert.ru/rossiya/adygeya/sights/263-gora-fisht/02.jpg" ,coordx: 43.953611 ,coordy:  39.902778 ,name:"Гора Фишт"),
            PhotoImage( cityId : 3,image:"http://vetert.ru/rossiya/adygeya/sights/271-ozero-psenodah/03.jpg" ,coordx:44.010202 ,coordy: 39.899715 ,name:"Озеро Псенодах"),
            PhotoImage( cityId : 3,image:"http://vetert.ru/rossiya/adygeya/sights/260-dolina-ammonitov/01.jpg" ,coordx:44.360679 ,coordy: 40.194654  ,name:"Долина аммонитов"),
            PhotoImage( cityId : 3,image:"http://vetert.ru/rossiya/adygeya/sights/235-khadzhokhskaya-tesnina/04.jpg" ,coordx: 44.287561 ,coordy: 40.174092 ,name:"Хаджохская теснина"),
            PhotoImage( cityId : 3,image:"http://vetert.ru/rossiya/adygeya/sights/234-vodopady-rufabgo/02.jpg" ,coordx:44.269214  ,coordy: 40.187201 ,name:"Водопады Руфабго"),
            
            //Александров+
            PhotoImage( cityId :4 ,image:"http://tverturservis.ru/images/tury/foto/201507/zolotoe-kolco002.jpg" ,coordx:56.399531 ,coordy:38.74113 ,name:"Александровская слобода"),
            PhotoImage( cityId :4 ,image:"https://aleksandrov.city/files/cache/17/172b59067b8a706f6a1610f86f5ac58f_330_1000_1000_tr_dfc.jpg" ,coordx:56.397755  ,coordy: 38.73318 ,name:"Александровский художественный музей"),
            PhotoImage( cityId :4 ,image:"http://gorodaleksandrov.ru/upload/iblock/195/195013a4ca5da9992c4fd961209729eb.jpg" ,coordx: 56.396294,coordy:38.732504  ,name:"Парк культуры и отдыха"),
            PhotoImage( cityId :4 ,image:"https://autotravel.ru/phalbum/90558/115-s.jpg" ,coordx:56.39828,coordy:38.705699 ,name:"Церковь Серафима Саровского"),
            PhotoImage( cityId :4 ,image:"http://alexandrovru.ru/images/Churchs/bogolyubskaya/bogolu19.jpg" ,coordx:56.3935267322833 ,coordy: 38.71635675430298 ,name:"Церковь Боголюбской иконы Божией Матери"),
            PhotoImage( cityId :4 ,image:"https://autotravel.ru/phalbum/90511/152-s.jpg" ,coordx: 56.396056,coordy: 38.728631 ,name:"Собор Рождества Христова"),
            PhotoImage( cityId : 4,image:"http://dic.academic.ru/pictures/wiki/files/86/View_of_Staritsa.jpg" ,coordx:56.400426 ,coordy: 38.740298 ,name:"Кремль (Свято-Успенский монастырь)"),
            
            //Aнапа+
            PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/krasnodarskij-kraj/sights/482-neberdzhaj-svyatye-istochniki-ruchka/03.jpg" ,coordx:44.781807 ,coordy: 37.868334  ,name:"Неберджай – святые источники и «Святая ручка»"),
            PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/krasnodarskij-kraj/sights/435-dolina-lotosov-anapa-taman/02.jpg" ,coordx: 45.28870,coordy: 37.222325 ,name:"Долина лотосов"),
            PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/krasnodarskij-kraj/sights/434-vinzavod-podvaly-sauk-dere/03.jpg" ,coordx: 44.900207  ,coordy:37.886803  ,name: "Винзавод, подвалы Саук-Дере"),
            PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/krasnodarskij-kraj/sights/431-gora-lysaya-anapa/01.jpg" ,coordx: 44.843056,coordy: 37.358333 ,name:"Гора Лысая"),
            PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/anapa/sights/373-hram-svyatogo-onufriya-velikogo/01.jpg" ,coordx: 44.895288 ,coordy: 37.309566 ,name:"Храм Святого Онуфрия Великого"),
            PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/anapa/sights/362-anapskij-mayak/03.jpg" ,coordx: 44.887967,coordy: 37.299109 ,name:"Анапский маяк"),
            PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/anapa/sights/363-kraevedcheskij-muzej/03.jpg" ,coordx: 44.888235 ,coordy:37.301002  ,name:"АКраеведческий музей"),
            PhotoImage( cityId : 5,image:"http://anapa.ru/objects/leisure/43/ex3.jpg" ,coordx: 44.88832,coordy: 37.30022  ,name:"Aквариум батискаф"),
            PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/anapa/sights/361-centralnaya-naberezhnaya/01.jpg" ,coordx:  44.897718,coordy: 37.312678 ,name:""),
            
            
            ///Арзамас+
            PhotoImage( cityId :6 ,image:"https://autotravel.ru/phalbum/90218/143-s.jpg" ,coordx:55.38664 ,coordy: 43.81338800000003 ,name:"Воскресенский собор"),
            PhotoImage( cityId :6 ,image:"https://autotravel.ru/phalbum/90218/144.jpg" ,coordx:55.38253009999999 ,coordy:43.82386629999996  ,name:"Церковь Рождества Христова"),
            PhotoImage( cityId :6 ,image:"https://autotravel.ru/phalbum/90705/190.jpg" ,coordx: 55.3899678,coordy:43.816978  ,name:"Арзамасский государственный литературно-мемориальный музей А.П.Гайдара"),
            PhotoImage( cityId :6 ,image:"https://autotravel.ru/phalbum/90830/189-s.jpg" ,coordx:55.3863043 ,coordy:43.81527319999998  ,name:"             Николаевский монастырь"),
            PhotoImage( cityId :6,image:"https://autotravel.ru/phalbum/90830/194-s.jpg" ,coordx: 55.38532499999999,coordy:43.81876399999999  ,name:"Спасо-преображенский монастырь"),
            PhotoImage( cityId :6,image:"https://autotravel.ru/phalbum/90830/190-s.jpg" ,coordx:55.38757926890985 ,coordy:43.81329417228699  ,name:"Церковь Иконы Божией Матери Живоносный Источник"),
            
            //Архангельск+
            PhotoImage( cityId : 7,image:"https://autotravel.ru/phalbum/10192/055-s.jpg" ,coordx:64.5407342 ,coordy:40.514219300000036  ,name:"Обелиск Севера"),
            PhotoImage( cityId : 7,image:"https://autotravel.ru/phalbum/90506/186-s.jpg" ,coordx: 64.54454849999999,coordy: 40.51720929999999 ,name:"Танки-памятники г. Архангельска"),
            PhotoImage( cityId : 7,image:"https://autotravel.ru/phalbum/90552/168-s.jpg" ,coordx: 64.5389746,coordy: 40.50956450000001 ,name:"Музейно-выставочный комплекс Гостинный двор"),
            PhotoImage( cityId : 7,image:"https://autotravel.ru/phalbum/90438/112-s.jpg" ,coordx: 64.533879,coordy: 40.519946000000004 ,name:"Свято-Никольский Храм"),
            PhotoImage( cityId :7 ,image:"https://autotravel.ru/phalbum/90552/165-s.jpg" ,coordx:64.538978 ,coordy: 40.50959599999999 ,name:"Архангельский областной краеведческий музей"),
            PhotoImage( cityId : 7,image:"https://autotravel.ru/phalbum/90506/183-s.jpg" ,coordx:64.5501 ,coordy:40.51520000000005  ,name:"Церковь Успения Пресвятой Богородицы"),
            PhotoImage( cityId : 7,image:"https://autotravel.ru/phalbum/90438/146-s.jpg" ,coordx:64.5343 ,coordy:40.51800000000003  ,name:"Церковь Зосимы, Савватия и Германа Соловецких"),
            PhotoImage( cityId :7 ,image:"https://autotravel.ru/phalbum/90506/184-s.jpg" ,coordx: 64.5385387,coordy: 40.51313170000003 ,name:"Парк аттракционов Потешный двор"),
            PhotoImage( cityId : 7,image:"https://autotravel.ru/phalbum/90393/110-s.jpg" ,coordx:64.5388421 ,coordy:  40.514215899999954,name:"Нулевой километр"),
            
            //Астрахань+
            PhotoImage( cityId : 8,image:"http://vetert.ru/rossiya/astrakhan/sights/136-astrakhanskijj-kreml/01.png" ,coordx: 46.349225 ,coordy:48.032052  ,name:"Астраханский кремль"),
            PhotoImage( cityId : 8,image:"http://vetert.ru/rossiya/astrakhan/sights/143-uspensky-sobor/03.jpg" ,coordx:  46.349301,coordy:48.032983  ,name:"Успенский собор в Астрахани"),
            PhotoImage( cityId : 8,image:"http://vetert.ru/rossiya/astrakhan/sights/486-troickij-sobor/08.jpg" ,coordx:46.350201 ,coordy: 48.0322 ,name:"Троицкий собор"),
            PhotoImage( cityId : 8,image:"http://vetert.ru/rossiya/astrakhan/sights/138-naberezhnaya-astrakhani/03.png" ,coordx: 46.321016,coordy: 47.965646  ,name:"Набережная Астрахани"),
            PhotoImage( cityId : 8,image:"http://vetert.ru/rossiya/astrakhan/sights/139-zags-astrakhani/01.png" ,coordx:46.355599 ,coordy: 48.033015  ,name:"Здание ЗАГСа в Астрахани"),
            PhotoImage( cityId : 8,image:"http://vetert.ru/rossiya/astrakhan/sights/140-muzykalnyj-fontan/03.png" ,coordx: 46.352419 ,coordy: 48.027382 ,name:"Музыкальный фонтан в Астрахани"),
            PhotoImage( cityId : 8,image:"http://vetert.ru/rossiya/astrakhan/sights/137-most-vlyublennykh/01.png" ,coordx: 46.354677,coordy: 48.038822 ,name:"Мост влюбленных в Астрахани"),
            PhotoImage( cityId : 8,image:"http://vetert.ru/rossiya/astrakhan/sights/142-lebedinoe-ozero/01.png" ,coordx:46.34598 ,coordy: 48.023328 ,name:"Лебединое озеро в Астрахани"),
            PhotoImage( cityId : 8,image:"http://vetert.ru/rossiya/astrakhan/sights/507-kartinnaya-galereya-dogadina/01.jpg" ,coordx: 46.349192,coordy: 48.051898  ,name:"Картинная галерея Догадина"),
            PhotoImage( cityId : 8,image:"http://vetert.ru/rossiya/astrakhan/sights/145-astrahanskij-gorodskoj-akvarium/01.png" ,coordx:46.351142 ,coordy:48.039366  ,name:"Астраханский городской аквариум"),
            PhotoImage( cityId : 8,image:"http://vetert.ru/rossiya/astrakhan/sights/521-park-planeta/01.jpg" ,coordx: 46.334254,coordy:48.057406  ,name:"Парк «Планета»"),
            PhotoImage( cityId : 8,image:"http://www.citariga.lv/images/tornakalns/arkadijas_parks7_b.jpg" ,coordx:46.356821  ,coordy:48.051335  ,name:"Парк «Аркадия»"),
            PhotoImage( cityId : 8,image:"http://vetert.ru/rossiya/astrakhan/sights/498-pokrovskij-kafedralnyj-sobor/03.jpg" ,coordx:46.363592  ,coordy: 48.046249 ,name:"Покровский кафедральный собоp"),
            PhotoImage( cityId : 8,image:"http://vetert.ru/rossiya/astrakhan/sights/499-hram-sobor-svyatogo-knyazya-vladimira/01.jpg" ,coordx:46.339247 ,coordy: 48.015953 ,name:"Храм-собор Святого князя Владимира"),
            
            //Багратионовск-нт основного фото
            PhotoImage( cityId : 9,image:"https://autotravel.ru/phalbum/90683/189-s.jpg" ,coordx:54.386655 ,coordy:20.634706  ,name:"Храм св.мучениц Веры, Надежды, Любови и их матери Софии"),
            PhotoImage( cityId : 9,image:"https://autotravel.ru/phalbum/90683/198-s.jpg" ,coordx:54.37956697548634 ,coordy:20.65188  ,name:"Памятник сражению под Прейсиш-Эйлау"),
            PhotoImage( cityId : 9,image:"http://www.geocaching.su/photos/areas/29728.jpg" ,coordx: 54.383569,coordy:20.64242  ,name:"Форбург замка Прейсиш-Эйлау"),
            /*PhotoImage( cityId : 9,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 9,image:"" ,coordx: ,coordy:  ,name:""),*/
            
            //Белгород+
            PhotoImage( cityId :10,image:"https://autotravel.ru/phalbum/90636/159-s.jpg" ,coordx:50.5913648 ,coordy:  36.587583,name:"Музей-диорама Курская битва. Белгородское направление"),
            PhotoImage( cityId : 10,image:"https://autotravel.ru/phalbum/90207/142-s.jpg" ,coordx:50.595377 ,coordy: 36.595065999999974 ,name:"Смоленский собор"),
            PhotoImage( cityId : 10,image:"https://autotravel.ru/phalbum/90513/136-s.jpg" ,coordx:50.596591 ,coordy: 36.57741439999995 ,name:"Памятник Святителю Иоасафу"),
            PhotoImage( cityId : 10,image:"https://autotravel.ru/phalbum/90513/105-s.jpg" ,coordx:50.5922187 ,coordy: 36.584146799999985 ,name:"Парк Победы"),
            PhotoImage( cityId : 10,image:"https://autotravel.ru/phalbum/90513/110-s.jpg" ,coordx: 55.7632545,coordy:37.63891460000002  ,name:"Храм Архангела Гавриила"),
            PhotoImage( cityId :10,image:"https://autotravel.ru/phalbum/90207/141-s.jpg" ,coordx: 50.59847,coordy: 36.58824200000004 ,name:"Преображенский кафедральный собор"),
            PhotoImage( cityId : 10,image:"https://autotravel.ru/phalbum/90513/134-s.jpg" ,coordx:50.5968609 ,coordy:36.57629500000007  ,name:"Марфо-Мариинский женский монастырь"),
            PhotoImage( cityId : 10,image:"https://autotravel.ru/phalbum/90678/117-s.jpg" ,coordx:50.5802124 ,coordy:36.58381959999997  ,name:"Памятник Равноапостольному Князю Владимиру"),
            PhotoImage( cityId : 10,image:"https://autotravel.ru/phalbum/90646/166-s.jpg" ,coordx:50.395764 ,coordy: 36.37631699999997 ,name:"Храм Великомученика Георгия Победоносца"),
            PhotoImage( cityId : 10,image:"https://autotravel.ru/phalbum/90728/112-s.jpg" ,coordx:50.45465869999999 ,coordy:36.42234250000001  ,name:"Храм иконы Божией Матери Спорительница хлебов"),
            
            
            //Березники-надо новое основное фото
            PhotoImage( cityId :11,image:"http://sobory.ru/pic/12220/12222_20090603_122223.jpg" ,coordx:59.388653955136355 ,coordy: 56.77910327911377 ,name:"Храм Иоанна Предтечи "),
            PhotoImage( cityId : 11,image:"http://photos.wikimapia.org/p/00/03/37/20/89_big.jpg" ,coordx: 59.40418787926802,coordy:56.845965  ,name:"Рябиновый сквер"),
            PhotoImage( cityId :11,image:"http://photos.wikimapia.org/p/00/01/25/06/87_big.jpg" ,coordx:  59.420441 ,coordy: 56.830223 ,name:"Католический храм Пресвятой Богородицы"),
            PhotoImage( cityId : 11,image:"http://photos.wikimapia.org/p/00/01/25/13/83_big.jpg" ,coordx:59.41875401959436 ,coordy: 56.831439 ,name:"Парк имени А.П. Чехова"),
            PhotoImage( cityId : 11,image:"http://bezformata.ru/content/Images/000/050/024/image50024340.jpg" ,coordx:59.4115027 ,coordy: 56.796406 ,name:"Парк культуры и отдыха"),
            /*   PhotoImage( cityId : 9,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 9,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 9,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 9,image:"" ,coordx: ,coordy:  ,name:""),*/
            
            //Боровск+
            PhotoImage( cityId : 12,image:"https://autotravel.ru/phalbum/011/04-s.jpg" ,coordx:55.2145328 ,coordy:36.53300509999997  ,name:"Пафнутьев-Боровский монастырь"),
            PhotoImage( cityId : 12,image:"https://autotravel.ru/phalbum/90038/104-s.jpg" ,coordx:55.2081343 ,coordy: 36.48570599999994 ,name:"Благовещенский собор"),
            PhotoImage( cityId : 12,image:"https://autotravel.ru/phalbum/90445/193-s.jpg" ,coordx: 55.2141435,coordy: 36.50506500000006 ,name:"Церковь Бориса и Глеба"),
            PhotoImage( cityId : 12,image:"https://autotravel.ru/phalbum/90456/151-s.jpg" ,coordx:55.20533959999999 ,coordy: 36.50461259999997 ,name:"Святой источник Храма Покрова Божией Матери на Высоком"),
            PhotoImage( cityId : 12,image:"https://autotravel.ru/phalbum/90038/101-s.jpg" ,coordx: 55.21310339999999,coordy:36.49912380000001  ,name:"Собор Покрова Пресвятой Богородицы"),
            PhotoImage( cityId : 12,image:"https://autotravel.ru/phalbum/91032/142-s.jpg" ,coordx: 55.2037,coordy: 36.48777259999997 ,name:"Музейно-выставочный центр"),
            PhotoImage( cityId : 12,image:"http://photos.wikimapia.org/p/00/05/75/33/77_big.jpg" ,coordx: 55.209139 ,coordy: 36.487173 ,name:"Смотровая площадка"),
            PhotoImage( cityId : 12,image:"https://autotravel.ru/phalbum/90768/111-s.jpg" ,coordx:55.20806409999999 ,coordy: 36.44654730000002 ,name:"Церковь Михаила Архангела"),
            
            //Брянск+
            PhotoImage( cityId : 13,image:"https://autotravel.ru/phalbum/90115/109-s.jpg" ,coordx: 53.266487,coordy:34.35854199999994  ,name:"Курган бессмертия"),
            PhotoImage( cityId : 13,image:"https://autotravel.ru/phalbum/90116/105-s.jpg" ,coordx:53.1984815 ,coordy: 34.529052999999976 ,name:"Памятник водителям"),
            PhotoImage( cityId : 13,image:"https://autotravel.ru/phalbum/90115/101-s.jpg" ,coordx:53.246976 ,coordy:34.373865900000055  ,name:"Покровская гора"),
            PhotoImage( cityId : 13,image:"https://autotravel.ru/phalbum/90115/120-s.jpg" ,coordx:53.31490789999999 ,coordy:34.31621500000006  ,name:"Преображенская Спасо-Гробовская церковь"),
            PhotoImage( cityId : 13,image:"https://autotravel.ru/phalbum/90688/187-s.jpg" ,coordx:53.2489557 ,coordy: 34.37188560000004 ,name:"Брянский кафедральный собор и колокольня Пересвет"),
            PhotoImage( cityId : 13,image:"https://autotravel.ru/phalbum/90115/115-s.jpg" ,coordx: 53.2056824,coordy: 34.32839960000001 ,name:"Свято-Успенский Свенский монастырь"),
            PhotoImage( cityId : 13,image:"https://autotravel.ru/phalbum/90116/117-s.jpg" ,coordx:53.234324 ,coordy:34.35411380000005  ,name:"Площадь партизан"),
            PhotoImage( cityId : 13,image:"https://autotravel.ru/phalbum/90126/122-s.jpg" ,coordx:53.2474972 ,coordy: 34.37551469999994 ,name:"Дом Авраамова"),
            PhotoImage( cityId : 13,image:"https://autotravel.ru/phalbum/90116/102-s.jpg" ,coordx: 53.25806069999999,coordy: 34.37041810000005 ,name:"Памятник жертвам Чернобыля"),
            PhotoImage( cityId : 13,image:"https://autotravel.ru/phalbum/10151/026-s.jpg" ,coordx: 53.310031,coordy:34.30765900000006  ,name:"Народный музей БМЗ"),
            PhotoImage( cityId : 13,image:"https://autotravel.ru/phalbum/90115/124-s.jpg" ,coordx: 53.310031,coordy: 34.30765900000006 ,name:"Брянский литературный музей"),
            
            //Валдай+
            PhotoImage( cityId : 14,image:"https://autotravel.ru/phalbum/90199/158-s.jpg" ,coordx:57.974014 ,coordy: 33.255666399999996 ,name:"Музей колоколов"),
            PhotoImage( cityId : 14,image:"https://autotravel.ru/phalbum/90004/108-s.jpg" ,coordx:57.9892224 ,coordy: 33.30542749999995 ,name:"Валдайский Иверский Святоозерский Богородицкий монастырь"),
            PhotoImage( cityId : 14,image:"https://autotravel.ru/phalbum/90004/102-s.jpg" ,coordx:57.97893560000001 ,coordy: 33.25522150000006 ,name:"Троицкий собор"),
            
            //Великий Новгород+
            PhotoImage( cityId : 15,image:"https://autotravel.ru/phalbum/90224/144-s.jpg" ,coordx: 58.52290279999999,coordy:31.27701300000001  ,name:"Новгородский Кремль"),
            PhotoImage( cityId : 15,image:"https://autotravel.ru/phalbum/10104/064-s.jpg" ,coordx:58.49032519999999 ,coordy: 31.272267499999998 ,name:"Музей деревянного народного зодчества Витославлицы"),
            PhotoImage( cityId : 15,image:"https://autotravel.ru/phalbum/90003/119-s.jpg" ,coordx:58.48666569999999 ,coordy:31.28445970000007  ,name:"Юрьев монастырь"),
            PhotoImage( cityId : 15,image:"https://i.novgorod.ru/www/images/09/00/9.jpg" ,coordx:58.62291669999999 ,coordy:31.169328800000017  ,name:"Николо-Вяжищский монастырь"),
            PhotoImage( cityId : 15,image:"https://autotravel.ru/phalbum/90095/101-s.jpg" ,coordx: 58.497164,coordy:31.31153900000004  ,name:"Церковь Спаса на Нередице"),
            PhotoImage( cityId : 15,image:"https://autotravel.ru/phalbum/90254/187-s.jpg" ,coordx:58.49427979999999 ,coordy:31.29820689999997  ,name:"Рюриково городище"),
            PhotoImage( cityId : 15,image:"https://autotravel.ru/phalbum/90844/196-s.jpg" ,coordx: 58.52330600000001,coordy: 31.293169000000034 ,name:"Церковь Федора Стратилата на Ручью"),
            PhotoImage( cityId : 15,image:"https://autotravel.ru/phalbum/90415/183-s.jpg" ,coordx:58.51770399999999 ,coordy: 31.265401800000063 ,name:"Десятинный Рождества Богородицы монастырь"),
            PhotoImage( cityId : 15,image:"https://autotravel.ru/phalbum/90905/156-s.jpg" ,coordx:58.531123 ,coordy: 31.29096500000003 ,name:"Церковь Бориса и Глеба в Плотниках"),
            PhotoImage( cityId : 15,image:"https://autotravel.ru/phalbum/90920/136-s.jpg" ,coordx: 58.51683899999999,coordy: 31.275108899999964 ,name:"Монумент Победы"),
            PhotoImage( cityId : 15,image:"https://autotravel.ru/phalbum/90880/180-s.jpg" ,coordx:58.527749 ,coordy: 31.269520000000057 ,name:"Церковь Феодора Стратилата на Щиркове улице"),
            PhotoImage( cityId : 15,image:"https://autotravel.ru/phalbum/90415/187-s.jpg" ,coordx: 58.51822299999999,coordy:31.264216000000033  ,name:"Музейный цех фарфора"),
            
            //Владимир+
            PhotoImage( cityId : 16,image:"https://autotravel.ru/phalbum/90429/137-s.jpg" ,coordx:56.12728000000001 ,coordy:40.40919039999994  ,name:"Успенский собор"),
            PhotoImage( cityId : 16,image:"https://autotravel.ru/phalbum/90234/123-s.jpg" ,coordx:56.126472 ,coordy: 40.39531299999999 ,name:"Золотые ворота"),
            PhotoImage( cityId : 16,image:"https://autotravel.ru/phalbum/10104/028-s.jpg" ,coordx:56.1291404 ,coordy: 40.410813899999994 ,name:"Дмитриевский собор"),
            PhotoImage( cityId : 16,image:"https://autotravel.ru/phalbum/90556/198-s.jpg" ,coordx: 56.132022,coordy: 40.403466200000025 ,name:"Архитектура города"),
            PhotoImage( cityId : 16,image:"https://autotravel.ru/phalbum/90234/126-s.jpg" ,coordx: 56.13054830000001,coordy: 40.409866299999976 ,name:"Музей хрусталя и лаковой миниатюры"),
            PhotoImage( cityId : 16,image:"https://autotravel.ru/phalbum/90295/112-s.jpg" ,coordx:56.127187 ,coordy: 40.402202999999986 ,name:"Церковь Георгия Победоносца"),
            PhotoImage( cityId : 16,image:"https://autotravel.ru/phalbum/90557/112-s.jpg" ,coordx:56.130719 ,coordy: 40.39785800000004 ,name:"Никитская церковь"),
            PhotoImage( cityId : 16,image:"https://autotravel.ru/phalbum/90687/111-s.jpg" ,coordx:56.1304258 ,coordy:40.410654499999964  ,name:"Исторический музей"),
            PhotoImage( cityId : 16,image:"https://autotravel.ru/phalbum/90772/119-s.jpg" ,coordx: 56.126797,coordy: 40.40248999999994 ,name:"Кузница Бородиных"),
            PhotoImage( cityId : 16,image:"https://autotravel.ru/phalbum/90648/192-s.jpg" ,coordx:56.141848 ,coordy:40.4364949  ,name:"Храм во имя Святoго Равноапостольного Князя Владимира"),
            PhotoImage( cityId : 16,image:"https://autotravel.ru/phalbum/90771/181-s.jpg" ,coordx:56.128075 ,coordy: 40.404199999999946 ,name:"Музей пряника"),
            PhotoImage( cityId : 16,image:"https://img.tourister.ru/files/1/0/9/5/2/6/3/7/10952637.jpg" ,coordx:56.1289423 ,coordy: 40.40500880000002 ,name:"Музей оптических иллюзий и занимательных наук Да Винчи"),
            
            
            
            //Волгоград+
            PhotoImage( cityId : 17,image:"http://vetert.ru/rossiya/volgograd/sights/150-steny-ruiny/01.png" ,coordx: 48.741901,coordy: 44.5381,name:"Стены-руины на Мамаевом кургане"),
            PhotoImage( cityId : 17,image:"http://vetert.ru/rossiya/volgograd/sights/154-rodina-mat-zovet/01.png" ,coordx:48.742345 ,coordy: 44.53703 ,name:"Скульптура «Родина-Мать зовет!»"),
            PhotoImage( cityId : 17,image:"http://vetert.ru/rossiya/volgograd/sights/155-hram-vseh-svyatyh-na-mamaevom-kurgane/02.png" ,coordx: 48.740797,coordy: 44.536769,name:"Храм Всех Святых на Мамаевом кургане в Волгограде"),
            PhotoImage( cityId : 17,image:"http://vetert.ru/rossiya/volgograd/sights/320-restoran-mayak/02.jpg" ,coordx: 48.700307 ,coordy:  44.515255,name:"Ресторан «Маяк»"),
            PhotoImage( cityId : 17,image:"http://vetert.ru/rossiya/volgograd/sights/321-rechnoj-vokzal/02.jpg" ,coordx: 48.701313,coordy:  44.520045,name:"Речной вокзал"),
            PhotoImage( cityId : 17,image:"http://vetert.ru/rossiya/volgograd/sights/323-park-pobedy/05.jpg" ,coordx:48.703127,coordy: 44.518889 ,name:"Парк Победы"),
            PhotoImage( cityId : 17,image:"http://vetert.ru/rossiya/volgograd/sights/325-muzykalnyj-teatr/01.jpg" ,coordx: 48.705428 ,coordy:44.522185  ,name:"Музыкальный театр"),
            PhotoImage( cityId : 17,image:"http://vetert.ru/rossiya/volgograd/sights/76-planetariy/01.jpg" ,coordx:48.714287  ,coordy:  44.524378 ,name:"Волгоградский планетарий"),
            PhotoImage( cityId : 17,image:"http://vetert.ru/rossiya/volgograd/sights/339-memorialno-istoricheskij-muzej/01.jpg" ,coordx: 48.711227,coordy: 44.514469 ,name:"Мемориально-исторический музей"),
            PhotoImage( cityId : 17,image:"http://vetert.ru/rossiya/volgograd/sights/197-kazanskij-sobor/06.jpg" ,coordx: 48.699182 ,coordy: 44.484153,name:"Казанский кафедральный собор"),
            PhotoImage( cityId : 17,image:"http://vetert.ru/rossiya/volgograd/sights/157-ploshad-pavshih-bortsov/01.png" ,coordx: 48.708104 ,coordy:  44.515486 ,name:"Площадь Павших Борцов"),
            PhotoImage( cityId : 17,image:"http://vetert.ru/rossiya/volgograd/sights/167-botanicheskiy-sad-vgpu/08.png" ,coordx:48.715198,coordy: 44.527402 ,name:"Ботанический сад ВГПУ"),
            PhotoImage( cityId : 17,image:"http://vetert.ru/rossiya/volgograd/sights/351-park-skver-sashi-filippova/01.jpg" ,coordx:48.695264 ,coordy: 44.499716 ,name:"Парк, сквер Саши Филиппова и памятник"),
            
            //Вологда+
            PhotoImage( cityId : 18,image:"https://autotravel.ru/phalbum/90261/123-s.jpg" ,coordx:59.22376519999999 ,coordy:39.88213960000007  ,name:"Вологодский Кремль"),
            PhotoImage( cityId : 18,image:"https://autotravel.ru/phalbum/10104/043-s.jpg" ,coordx:59.22376519999999 ,coordy: 39.88213960000007 ,name:"Спасо-Прилуцкий монастырь"),
            PhotoImage( cityId : 18,image:"https://autotravel.ru/phalbum/90358/113-s.jpg" ,coordx:59.2244041 ,coordy: 39.88236860000006 ,name:"Софийский собор"),
            PhotoImage( cityId : 18,image:"https://autotravel.ru/phalbum/90423/144-s.jpg" ,coordx: 59.22384199999999,coordy: 39.88480690000006 ,name:"Музей кружева"),
            PhotoImage( cityId : 18,image:"https://autotravel.ru/phalbum/90852/134-s.jpg" ,coordx:59.2245017 ,coordy: 39.884699400000045 ,name:"Храм Святого Благоверного Князя Александра Невского"),
            PhotoImage( cityId : 18,image:"https://autotravel.ru/phalbum/90852/133-s.jpg" ,coordx: 59.223496,coordy: 39.886807999999974 ,name:"Храм Покрова Пресвятой Богородицы на Торгу"),
            PhotoImage( cityId : 18,image:"https://autotravel.ru/phalbum/90766/143-s.jpg" ,coordx:59.22592599999999 ,coordy:39.87510599999996  ,name:"Центр народных художественных промыслов и ремесел Резной Палисад"),
            PhotoImage( cityId : 18,image:"http://glinki-vologda.cerkov.ru/files/2014/03/0_99434_ebfc5e0d_L-%E2%80%94-%D0%BA%D0%BE%D0%BF%D0%B8%D1%8F1.jpg" ,coordx: 59.2112716,coordy: 39.88208550000002 ,name:"Храм Святителя Николая на Глинках"),
            PhotoImage( cityId : 18,image:"https://autotravel.ru/phalbum/90766/135-s.jpg" ,coordx: 59.209718,coordy: 39.84800199999995 ,name:"Занимательный музей наук Эйнштейна"),
            
            //Воронеж+
            PhotoImage( cityId : 19,image:"https://autotravel.ru/phalbum/90690/161-s.jpg" ,coordx: 51.7068538,coordy: 39.1722585 ,name:"Памятник Котенку с улицы Лизюкова"),
            PhotoImage( cityId : 19,image:"https://autotravel.ru/phalbum/90648/151-s.jpg" ,coordx: 51.661642,coordy: 39.19864699999994 ,name:"Воронежский театр оперы и балета"),
            PhotoImage( cityId : 19,image:"https://autotravel.ru/phalbum/90195/109-s.jpg" ,coordx:51.6936312 ,coordy: 39.20897530000002 ,name:"Ротонда"),
            PhotoImage( cityId : 19,image:"https://autotravel.ru/phalbum/90692/184-s.jpg" ,coordx: 51.6762138,coordy: 39.21044170000005 ,name:"Благовещенский собор"),
            PhotoImage( cityId : 19,image:"https://autotravel.ru/phalbum/90896/107-s.jpg" ,coordx: 51.65596049999999,coordy: 39.21606269999995 ,name:"Корабль-музей Гото Предестинация"),
            PhotoImage( cityId : 19,image:"https://autotravel.ru/phalbum/90896/102-s.jpg" ,coordx: 51.6612172,coordy: 39.20749049999995 ,name:"Каменный мост "),
            PhotoImage( cityId : 19,image:"https://autotravel.ru/phalbum/90896/118-s.jpg" ,coordx: 51.66505489999999,coordy: 39.21280839999997 ,name:"Собор Покрова Пресвятой Богородицы"),
            PhotoImage( cityId : 19,image:"https://autotravel.ru/phalbum/90925/149-s.jpg" ,coordx:51.659682 ,coordy:39.24624599999993  ,name:"Музей-Диорама"),
            PhotoImage( cityId : 19,image:"http://www.teleport2001.ru/files/teleport/images/2013/09/02/shut.jpg" ,coordx:51.66625 ,coordy: 39.20478200000002 ,name:"Музей театральной куклы им. А.А.Веселова при Воронежском государственном театре кукол Шут"),
            PhotoImage( cityId : 19,image:"https://autotravel.ru/phalbum/90794/164-s.jpg" ,coordx: 51.646498,coordy: 39.23678610000002 ,name:"Церковь Введения Пресвятой Богородицы во Храм"),
            PhotoImage( cityId : 19,image:"https://autotravel.ru/phalbum/91014/103-s.jpg" ,coordx: 51.662017,coordy: 39.20102099999997 ,name:"Кольцовский сквер"),
            PhotoImage( cityId : 19,image:"https://autotravel.ru/phalbum/91014/108-s.jpg" ,coordx:51.67492379999999 ,coordy: 39.206350799999996 ,name:"Парк Орленок"),
            PhotoImage( cityId : 19,image:"https://autotravel.ru/phalbum/91014/125-s.jpg" ,coordx:51.646498 ,coordy: 39.2367861 ,name:"Церковь Успения Пресвятой Богородицы"),
            PhotoImage( cityId : 19,image:"https://autotravel.ru/phalbum/90997/115-s.jpg" ,coordx: 51.6402623,coordy:39.2433407 ,name:"Воронежский зоопарк имени А.С. Попова"),
            
            
            /*            //Геленджик
             PhotoImage( cityId : 7,image:"http://vetert.ru/rossiya/gelendzhik/sights/544-pamyatnik-lermontovu/02.jpg" ,coordx:44.564523 ,coordy:38.076821  ,name:"Памятник Лермонтову"),
             PhotoImage( cityId : 7,image:"http://vetert.ru/rossiya/gelendzhik/sights/549-lermontovskij-bulvar/02.jpg" ,coordx:44.573747 ,coordy: 38.068321 ,name:"Лермонтовский бульвар"),
             PhotoImage( cityId : 7,image:"http://vetert.ru/rossiya/gelendzhik/sights/554-centralnyj-park-attrakcionov/01.jpg" ,coordx: 44.580631,coordy:38.060235,name:"Центральный городской парк аттракционов и развлечений"),
             PhotoImage( cityId : 7,image:"http://vetert.ru/rossiya/gelendzhik/sights/556-kanatnaya-doroga-olimp/04.jpg" ,coordx: 44.585279,coordy: 38.101945,name:"Канатная дорога Олимп"),
             PhotoImage( cityId : 7,image:"http://vetert.ru/rossiya/gelendzhik/sights/557-kontaktnyj-zoopark-zov-dzhunglej/03.jpg" ,coordx: 44.576124 ,coordy: 38.093148 ,name:"Контактный зоопарк «Зов Джунглей»"),
             PhotoImage( cityId : 7,image:"http://vetert.ru/rossiya/gelendzhik/sights/561-morskoj-muzej/14.jpg" ,coordx:44.563157 ,coordy: 38.077164 ,name:"Морской музей"),
             PhotoImage( cityId : 7,image:"http://vetert.ru/rossiya/gelendzhik/sights/552-okeanarium/07.jpg" ,coordx: 44.558922 ,coordy: 38.076392 ,name:"Океанариум"),
             PhotoImage( cityId : 7,image:"http://vetert.ru/rossiya/gelendzhik/sights/553-utrishskij-delfinarij/02.jpg" ,coordx: 44.572851,coordy: 38.075815 ,name:"Утришский дельфинарий "),
             PhotoImage( cityId : 7,image:"http://vetert.ru/rossiya/gelendzhik/sights/539-pamyatnik-skulptura-belaya-nevesta/01.jpg",coordx:44.561342 ,coordy: 38.076432,name:" Cкульптура «Белая невеста»"),
             PhotoImage( cityId : 7,image:"http://vetert.ru/rossiya/gelendzhik/sights/551-poyuschij-muzykalnyj-fontan/02.jpg" ,coordx:44.564763 ,coordy:38.076687  ,name:"Поющий музыкальный фонтан"),
             PhotoImage( cityId : 7,image:"http://vetert.ru/rossiya/gelendzhik/sights/540-svyato-voznesenskij-hram/05.jpg" ,coordx:44.559751,coordy:38.078505  ,name:"Свято-вознесенский храм"),
             PhotoImage( cityId : 7,image:"http://vetert.ru/rossiya/gelendzhik/sights/541-svyato-preobrazhenskij-hram/08.jpg" ,coordx: 44.576555 ,coordy: 38.080439 ,name:"Свято-преображенский храм"),
             PhotoImage( cityId : 7,image:"http://vetert.ru/rossiya/gelendzhik/sights/542-hram-mihaila-chernigovskogo/08.jpg" ,coordx:44.571577 ,coordy: 38.022316 ,name:"Храм Михаила Черниговского ")//,
             */
            //Челябинск
            PhotoImage( cityId : 22,image:"https://akuaku.ru/static/2013/3/5/9b72e4fc212b40f4bd833e1010916511.jpg" ,coordx: 55.1678329,coordy: 61.400530399999 ,name:"Кировка"),
            PhotoImage( cityId : 22,image:"http://2.bp.blogspot.com/-5bgboeffmRc/T4RB9d1ZMBI/AAAAAAAABbQ/LfFEKyTdDUk/s1600/DSC03732.JPG" ,coordx: 55.1714764,coordy: 61.399417999999 ,name:"Зал камерной и органной музыки на Алом поле"),
            PhotoImage( cityId :22,image:"https://autotravel.ru/phalbum/90204/184-s.jpg" ,coordx:55.159255  ,coordy:  61.363087,name:"Памятник И. В. Курчатову"),
            PhotoImage( cityId : 22,image:"http://www.russian-autotravel.ru/userimages/3/28.jpg" ,coordx:55.14169  ,coordy:  61.413526,name:"Монумент Сказ об Урале"),
            PhotoImage( cityId : 22,image:"https://autotravel.ru/phalbum/90204/188-s.jpg" ,coordx: 55.160389,coordy: 61.433964 ,name:"Музей трудовой и боевой славы ЧТЗ"),
            PhotoImage( cityId : 22,image:"http://140706.selcdn.ru/mapstore/map/landmarks/836/1_57417322c2d7a979.jpeg" ,coordx: 55.163423,coordy:  61.371712,name:"ЦПКиО имени Ю. А. Гагарина"),
            PhotoImage( cityId : 22,image:"http://obzor-mest.ru/wp-content/uploads/2014/02/vid-na-hram-svyatoj-troicy-v-chelyabinske.jpg" ,coordx:55.174313 ,coordy:  61.399103,name:"Церковь Троицы Живоначальной"),
            PhotoImage( cityId : 22,image:"http://sobor-chel.ru/uploads/images/raznoe/sobory/1951.jpeg" ,coordx: 55.160575,coordy:61.455413 ,name:"Церковь Василия Великого")//,
            /*  PhotoImage( cityId : 22,image:"" ,coordx: 1,coordy: 1 ,name:""),
             PhotoImage( cityId : 22,image:"" ,coordx:1 ,coordy: 1 ,name:""),
             PhotoImage( cityId : 22,image:"" ,coordx: 1,coordy:1  ,name:""),
             PhotoImage( cityId : 22,image:"" ,coordx: 1,coordy: 1 ,name:""),
             PhotoImage( cityId : 22,image:"" ,coordx: 1,coordy: 1 ,name:""),
             PhotoImage( cityId : 22,image:"" ,coordx:1 ,coordy: 1 ,name:""),
             PhotoImage( cityId : 22,image:"" ,coordx:1 ,coordy: 1 ,name:""),
             /* PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 7,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 7,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 7,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
             PhotoImage( cityId : 1,image:"" ,coordx: ,coordy:  ,name:""),*/*/
        ]
        for ijk in 0...photos.count-1
        {
           /* if photos[ijk].cityId == detailCity.id{
                ph.append(Phh(image: photos[ijk].image,name: photos[ijk].name))
            }*/
            if photos[ijk].cityId == detailCity.id{
                phim.append(PhIm(image : photos[ijk].image,name: photos[ijk].name,
                                 coordx :photos[ijk].coordx, coordy :photos[ijk].coordy))
            }
        }
        
           }
   
       override func viewWillAppear(_ animated: Bool) {
        self.collectionView!.reloadData()
    }
       // смотрим сколько ячеек необходимо создать
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Количество ячеек должно соответствовать количеству
        // фотографий в нашем массиве
       return   phim.count //ph.count //photos.count //(itemsAry?.count)!
        
    }
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
//заполняем ячейки
   
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPhoto", for: indexPath) as! CollectionViewCellPhotos
        
       // if ph.count != 0{

      /*  let item = ph[indexPath.row]
        
        let data = NSData(contentsOf: URL(string:(item.img)!)!)
        cell.photo.image = UIImage(data: data as! Data)
        cell.nameLabel.text = item.name*/
     //   }
       // var backBtn = cell.viewWithTag(1) as! UIButton
      //  backBtn.isHidden = true
        let item = phim[indexPath.row]
        
        let data = NSData(contentsOf: URL(string:(item.imagePhIm)!)!)
        cell.photo.image = UIImage(data: data as! Data)
        cell.nameLabel.text = item.namPhIm

        
        return cell
         }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOnePhoto" {
            if let indexPath = collectionView.indexPath(for: self.collectionView.indexPathsForSelectedItems){
         
                let phoImselected = phim[indexPath.row] as PhIm
                let phot = phoImselected.phim
            //phoIm = phim[(indexPath as! NSIndexPath).row]
           
                let controller = segue.destination as! NewViewController
                
                controller.detailPhoto = phot
             /*   controller.corX =
                controller.corY =
                controller.ImageText =
                controller.NamePhoto =*/
                //controller.detailPhoto = phoIm
            //  controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
*/
  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOnePhoto" {
            if let indexPath = self.collectionView.indexPath(for: CollectionViewCellPhotos)//( sender: as! CollectionViewCellPhotos ){
           let photoIm = phim[indexPath].row
                let detailVC:NewViewController = segue.destination as! NewViewController
                
                detailVC.detailPhoto = photoIm
              //  detailVC.currenText = self.collectionView.cellForItem(at: indexPath)
            

                /*   let photoIm: PhIm
       
                    photoIm =  phim[(indexPath as NSIndexPath).row]

                let controller = segue.destination as! NewViewController
                 //   (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailPhoto = photoIm*/
           }
 */
           /* func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                let photoIm: PhIm
                photoIm = phim[indexPath].row
               
                
            }*/

   /* func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        selectedImage = ph[indexPath.row].img! as String
        selectedLabels = ph[indexPath.row].name! as String
        self.performSegue(withIdentifier: "showOnePhoto", sender: self)
        //self.performSegueWithIdentifer("showOnePhoto", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOnePhoto"{
       // if segue.identifer == "showOnePhoto" {
            let detailVC:NewViewController = segue.destination as! NewViewController
            detailVC.ImageText = selectedLabels
            detailVC.NamePhoto = selectedImage
        }
    }*/
   
 
 
    }
    
    
    
