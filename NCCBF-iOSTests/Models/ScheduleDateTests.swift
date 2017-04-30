//
//  ScheduleDateTests.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/29/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import XCTest
@testable import NCCBF_iOS

class ScheduleDateTests: XCTestCase {
    
    func testScheduleDate() {
        // given
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let apr8Date = dateFormatter.date(from: "2017-04-08")!
        let apr9Date = dateFormatter.date(from: "2017-04-09")!
        let apr10Date = dateFormatter.date(from: "2017-04-10")!
        let apr15Date = dateFormatter.date(from: "2017-04-15")!
        let apr16Date = dateFormatter.date(from: "2017-04-16")!
        let apr17Date = dateFormatter.date(from: "2017-04-17")!
        
        let apr8 = ScheduleDate.apr8
        let apr9 = ScheduleDate.apr9
        let apr10 = ScheduleDate.apr10
        let apr15 = ScheduleDate.apr15
        let apr16 = ScheduleDate.apr16
        let apr17 = ScheduleDate.apr17
        
        XCTAssertEqual(apr8.date, apr8Date)
        XCTAssertEqual(apr9.date, apr9Date)
        XCTAssertEqual(apr10.date, apr10Date)
        XCTAssertEqual(apr15.date, apr15Date)
        XCTAssertEqual(apr16.date, apr16Date)
        XCTAssertEqual(apr17.date, apr17Date)
    }
}
