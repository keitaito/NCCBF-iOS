//
//  Event.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 2/19/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

class Event {
    
    let id: Int
    let name: String
    var details: String?
    let startAt: Date
    let endAt: Date
    let location: String
    
    init(id: Int, name: String, details: String?, startAt: Date, endAt: Date, location: String) {
        self.id = id
        self.name = name
        self.details = details
        self.startAt = startAt
        self.endAt = endAt
        self.location = location
    }
}

enum EventError: Error {
    case initializingError(String, Any)
}

extension Event {
    convenience init(json: [String: Any]) throws {
        guard let id = json["id"] as? Int else {
            throw EventError.initializingError("id is missing.", json)
        }
        guard let startAtString = json["startat"] as? String else {
            throw EventError.initializingError("startat is missing.", json)
        }
        guard let endAtString = json["endat"] as? String else {
            throw EventError.initializingError("endat is missing.", json)
        }
        guard let location = json["location"] as? String else {
            throw EventError.initializingError("location is missing.", json)
        }
        guard let name = json["name"] as? String else {
            throw EventError.initializingError("name is missing.", json)
        }
        let details = json["details"] as? String
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sss'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        guard let startAtDate = dateFormatter.date(from: startAtString) else {
            throw EventError.initializingError("startAtString is invalid.", startAtString)
        }
        guard let endAtDate = dateFormatter.date(from: endAtString) else {
            throw EventError.initializingError("endAtString is invalid.", endAtString)
        }
        
        self.init(id: id, name: name, details: details, startAt: startAtDate, endAt: endAtDate, location: location)
    }
}
