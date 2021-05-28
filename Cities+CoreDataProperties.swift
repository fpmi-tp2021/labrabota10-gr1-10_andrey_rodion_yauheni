//
//  Cities+CoreDataProperties.swift
//  Task1.2Lab9
//
//  Created by Andrey Kuksa on 5/27/21.
//  Copyright © 2021 Museums. All rights reserved.
//
//

import Foundation
import CoreData


extension Cities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cities> {
        return NSFetchRequest<Cities>(entityName: "Cities")
    }

    @NSManaged public var id: NSNumber?
    @NSManaged public var name: String?
    @NSManaged public var museums: NSSet?

}

// MARK: Generated accessors for museums
extension Cities {

    @objc(addMuseumsObject:)
    @NSManaged public func addToMuseums(_ value: Museums)

    @objc(removeMuseumsObject:)
    @NSManaged public func removeFromMuseums(_ value: Museums)

    @objc(addMuseums:)
    @NSManaged public func addToMuseums(_ values: NSSet)

    @objc(removeMuseums:)
    @NSManaged public func removeFromMuseums(_ values: NSSet)

}

extension Cities : Identifiable {

}
