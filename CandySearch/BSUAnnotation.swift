//
//  BSUAnnotation.swift
//  CandySearch
//
//  Created by Admin on 16.12.16.
//  Copyright © 2016 Peartree Developers. All rights reserved.
//

import MapKit

class BSUAnnotation: NSObject , MKAnnotation {
    var title : String?
 //   var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    init(title:String,coordinate:CLLocationCoordinate2D){
        self.title = title
       // self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
