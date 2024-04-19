//
//  FE_RebuildTests.swift
//  FE_RebuildTests
//
//  Created by Jaden Alesi on 4/2/24.
//

import XCTest
@testable import FE_Rebuild

final class FE_RebuildTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWorkoutCreation() throws {
        let currDate = Date()
        let newWorkout = CreateNewWorkout(workName: "Test", workDay: currDate)
        XCTAssertEqual(newWorkout.name, "Test")
        XCTAssertEqual(newWorkout.day, currDate)
    }
    
    func testExerciseCreation() throws {
        let newExercise = CreateNewExercise(exName: "Test", exSets: 1, exReps: 2)
        XCTAssertEqual(newExercise.name, "Test")
        XCTAssertEqual(newExercise.sets, 1)
        XCTAssertEqual(newExercise.reps, 2)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
