//
//  EventModelTests.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/28/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import XCTest
@testable import NCCBF_iOS

class EventModelTests: XCTestCase {
    
    func testCreatingEventModel() {
        // given
        let dataController = DataController()
        let container = dataController.persistentContainerInMemory
        let context = container.viewContext
        
        let name = "SF Taiko Dojo"
        let imagename = "SF Taiko Dojo"
        let url = "www.sftaiko.com"
        let id = 1
        let location = "Peace Plaza Stage"
        let startat = "2017-04-08T19:00:00.000Z"
        let endat = "2017-04-08T19:45:00.000Z"
        let details = "Grandmaster Seiichi Tanaka founded the San Francisco Taiko Dojo in 1968 and introduced the taiko art form to America. Over the years, Grandmaster Tanakaâ€™s students have traveled around the globe, forming new taiko ensembles and establishing taiko as an art form. San Francisco Taiko Dojo remains the most exciting and dynamic taiko group in the world. Grandmaster Tanakaâ€™s style has developed the taiko from a primitive folk art to a powerful, sophisticated synthesis of rhythm, harmony and body movements."
        
        let testJSON: [String : Any] = ["name": name,
                        "imagename": imagename,
                        "url": url,
                        "id": id,
                        "location": location,
                        "startat": startat,
                        "endat": endat,
                        "details": details
                        ]
        
        let dateFormatter = DateFormatter.eventScheduleJSONDateFormatter
        let startatDate = dateFormatter.date(from: startat)
        let endatDate = dateFormatter.date(from: endat)
        
        // when
        do {
            let event = try Event(json: testJSON, context: context)
            XCTAssertNotNil(event)
            XCTAssertEqual(event.name, name)
            XCTAssertEqual(event.imageName, imagename)
            XCTAssertEqual(event.url, url)
            XCTAssertEqual(event.id, id)
            XCTAssertEqual(event.location, location)
            XCTAssertEqual(event.startAt, startatDate)
            XCTAssertEqual(event.endAt, endatDate)
            XCTAssertEqual(event.details, details)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
