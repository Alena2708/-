//
//  Places+CoreDataProperties.swift
//  CandySearch
//
//  Created by Admin on 21.12.16.
//  Copyright © 2016 Peartree Developers. All rights reserved.
//

import Foundation
import CoreData


extension Places {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Places> {
        return NSFetchRequest<Places>(entityName: "Places");
    }

    @NSManaged public var about: String?
    @NSManaged public var id: Int32
    @NSManaged public var category_id: Int32
    @NSManaged public var photo_id: Int32
    @NSManaged public var place_id: Int32
    @NSManaged public var name: String?

}
