//
//  Event+CoreDataClass.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/26/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation
import CoreData


public class Event: NSManagedObject {

}

enum EventError: Error {
    case initializingError(String, Any)
}

extension Event {
    convenience init(json: [String: Any], context: NSManagedObjectContext) throws {
        
        self.init(context: context)
        
        guard let id = json["id"] as? Int else {
            context.delete(self)
            throw EventError.initializingError("id is missing.", json)
        }
        guard let startAtString = json["startat"] as? String else {
            context.delete(self)
            throw EventError.initializingError("startat is missing.", json)
        }
        guard let endAtString = json["endat"] as? String else {
            context.delete(self)
            throw EventError.initializingError("endat is missing.", json)
        }
        guard let location = json["location"] as? String else {
            context.delete(self)
            throw EventError.initializingError("location is missing.", json)
        }
        guard let name = json["name"] as? String else {
            context.delete(self)
            throw EventError.initializingError("name is missing.", json)
        }
        let details = json["details"] as? String
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sss'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        guard let startAtDate = dateFormatter.date(from: startAtString) else {
            context.delete(self)
            throw EventError.initializingError("startAtString is invalid.", startAtString)
        }
        guard let endAtDate = dateFormatter.date(from: endAtString) else {
            context.delete(self)
            throw EventError.initializingError("endAtString is invalid.", endAtString)
        }
        
        self.id = id
        self.startAt = startAtDate
        self.endAt = endAtDate
        self.location = location
        self.name = name
        self.details = details
    }
}
