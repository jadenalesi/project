//
//  ExDetails.swift
//  FlowUpdated
//
//  Created by Grant Harsch on 4/2/24.
//

import SwiftUI

struct ExDetails: View {
    let exercise: Exercise
    let currWorkout: Workout
    
    var body: some View {
        VStack {
            Text("Name: " + exercise.name)
            Text("Reps: " + "\(exercise.reps)")
            Text("Sets: " + "\(exercise.sets)")
            Button("Delete Exercise") {
                RemoveExercise(deleteFrom:currWorkout, exToDelete:exercise)
            }
        }
    }
}
//#Preview {
//    ExDetails()
//}
