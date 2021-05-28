//
//  Museums+CoreDataProperties.swift
//  Task1.2Lab9
//
//  Created by Andrey Kuksa on 5/28/21.
//  Copyright © 2021 Museums. All rights reserved.
//
//

import Foundation
import CoreData


extension Museums {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Museums> {
        return NSFetchRequest<Museums>(entityName: "Museums")
    }

    @NSManaged public var cityId: NSNumber?
    @NSManaged public var museumDescription: String?
    @NSManaged public var id: NSNumber?
    @NSManaged public var imagePath: String?
    @NSManaged public var type: NSNumber?
    @NSManaged public var name: String?
    @NSManaged public var firstCoordinate: NSNumber?
    @NSManaged public var secondCoordinate: NSNumber?
    @NSManaged public var cities: Cities?
    @NSManaged public var types: MuseumTypes?

}

extension Museums : Identifiable {

}
