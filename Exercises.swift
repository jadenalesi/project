//
//  Exercises.swift
//  FE_Rebuild
//
//  Created by Jaden Alesi on 4/1/24.
//

import Foundation

public var masterWorkouts = Array<Workout>()
public var masterExercises = Array<Exercise>()

public class Exercise: Identifiable {
    var name:String = ""
    var sets = 0
    var reps = 0
    public var id = UUID()
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

func CreateNewExercise(exName: String, exSets: Int, exReps: Int) -> Exercise {
    let newExercise = Exercise()
    newExercise.name = exName
    newExercise.sets = exSets
    newExercise.reps = exReps
    return newExercise
}
