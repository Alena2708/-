//
//  CategoryViewController.swift
//  CandySearch
//
//  Created by Admin on 21.12.16.
//  Copyright © 2016 Peartree Developers. All rights reserved.
//

import UIKit
import MapKit

class CategoryViewController: UIViewController  {
    
    var detailCity: City!
    var    categoryes = [CategoryId]()
    var places = [CategoryPlaces]()
    var newView = [NewView]()
    
    
    @IBOutlet var switchДостопримечательности: UISwitch!
    @IBOutlet var switchПокупки: UISwitch!
    @IBOutlet var switchПитание: UISwitch!
    
    
    /*  name:"Достопримечательности"),
     CategoryId(id:2, name:"Покупки"),
     CategoryId(id:3, name:"Питание"),
     CategoryId(id:4, name:"Спорт"),
     CategoryId(id:5, name:"Отдых семьей"),
     CategoryId(id:6, name:"Ночные развлечения"),
     CategoryId(id:7, name:"Здоровье"),
     CategoryId(id:8, name:"Жилье"),
     CategoryId(id:9, name:"Транспорт"),*/
    
    override func viewDidLoad() {
        
        categoryes = [
            CategoryId(id:1, name:"Достопримечательности"),
            CategoryId(id:2, name:"Покупки"),
            CategoryId(id:3, name:"Питание"),
            CategoryId(id:4, name:"Спорт"),
            CategoryId(id:5, name:"Отдых семьей"),
            CategoryId(id:6, name:"Ночные развлечения"),
            CategoryId(id:7, name:"Здоровье"),
            CategoryId(id:8, name:"Жилье"),
            CategoryId(id:9, name:"Транспорт"),
        ]
        
        places = [
            //
            //Достопримечательности
            CategoryPlaces(idCity: 22,idCategory: 1 ,name:"Кировка - Челябинский Арбат",idPhoto:"https://media-cdn.tripadvisor.com/media/photo-f/02/73/58/9f/filename-015-jpg-thumbnail0.jpg",corX: 55.1678329,corY: 61.400530399999,text:"Самая красивая и интересная улица Челябинска – это, безусловно, Кировка (или Челябинский Арбат). Ее любят как сами челябинцы, так и гости города. Это одна из самых старых улиц Челябинска. До наших дней на ней сохранились красивые купеческие дома. В прошлом здесь проходил Уфимский тракт, а сейчас эта улица стала пешеходной.Кировку украшают многочисленные бронзовые скульптуры и другие очень любопытные памятники. Здесь множество кафе, магазинов, бутиков. Кировка начинается от площади Революции, у здания Законодательного собрания Челябинской области. До революции в этом здании располагалось Челябинское отделение государственного банка. Здесь, при входе на Челябинский Арбат, установлена красивая арка. Кстати, это копия ранее реально существовавшей арки, встречавшей гостей города век назад.",adress:""),
            CategoryPlaces(idCity: 22,idCategory:1 ,name:"Памятник И. В. Курчатову",idPhoto:"https://autotravel.ru/phalbum/90204/184-s.jpg",corX: 55.159255,corY: 61.363087,text:"Памятник Курчатову — памятник знаменитому академику-ядерщику был открыт в 1986 году к 250-летию Челябинска на вновь созданной площади Науки около здания Южно-Уральского государственного университета по заказу челябинского горисполкома, председателем которого в то время был Пётр Сумин. С 2014 года памятник включен в единый реестр объектов культурного наследия Российской Федераци",adress:""),
            
            
            
            /*   CategoryPlaces(idCity: 22 ,idCategory: 1,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity: 22,idCategory:1 ,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity: 22,idCategory:1 ,name:"",idPhoto:"",corX: ,corY: ),
             //
             CategoryPlaces(idCity: 22,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity: 22,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity: 22,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity: 22,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity: 22,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             //
             CategoryPlaces(idCity: 22,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity: 22,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity:22 ,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity: 22,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             //
             CategoryPlaces(idCity: 22,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity:22 ,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity: 22,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             /* CategoryPlaces(idCity: ,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),*/
             CategoryPlaces(idCity: ,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity: ,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity: ,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity: ,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity: ,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),
             CategoryPlaces(idCity: ,idCategory: ,name:"",idPhoto:"",corX: ,corY: ),*/
        ]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToGoogle(_ sender: Any) {
        //создаем новую структуру и заполняем ее данными которые будут отображаться на карет в зависимости от выбранных категорий и места(города)
        
        
        
        
        
        for ijk in 0...places.count-1
        {
            // проверяем город(место)
            if places[ijk].idCity == detailCity.id{
                
                ///проверяем категорию
                if switchДостопримечательности.isOn == true {//если Достопримечательности
                    
                    if places[ijk].idCategory == categoryes[0].id{//если категория в мест еравна категории достопримечательности
                        
                        newView.append(NewView(name : places[ijk].name,photo: places[ijk].idPhoto,
                                               cx :places[ijk].corX, cy :places[ijk].corY,text:places[ijk].text,adresS:places[ijk].adress))
                    }
                }
                
                if switchПокупки.isOn == true {
                    if places[ijk].idCategory == categoryes[1].id{//если категория в мест еравна категории Покупки
                        
                        newView.append(NewView(name : places[ijk].name,photo: places[ijk].idPhoto,
                                               cx :places[ijk].corX, cy :places[ijk].corY,text:places[ijk].text,adresS:places[ijk].adress))
                    }
                    
                }
                
                if switchПитание.isOn == true {
                    if places[ijk].idCategory == categoryes[1].id{//если категория в мест еравна категории Покупки
                        
                        newView.append(NewView(name : places[ijk].name,photo: places[ijk].idPhoto,
                                               cx :places[ijk].corX, cy :places[ijk].corY,text:places[ijk].text,adresS:places[ijk].adress))
                    }
                    
                }
                /*   if switchПокупки.isOn == true {
                 if places[ijk].idCategory == categoryes[1].id{//если категория в мест еравна категории Покупки
                 
                 newView.append(NewView(name : places[ijk].name,photo: places[ijk].idPhoto,
                 cx :places[ijk].corX, cy :places[ijk].corY,text:places[ijk].text,adresS:places[ijk].adress))
                 }
                 
                 }*/
            }}
        if newView.count != 0 {
            var   mapPoint = [MKMapItem]()
            for i in 0...newView.count-1{
                
                
                // for i in 0...newView.count-1{
                
                
                
                //Defining destination
                let latitude:CLLocationDegrees = CLLocationDegrees(newView[i].cx)
                let longitude:CLLocationDegrees = CLLocationDegrees(newView[i].cy)
                
                let regionDistance:CLLocationDistance = 1000;
                let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
                let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
                
                let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
                
                let place = MKPlacemark(coordinate: coordinates)
                let mapItem = MKMapItem(placemark: place)
                //mapPoint = [mapItem]
                //  mapPoint.append(contentsOf: mapItem)
                //   let asdf = MKPlacemar
                mapPoint.append(mapItem)
                mapItem.name = newView[i].name
                
                //  MKMapItem.openMaps (with: mapPoint, launchOptions: nil)
                
                
                //  MKMapItem.openMaps (with: [mapPoint], launchOptions: nil)
                
                /*    if i == newView.count-1{
                 MKMapItem.openMaps (with: [mapPiont], launchOptions: nil)
                 // mapItem.openInMaps(launchOptions: options)
                 }*/
                // let mapitems = [mapItem]
                
                //  MKMapItem.openMaps (with: [mapItem], launchOptions: nil)
                //  place.append(mapItem)
                
                //  mapView.addAnnotation(annotation)
                /*   let placemark = MKPlacemark(coordinate: coordinates)
                 let mapItem = MKMapItem(placemark: placemark)
                 mapItem.name = newView[i].name
                 //      mapItem.description = newView[i].text
                 mapItem.openInMaps(launchOptions: options)*/
                
                /* //Defining destination
                 let latitude:CLLocationDegrees = CLLocationDegrees(detailCity.coordinateX)
                 let longitude:CLLocationDegrees = CLLocationDegrees(detailCity.coordinateY)
                 
                 let regionDistance:CLLocationDistance = 4000;
                 let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
                 let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
                 
                 let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
                 
                 let placemark = MKPlacemark(coordinate: coordinates)
                 let mapItem = MKMapItem(placemark: placemark)
                 mapItem.name = detailCity.name
                 mapItem.openInMaps(launchOptions: options)*/
                
            }
            MKMapItem.openMaps (with: mapPoint, launchOptions: nil)
        }
        else {
            //Defining destination
            let latitude:CLLocationDegrees = CLLocationDegrees(detailCity.coordinateX)
            let longitude:CLLocationDegrees = CLLocationDegrees(detailCity.coordinateY)
            
            let regionDistance:CLLocationDistance = 4000;
            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
            let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
            
            let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
            
            let placemark = MKPlacemark(coordinate: coordinates)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = detailCity.name
            //      mapItem.description = newView[i].text
            mapItem.openInMaps(launchOptions: options)
        }

    }
    
}
  
