//
//  ExercisesView.swift
//  FE_Rebuild
//
//  Created by Jaden Alesi on 4/1/24.
//

import SwiftUI

struct ExercisesView: View {
    @State var newExerciseName = ""
    @State var newExerciseSets = 1
    @State var newExerciseReps = 1
    var body: some View {
        NavigationView{
            VStack{
                Section{
                    Form{
                        TextField(text: $newExerciseName, prompt: Text("Exercise Name")) {
                            Text("Exercise Name")
                        }
                        Stepper("Sets: \(newExerciseSets)", value: $newExerciseSets)
                        Stepper("Reps: \(newExerciseReps)",value:$newExerciseReps)
                        Button(action: {
                            print("Exercise Added")
                            newExerciseName = ""
                            newExerciseSets = 1
                            newExerciseReps = 1
                            masterExercises.append(CreateNewExercise(exName: newExerciseName, exSets: newExerciseSets, exReps: newExerciseReps))
                        }) {
                            Text("Add Exercise")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ExercisesView()
}
