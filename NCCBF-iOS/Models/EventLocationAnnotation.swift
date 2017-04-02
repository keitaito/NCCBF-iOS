//
//  EventLocationAnnotation.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/1/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation
import MapKit

class EventLocationAnnotation: NSObject, MKAnnotation {
    
    // MARK: - MKAnnotation Protocol Properties
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    // MARK: - Public Properties
    
    var events: [Event]
    var eventLocation: EventLocation
    
    init(events: [Event], eventLocation: EventLocation) {
        self.events = events
        self.eventLocation = eventLocation
        self.coordinate = eventLocation.coordinate
        self.title = eventLocation.name
    }
}
