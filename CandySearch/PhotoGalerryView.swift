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
    
    
 
    
    var detailCity: City!
    var photos = [PhotoImage]()
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
            //Абзаково
          PhotoImage( cityId : 1,image:"http://www.openarium.ru/%D1%84%D0%BE%D1%82%D0%BE/%D1%80%D0%BE%D1%81%D1%81%D0%B8%D1%8F/%D0%B0%D0%B1%D0%B7%D0%B0%D0%BA%D0%BE%D0%B2%D0%BE/%D0%BF%D0%B5%D1%89%D0%B5%D1%80%D0%B0-%D1%81%D0%B0%D0%BB%D0%B0%D0%B2%D0%B0%D1%82%D0%B0-%D1%8E%D0%BB%D0%B0%D0%B5%D0%B2%D0%B0.jpg" ,coordx:53.600948 ,coordy:56.646645,name:"Салаватская пещера"),
          PhotoImage( cityId : 1,image:"http://www.bashturist.ru/gallery/data/media/169/bashturist-ru_skal2.jpg" ,coordx:53.600948 ,coordy:56.646645,name:"Салаватская пещера"),
          PhotoImage( cityId : 1,image:"http://abzak.ru/wps/wp-content/uploads/2013/02/%D0%90%D0%B1%D0%B7%D0%B0%D0%BA%D0%BE%D0%B2%D0%BE-3.jpg" ,coordx:53.813353 ,coordy: 58.625193 ,name:"Канатная дорога «Абзаково» - горнолыжный центр"),
          PhotoImage( cityId : 1,image:"http://отдых.челсити.рф/images/%D0%9E%D1%82%D0%B4%D1%8B%D1%85/%D0%90%D0%BA%D1%82%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9/%D0%91%D0%B0%D1%88%D0%BA%D0%B8%D1%80%D0%B8%D1%8F/%D0%90%D0%B1%D0%B7%D0%B0%D0%BA%D0%BE%D0%B2%D0%BE/%D0%90%D0%B1%D0%B7%D0%B0%D0%BA%D0%BE%D0%B2%D0%BE.jpg" ,coordx:53.812967 ,coordy:58.628658  ,name:"«Абзаково» - горнолыжный центр "),
          PhotoImage( cityId : 1,image:"http://отдых.челсити.рф/images/%D0%9E%D1%82%D0%B4%D1%8B%D1%85/%D0%90%D0%BA%D1%82%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9/%D0%91%D0%B0%D1%88%D0%BA%D0%B8%D1%80%D0%B8%D1%8F/%D0%90%D0%B1%D0%B7%D0%B0%D0%BA%D0%BE%D0%B2%D0%BE/%D0%90%D0%B1%D0%B7%D0%B0%D0%BA%D0%BE%D0%B2%D0%BE_%D0%90%D0%BA%D0%B2%D0%B0-%D0%B1%D0%B0%D1%80_%D0%94%D0%B5%D0%BB%D1%8C%D1%84%D0%B8%D0%BD._%D0%90%D0%BA%D0%B2%D0%B0%D0%BF%D0%B0%D1%80%D0%BA.jpg" ,coordx:53.815228 ,coordy:58.625944 ,name:"Аква-бар «Дельфин». Аквапарк"),
          PhotoImage( cityId : 1,image:"http://отдых.челсити.рф/images/%D0%9E%D1%82%D0%B4%D1%8B%D1%85/%D0%90%D0%BA%D1%82%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9/%D0%91%D0%B0%D1%88%D0%BA%D0%B8%D1%80%D0%B8%D1%8F/%D0%90%D0%B1%D0%B7%D0%B0%D0%BA%D0%BE%D0%B2%D0%BE/shema-trass-abzakovo.jpg" ,coordx:53.812967 ,coordy: 58.628658 ,name:"«Абзаково» - горнолыжный центр "),
          PhotoImage( cityId : 1,image:"http://abzak.ru/wps/wp-content/uploads/2014/12/%D0%9A%D0%B0%D1%82%D0%BE%D0%BA-%D0%B2-%D0%90%D0%B1%D0%B7%D0%B0%D0%BA%D0%BE%D0%B2%D0%BE.jpg" ,coordx: 53.812967 ,coordy:58.628658  ,name:"Каток Абзаково"),
          PhotoImage( cityId : 1,image:"http://abzak.ru/wps/wp-content/uploads/2015/12/%D0%97%D0%B8%D0%BC%D0%BD%D0%B8%D0%B9-%D0%BA%D0%B0%D1%80%D1%82%D0%B8%D0%BD%D0%B3-%D0%B2-%D0%90%D0%B1%D0%B7%D0%B0%D0%BA%D0%BE%D0%B2%D0%BE.jpg" ,coordx: 53.812967 ,coordy: 58.628658,name:"Картинг в Абзаково"),
          //Адлер
            PhotoImage( cityId : 2,image:"https://edemnayug.com/wp-content/uploads/2014/11/%D1%81%D0%BA%D1%83%D0%BB%D1%8C%D0%BF%D1%82%D1%83%D1%80%D1%8B.jpg" ,coordx:43.471857 ,coordy: 39.897108 ,name:"Океанариум"),
          PhotoImage( cityId : 2,image:"http://олимпийский-парк.рф/uploads/posts/2015-12/1450438244_f33f.jpg" ,coordx:43.405515 ,coordy: 39.955162 ,name:"Светомузыкальный фонтан в Олимпийском парке"),
          PhotoImage( cityId : 2,image:"http://олимпийский-парк.рф/uploads/posts/2015-09/1443511555_33.jpg" ,coordx:43.404673 ,coordy:39.94998  ,name:"Ледовый дворец «Большой»"),
          PhotoImage( cityId : 2,image:"http://www.tourprom.ru/site_media/cache/3b/d7/3bd7119118d108dca8e0c423696591c3.jpg" ,coordx:43.61318 ,coordy: 39.978712,name:"Каньон реки Псахо"),
          PhotoImage( cityId : 2,image:"http://www.tourprom.ru/site_media/cache/7e/ee/7eee2d8b8cf3f91c7a9d272a84edf49b.jpg" ,coordx:43.40226 ,coordy:39.951905  ,name:"Олимпийская Ледовая арена «Шайба»"),
          PhotoImage( cityId : 2,image:"http://www.tourprom.ru/site_media/cache/14/c0/14c0512399d1cc79dd1b56af6305e46d.jpg" ,coordx:43.51712 ,coordy:39.992878  ,name:"Форелевое хозяйство в Адлере"),
          PhotoImage( cityId : 2,image:"http://www.tourprom.ru/site_media/cache/ff/26/ff26a693f63540ded4c60c0d71d0e660.jpg" ,coordx:43.398956 ,coordy: 39.949564 ,name:"Олимпийская Нижнеимеретинская набережная"),
          PhotoImage( cityId : 2,image:"http://news.momondo.com/wp-content/uploads/2016/01/Tesla_Sochi_3.jpg" ,coordx: 43.404568,coordy: 39.960794 ,name:"Электрический музей Николы Тесла"),
          PhotoImage( cityId : 2,image:"http://www.tourprom.ru/site_media/cache/69/e5/69e530175d249d231b2a60a78b2d3e5b.jpg" ,coordx: 43.557701,coordy: 39.820632 ,name:"Орлиные скалы и памятник Прометею"),
          //Адыгея
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
          //Anapa
          PhotoImage( cityId : 4,image:"http://vetert.ru/rossiya/krasnodarskij-kraj/sights/482-neberdzhaj-svyatye-istochniki-ruchka/03.jpg" ,coordx:44.781807 ,coordy: 37.868334  ,name:"Неберджай – святые источники и «Святая ручка»"),
          PhotoImage( cityId : 4,image:"http://vetert.ru/rossiya/krasnodarskij-kraj/sights/435-dolina-lotosov-anapa-taman/02.jpg" ,coordx: 45.28870,coordy: 37.222325 ,name:"Долина лотосов"),
          PhotoImage( cityId : 4,image:"http://vetert.ru/rossiya/krasnodarskij-kraj/sights/434-vinzavod-podvaly-sauk-dere/03.jpg" ,coordx: 44.900207  ,coordy:37.886803  ,name: "Винзавод, подвалы Саук-Дере"),
          PhotoImage( cityId : 4,image:"http://vetert.ru/rossiya/krasnodarskij-kraj/sights/431-gora-lysaya-anapa/01.jpg" ,coordx: 44.843056,coordy: 37.358333 ,name:"Гора Лысая"),
          PhotoImage( cityId : 4,image:"http://vetert.ru/rossiya/anapa/sights/373-hram-svyatogo-onufriya-velikogo/01.jpg" ,coordx: 44.895288 ,coordy: 37.309566 ,name:"Храм Святого Онуфрия Великого"),
          PhotoImage( cityId : 4,image:"http://vetert.ru/rossiya/anapa/sights/362-anapskij-mayak/03.jpg" ,coordx: 44.887967,coordy: 37.299109 ,name:"Анапский маяк"),
          PhotoImage( cityId : 4,image:"http://vetert.ru/rossiya/anapa/sights/363-kraevedcheskij-muzej/03.jpg" ,coordx: 44.888235 ,coordy:37.301002  ,name:"АКраеведческий музей"),
          PhotoImage( cityId : 4,image:"http://anapa.ru/objects/leisure/43/ex3.jpg" ,coordx: 44.88832,coordy: 37.30022  ,name:"Aквариум батискаф"),
          PhotoImage( cityId : 4,image:"http://vetert.ru/rossiya/anapa/sights/361-centralnaya-naberezhnaya/01.jpg" ,coordx:  44.897718,coordy: 37.312678 ,name:""),
          //Astrahan
          PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/astrakhan/sights/136-astrakhanskijj-kreml/01.png" ,coordx: 46.349225 ,coordy:48.032052  ,name:"Астраханский кремль"),
          PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/astrakhan/sights/143-uspensky-sobor/03.jpg" ,coordx:  46.349301,coordy:48.032983  ,name:"Успенский собор в Астрахани"),
          PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/astrakhan/sights/486-troickij-sobor/08.jpg" ,coordx:46.350201 ,coordy: 48.0322 ,name:"Троицкий собор"),
          PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/astrakhan/sights/138-naberezhnaya-astrakhani/03.png" ,coordx: 46.321016,coordy: 47.965646  ,name:"Набережная Астрахани"),
          PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/astrakhan/sights/139-zags-astrakhani/01.png" ,coordx:46.355599 ,coordy: 48.033015  ,name:"Здание ЗАГСа в Астрахани"),
          PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/astrakhan/sights/140-muzykalnyj-fontan/03.png" ,coordx: 46.352419 ,coordy: 48.027382 ,name:"Музыкальный фонтан в Астрахани"),
          PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/astrakhan/sights/137-most-vlyublennykh/01.png" ,coordx: 46.354677,coordy: 48.038822 ,name:"Мост влюбленных в Астрахани"),
          PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/astrakhan/sights/142-lebedinoe-ozero/01.png" ,coordx:46.34598 ,coordy: 48.023328 ,name:"Лебединое озеро в Астрахани"),
          PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/astrakhan/sights/507-kartinnaya-galereya-dogadina/01.jpg" ,coordx: 46.349192,coordy: 48.051898  ,name:"Картинная галерея Догадина"),
          PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/astrakhan/sights/145-astrahanskij-gorodskoj-akvarium/01.png" ,coordx:46.351142 ,coordy:48.039366  ,name:"Астраханский городской аквариум"),
          PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/astrakhan/sights/521-park-planeta/01.jpg" ,coordx: 46.334254,coordy:48.057406  ,name:"Парк «Планета»"),
          PhotoImage( cityId : 5,image:"http://www.citariga.lv/images/tornakalns/arkadijas_parks7_b.jpg" ,coordx:46.356821  ,coordy:48.051335  ,name:"Парк «Аркадия»"),
          PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/astrakhan/sights/498-pokrovskij-kafedralnyj-sobor/03.jpg" ,coordx:46.363592  ,coordy: 48.046249 ,name:"Покровский кафедральный собоp"),
          PhotoImage( cityId : 5,image:"http://vetert.ru/rossiya/astrakhan/sights/499-hram-sobor-svyatogo-knyazya-vladimira/01.jpg" ,coordx:46.339247 ,coordy: 48.015953 ,name:"Храм-собор Святого князя Владимира"),
          //Volgograd
            PhotoImage( cityId : 6,image:"http://vetert.ru/rossiya/volgograd/sights/150-steny-ruiny/01.png" ,coordx: 48.741901,coordy: 44.53811
 ,name:"Стены-руины на Мамаевом кургане"),
          PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 6,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 5,image:"" ,coordx: ,coordy:  ,name:""),
          PhotoImage( cityId : 1,image:"" ,coordx: ,coordy:  ,name:""),
        ]
        for ijk in 0...photos.count-1
        {
            if photos[ijk].cityId == detailCity.id{
                ph.append(Phh(image: photos[ijk].image,name: photos[ijk].name))
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
       return   ph.count //photos.count //(itemsAry?.count)!
        
    }
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
//заполняем ячейки
   
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPhoto", for: indexPath) as! CollectionViewCellPhotos
        let item = ph[indexPath.row]

        let data = NSData(contentsOf: URL(string:(item.img)!)!)
        cell.photo.image = UIImage(data: data as! Data)
        cell.nameLabel.text = item.name
        

       // let item = photos[indexPath.row]
    /*  //  if item.cityId == self.detailCity.id
       // {
            
              let data = NSData(contentsOf: URL(string:(item.image))!)
            cell.photo.image = UIImage(data: data as! Data)
            cell.nameLabel.text = item.name
           
      //  }
      //  else{
       
     //     }*/
        
       
        return cell
         }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func collectionView(_ collectionView: UICollectionView , didSelectItemAt: IndexPath){
        
        self.performSegue(withIdentifier: "showOnePhoto", sender: self)
        
    }

 
        
    //передача данных дочернему окну с  фотографией
           override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showOnePhoto"{
           let cell : CollectionViewCellPhotos = sender as! CollectionViewCellPhotos
            
            let image = cell.photo.image
            let text = cell.nameLabel.text
            let previewVC : NewViewController = segue.destination as! NewViewController
            previewVC.currentPhoto = image
            previewVC.textName = text
            }
    }
    
 

    
    
    }
