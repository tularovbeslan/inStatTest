//
//  inStatTestUITests.swift
//  inStatTestUITests
//
//  Created by BESLAN TULAROV on 04.04.17.
//  Copyright © 2017 BESLAN TULAROV. All rights reserved.
//

import XCTest

class inStatTestUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSelectingTeam() {
        let app = XCUIApplication()
        let zenitButton = app.segmentedControls.buttons["Zenit"]
        zenitButton.tap()
        
        let krasnodarButton = app.segmentedControls.buttons["Krasnodar"]
        krasnodarButton.tap()
        zenitButton.tap()
    }
    
    func testSorting() {
        let tablesQuery = XCUIApplication().tables
        let tablesQuery2 = tablesQuery
        sleep(1)
        tablesQuery2.buttons["Player"].tap()
        sleep(1)
        tablesQuery2.buttons["Total distance"].tap()
        sleep(1)
        tablesQuery2.buttons["Average speed"].tap()
        sleep(1)
        tablesQuery2.buttons["Minutes played"].tap()
        sleep(1)
        tablesQuery2.buttons["InStat Index"].tap()
    }
    
}
