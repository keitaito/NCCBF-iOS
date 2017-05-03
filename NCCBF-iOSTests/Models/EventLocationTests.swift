//
//  EventLocationTests.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 5/2/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import XCTest
@testable import NCCBF_iOS

class EventLocationTests: XCTestCase {
    
    func testCreatingEventLocation() {
        
        var locationName = ""
        var eventLocation: EventLocation
        
        locationName = "Hokka Nichibei Kai"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "Hotel Kabuki Sakura Room"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "JCCCNC"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "JCCCNC - Classroom One"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "JCCCNC - Classroom Two"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "JCCCNC - Gym"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "JCCCNC - Issei Memorial Hall"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "Kabuki Cinemas"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "Kinokuniya Bookstore"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "Konko Church"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "National JACL Building"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "National Japanese American Historical Society"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "New People"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "Peace Plaza Stage"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "Post & Buchanan"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "Sakura 360"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "Sakura 360 Stage"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "Sequoias Auditorium"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "Tateuchi Auditorium"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "Union Bank Community Room"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "Webster Street Stage"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, locationName)
        
        locationName = "foo"
        eventLocation = EventLocation(locationName: locationName)
        XCTAssertEqual(eventLocation.name, "Japantown")
    }
}
