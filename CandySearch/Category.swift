//
//  Category.swift
//  CandySearch
//
//  Created by Admin on 21.12.16.
//  Copyright © 2016 Peartree Developers. All rights reserved.
//
import MapKit

struct CategoryPlaces {
    var idCity: Int!
    var idCategory:Int
    var name: String!
    var idPhoto: String
    var corX:Float
    var corY:Float
    var text: String
    var adress:String
}

struct CategoryId{
    var id:Int
    var name:String
}

struct NewView {
    var name:String
    var photo:String
    var cx:Float
    var cy:Float
    var text:String
    var adresS:String
}
