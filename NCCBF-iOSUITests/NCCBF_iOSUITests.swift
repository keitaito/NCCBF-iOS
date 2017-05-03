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
        
        
        
        // Events
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Events"].tap()
        snapshot("01EventCatalogScene")
        
        let tablesQuery = app.tables
        tablesQuery.children(matching: .cell).element(boundBy: 0).staticTexts["San Francisco Taiko Dojo"].tap()
        snapshot("02EventDetailsScene")
        
        app.navigationBars["San Francisco Taiko Dojo"].buttons["Events"].tap()
        
        
        
        // Schedule
        tabBarsQuery.buttons["Schedule"].tap()
        snapshot("03ScheduleScene")
        
        app.segmentedControls.buttons["Apr 9"].tap()
        app.segmentedControls.buttons["Apr 15"].tap()
        app.segmentedControls.buttons["Apr 16"].tap()
        app.segmentedControls.buttons["Apr 8"].tap()
        let scheduleTablesQuery = app.tables
        scheduleTablesQuery.children(matching: .cell).element(boundBy: 0).staticTexts["Games with Robbie"].tap()
        app.navigationBars["Games with Robbie"].buttons["Schedule"].tap()
        
        
        
        // Map
        tabBarsQuery.buttons["Map"].tap()
        app.otherElements["Peace Plaza Stage"].tap()
        snapshot("04MapScene")
        
        app.buttons["More Info"].tap()
        let mapTablesQuery = app.tables
        mapTablesQuery.cells.staticTexts["Children's Tsuzumi"].tap()
        app.navigationBars["Children's Tsuzumi"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        
        
        // More
        tabBarsQuery.buttons["More"].tap()
        tablesQuery.cells.staticTexts["Facebook"].tap()
        app.buttons["Done"].tap()
        tablesQuery.cells.staticTexts["Twitter"].tap()
        app.buttons["Done"].tap()
        tablesQuery.cells.staticTexts["Instagram"].tap()
        app.buttons["Done"].tap()
        tablesQuery.cells.staticTexts["About"].tap()
        app.navigationBars["About"].buttons["More"].tap()
        tablesQuery.cells.staticTexts["Copyright"].tap()
        app.navigationBars["Copyright"].buttons["More"].tap()
        tablesQuery.cells.staticTexts["Licenses"].tap()
        app.navigationBars["Licenses"].buttons["More"].tap()
    }
    
}
