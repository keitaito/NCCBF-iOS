//
//  EventDetailsViewModelTests.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/29/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import XCTest
@testable import NCCBF_iOS

class EventDetailsViewModelTests: XCTestCase {
    
    func testCreatingEventDetailsViewModel() {
        let context = DataController().persistentContainerInMemory.viewContext
        let json = TestHelper.jsonFromBundle()
        
        do {
            let events = try JSONParser.parse(json: json, context: context)
            let event = events.first!
            let eventDetailsViewModel = EventDetailsViewModel(event: event)
            
            XCTAssertEqual(eventDetailsViewModel.name, event.name)
            XCTAssertEqual(eventDetailsViewModel.details, event.details)
            XCTAssertEqual(eventDetailsViewModel.location, event.location)
            XCTAssertEqual(eventDetailsViewModel.imageName, event.imageName)
            XCTAssertEqual(eventDetailsViewModel.url, event.url)
            
            // Date
            let startAtDateFormatter = TestHelper.startTimeDateFormatter
            let startAtDateString = startAtDateFormatter.string(from: event.startAt)
            let endAtDateString = event.endAt?.string ?? "all day"
            let scheduleString = "\(startAtDateString) - \(endAtDateString)"
            
            XCTAssertEqual(eventDetailsViewModel.startAt, startAtDateString)
            XCTAssertEqual(eventDetailsViewModel.endAt, endAtDateString)
            XCTAssertEqual(eventDetailsViewModel.schedule, scheduleString)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
