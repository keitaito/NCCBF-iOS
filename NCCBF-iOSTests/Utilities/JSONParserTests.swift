//
//  JSONParserTests.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/29/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import XCTest
@testable import NCCBF_iOS

class JSONParserTests: XCTestCase {
    
    func testParsingJSON() {
        let context = DataController().persistentContainerInMemory.viewContext
        let json = TestHelper.jsonFromBundle()
        
        do {
            let events = try JSONParser.parse(json: json, context: context)
            XCTAssertNotNil(events)
            XCTAssertEqual(events.count > 0, true)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
