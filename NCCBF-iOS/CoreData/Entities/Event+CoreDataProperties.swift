//
//  Event+CoreDataProperties.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/30/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var details: String?
    @NSManaged public var endAt: Date?
    @NSManaged public var id: Int
    @NSManaged public var location: String
    @NSManaged public var name: String
    @NSManaged public var startAt: Date
    @NSManaged public var imageName: String?

}
