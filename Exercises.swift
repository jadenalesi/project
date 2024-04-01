//
//  Exercises.swift
//  FE_Rebuild
//
//  Created by Jaden Alesi on 4/1/24.
//

import Foundation

public class Exercise {
    var name: String?
    var sets = 0
    var reps = 0
}

public class Workout {
    var name: String?
    var exercises = [Exercise()]
}
