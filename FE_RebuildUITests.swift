//
//  FE_RebuildUITests.swift
//  FE_RebuildUITests
//
//  Created by Jaden Alesi on 4/2/24.
//

import XCTest
import SwiftUI

final class FE_RebuildUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        @State var active = true

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunch() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
    }
    
    func testLoginButton() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Go"].tap()
        app.navigationBars["Your Workouts"].staticTexts["Your Workouts"].tap()
    }
    
    func testAddWorkoutButton() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.buttons["Go"].tap()
        app.navigationBars["Your Workouts"]/*@START_MENU_TOKEN@*/.buttons["Add"]/*[[".otherElements[\"Add\"].buttons[\"Add\"]",".buttons[\"Add\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["Name of Workout"].tap()
        app.buttons["Confirm Add"].tap()
    }
    
    func testNavCalendar() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Go"].tap()
        app.tabBars["Tab Bar"].buttons["Workout"].tap()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
    
    }
    func testRemoveWorkout() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Go"].tap()
        app.navigationBars["Your Workouts"].staticTexts["Your Workouts"].tap()
        let workoutToDelete = app.tables.cells.element(boundBy: 0)
        workoutToDelete.swipeLeft()
        app.buttons["Delete"].tap()
    }
    
    func testRemoveExercise() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Go"].tap()
        app.navigationBars["Your Workouts"].staticTexts["Your Workouts"].tap()
        let workoutCell = app.tables.cells.element(boundBy: 0)
        workoutCell.tap()
        let exerciseToDelete = app.tables.cells.element(boundBy: 0)
        exerciseToDelete.swipeLeft()
        app.buttons["Delete"].tap()
    }




    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
