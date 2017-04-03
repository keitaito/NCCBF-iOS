//
//  EventDetailsViewModel.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/5/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

struct EventDetailsViewModel {
    
    // MAKR: - Public properties
    
    public var name: String {
        return event.name
    }
    
    public var details: String? {
        return event.details
    }
    
    public var startAt: String {
        return startTimeDateFormatter.string(from: event.startAt)
    }
    
    public var endAt: String? {
        guard let endAt = event.endAt else { return nil }
        return endTimeDateFormatter.string(from: endAt)
    }
    
    public var schedule: String {
        let df = DateFormatter()
        df.dateFormat = "h:mm a"
        df.timeZone = TimeZone(abbreviation: "PDT")
        let endAtString = endAt ?? "all day"
        return "\(startAt) - \(endAtString)"
    }
    
    public var location: String {
        return event.location
    }
    
    public var imageName: String? {
        return event.imageName
    }
    
    // MARK: - Private properties
    
    private let event: Event
    
    private var startTimeDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "PDT")
        return dateFormatter
    }
    
    private var endTimeDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "PDT")
        return dateFormatter
    }
    
    // MARK: - Initialization
    
    init(event: Event) {
        self.event = event
    }
}
