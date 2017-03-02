//
//  PhotoItem.swift
//  CandySearch
//
//  Created by Admin on 02.02.17.
//  Copyright © 2017 Peartree Developers. All rights reserved.
//
import UIKit
struct PhotoImage{
   // let id:Int!
    let cityId : Int!
    let image : String!
    let coordx: Float
    let coordy: Float
    let name: String!
    }
struct PhIm{
    let imagePhIm:String!
    let coordXx:Float
    let coordYy:Float
    let namPhIm: String
    
    init (image :String,name:String,coordx:Float,coordy:Float)
    {
        self.imagePhIm = image
        self.namPhIm = name
        self.coordXx = coordx
        self.coordYy = coordy
    }
    
}
class Phh: NSObject {
    var img:String?=nil
    var name:String?=nil
    
    init (image:String, name:String)
    {
        self.img = image
        self.name = name
    }
}
/*func makeItems() -> [Item] {
    var Items = [Item]()
    Items.append(Item(img:image))
}*/
/*//let imgStr1 = "http://t-ec.bstatic.com/images/hotel/max1024x768/668/6681563.jpg"
///let imgStr2 = "http://t-ec.bstatic.com/images/hotel/max1024x768/578/57834867.jpg"
//let imgStr3 = "http://s-ec.bstatic.com/images/hotel/max1024x768/347/34728136.jpg"
let imgStr4 = "http://t-ec.bstatic.com/images/hotel/max1024x768/118/11868489.jpg"
let imgStr5 = "http://i.otzovik.com/2013/09/01/521963/img/17082923.jpg"
let imgStr6 = "http://s-ec.bstatic.com/images/hotel/max1024x768/553/55382096.jpg"
let imgStr7 = "http://t-ec.bstatic.com/images/hotel/max1024x768/738/73801631.jpg"


class Item: NSObject {
    var citynameStr:Int?=nil
    var imageStr:String?=nil
    var coordX:Float?=nil
    var coordY:Float?=nil
    var name:String?=nil
    
    init(cityId:Int,img:String,coordx:Float,coordy:Float!,name:String) {
        self.citynameStr = cityId
        self.imageStr = img
        self.coordX = coordx
        self.coordY = coordy
        self.name = name
        
    }
    
    func makeItems() -> [Item] {
        var Items = [Item]()
        Items.append(Item(cityId: 1, img: "http://t-ec.bstatic.com/images/hotel/max1024x768/668/6681563.jpg",coordx: 53.811014,coordy:58.635951,name:"Отель Эдельвейс"))
        Items.append(Item(cityId: 1, img: "http://t-ec.bstatic.com/images/hotel/max1024x768/578/57834867.jpg",coordx:53.793161 ,coordy:53.793161 ,name:"База Отдыха Кизиловая"))
        Items.append(Item(cityId: 1, img: "http://s-ec.bstatic.com/images/hotel/max1024x768/347/34728136.jpg",coordx: 53.812346 ,coordy:58.630643 ,name:"Гостевой дом «Межгорье»"))
        Items.append(Item(cityId: 1, img: imgStr4,coordx: 53.806046,coordy:58.633824 ,name:"Актив-Отель Горки"))
        Items.append(Item(cityId: 1, img: imgStr5,coordx:53.795353  ,coordy: 58.626502,name:"Зоопарк"))
        Items.append(Item(cityId: 2, img: imgStr6,coordx:43.407405 ,coordy: 39.941437,name:"Апарт-отель Имеретинский - Морской квартал"))
        Items.append(Item(cityId: 2, img: imgStr7,coordx:43.392263 ,coordy: 39.97789,name:"Арфа Парк-Отель"))
        /*Items.append(Item(cityId: 2, img: imgStr8,coordx: ,coordy: ,name:))
        Items.append(Item(cityId: 2, img: imgStr9,coordx: ,coordy: ,name:))*/
        return Items
    }
    
}*/
