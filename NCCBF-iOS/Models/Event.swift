//
//  Event.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 2/19/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

struct Event {
    let id: Int
    let startAt: Date
    let endAt: Date
    let location: String
    let locationId: Int
    let name: String
    let description: String
}

enum EventError: Error {
    case initializingError(String, Any)
}

extension Event {
    init() {
        self.id = Int.max
        self.startAt = Date()
        self.endAt = Date()
        self.location = ""
        self.locationId = Int.max
        self.name = ""
        self.description = ""
    }
}

extension Event {
    init(json: [String: Any]) throws {
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
        guard let locationId = json["locationid"] as? Int else {
            throw EventError.initializingError("locationid is missing.", json)
        }
        guard let name = json["name"] as? String else {
            throw EventError.initializingError("name is missing.", json)
        }
        guard let description = json["description"] as? String else {
            throw EventError.initializingError("description is missing.", json)
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sss'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "PST")
        let startAtDate = dateFormatter.date(from: startAtString)!
        let endAtDate = dateFormatter.date(from: endAtString)!
        
        self.id = id
        self.startAt = startAtDate
        self.endAt = endAtDate
        self.location = location
        self.locationId = locationId
        self.name = name
        self.description = description
    }
}
