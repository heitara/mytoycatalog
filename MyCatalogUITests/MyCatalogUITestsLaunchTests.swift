//
//  MyCatalogUITestsLaunchTests.swift
//  MyCatalogUITests
//
//  Created by Emil Atanasov on 10/15/24.
//

import XCTest

final class MyCatalogUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        // Lock the orientation to portrait
        XCUIDevice.shared.orientation = .portrait
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    @MainActor
    func testClickOnFirstItem() throws {
//        let app = XCUIApplication()
//        app.launch()
//        
//        // Ensure the list is visible
//        XCTAssertTrue(app.tables.firstMatch.exists, "The list is not visible.")
//
//        // Click on the first item in the list
//        let firstItem = app.tables.cells.firstMatch
//        XCTAssertTrue(firstItem.exists, "The first item in the list does not exist.")
//        firstItem.tap()
//
//        // Wait for a moment (you can adjust the time as needed)
//        sleep(2) // Note: In production tests, use XCTest expectations instead of sleep
//
//        // Validate that a specific string is visible on the screen
//        let expectedString = "Expected String" // Replace with the actual string you're looking for
//        let stringExists = app.staticTexts[expectedString].exists
//        
//        XCTAssertTrue(stringExists, "The expected string '\(expectedString)' is not visible on the screen.")
    }
}
