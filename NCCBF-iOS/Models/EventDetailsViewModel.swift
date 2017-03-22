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
        return dateFormatter.string(from: event.startAt)
    }
    
    public var endAt: String {
        return dateFormatter.string(from: event.endAt)
    }
    
    public var schedule: String {
        let df = DateFormatter()
        df.dateFormat = "h:mm a"
        let endAtString = df.string(from: event.endAt)
        return "\(startAt) - \(endAtString)"
    }
    
    public var location: String {
        return event.location
    }
    
    // MARK: - Private properties
    
    private let event: Event
    
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        return dateFormatter
    }
    
    // MARK: - Initialization
    
    init(event: Event) {
        self.event = event
    }
}
