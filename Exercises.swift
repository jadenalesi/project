//
//  Exercises.swift
//  FE_Rebuild
//
//  Created by Jaden Alesi on 4/1/24.
//

import Foundation

public class Exercise: Identifiable {
    var name:String = ""
    var sets = 0
    var reps = 0
}

public class Workout: Identifiable {
    var name:String = ""
    var exercises = [Exercise()]
}

func CreateNewWorkout(workName: String) -> Workout {
    let newWorkout = Workout()
    newWorkout.name = workName
    return newWorkout
}