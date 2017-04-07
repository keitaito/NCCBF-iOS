//
//  NCCBF_iOSUITests.swift
//  NCCBF-iOSUITests
//
//  Created by Keita Ito on 4/3/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import XCTest

class NCCBF_iOSUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Reset UserDefaults.
        let domainName = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domainName)
        
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        sleep(3)
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Events"].tap()
        snapshot("01EventCatalogScene")
        
        let tablesQuery = app.tables
        tablesQuery.children(matching: .cell).element(boundBy: 0).staticTexts["San Francisco Taiko Dojo"].tap()
        snapshot("02EventDetailsScene")
        
        app.navigationBars["San Francisco Taiko Dojo"].buttons["Events"].tap()
        
        tabBarsQuery.buttons["Schedule"].tap()
        snapshot("03ScheduleScene")
        
        tabBarsQuery.buttons["Map"].tap()
        app.otherElements["Peace Plaza Stage"].tap()
        snapshot("04MapScene")
        
        tabBarsQuery.buttons["More"].tap()
    }
    
}
