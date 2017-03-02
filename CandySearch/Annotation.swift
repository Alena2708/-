//
//  Annotation.swift
//  CandySearch
//
//  Created by Admin on 01.03.17.
//  Copyright © 2017 Peartree Developers. All rights reserved.
//

import MapKit
import UIKit
/*class Capital :NSObject,MKAnnotation {

    var title: String?
   // var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var info :String?
    
    init (title:String/*,subtitle:String*/,coordinate :CLLocationCoordinate2D, info:String)
    {
        self.title = title
       // self.subtitle = subtitle
        self.coordinate = coordinate
        self.info = info
    }
}
*/
class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
