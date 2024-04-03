//
//  Exercises.swift
//  FE_Rebuild
//
//  Created by Jaden Alesi on 4/1/24.
//

import Foundation

public var masterWorkouts = [Workout]()
public var masterExercises = [Exercise]()

public class Exercise: Identifiable {
    var name: String = ""
    var sets: Int = 0
    var reps: Int = 0
    public var id = UUID()
}

public class Workout: Identifiable {
    var name: String = ""
    var day = Date()
    var exercises = [Exercise()]
}

func CreateNewWorkout(workName: String, workDay: Date) -> Workout {
    let newWorkout = Workout()
    newWorkout.name = workName
    newWorkout.day = workDay
    return newWorkout
}

func CreateNewExercise(exName: String, exSets: Int, exReps: Int) -> Exercise {
    let newExercise = Exercise()
    newExercise.name = exName
    newExercise.sets = exSets
    newExercise.reps = exReps
    return newExercise
}
