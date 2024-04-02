//
//  ExercisesView.swift
//  FE_Rebuild
//
//  Created by Jaden Alesi on 4/1/24.
//

import SwiftUI

struct ExercisesView: View {
    @State var multiSelect = Set<UUID>()
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
                            masterExercises.append(CreateNewExercise(exName: newExerciseName, exSets: newExerciseSets, exReps: newExerciseReps))
                            newExerciseName = ""
                            newExerciseSets = 1
                            newExerciseReps = 1
                        }) {
                            Text("Add Exercise")
                        }
                    }
                    Section{
                        List(selection: $multiSelect){
                            ForEach(masterExercises){ exercise in
                                HStack {
                                    Text(exercise.name)
                                }
                            }
                        }
                        .toolbar {EditButton()}
                    }
                    Section{
                        Button(action: {
                            print("Workout Updated")
                            
                        }) {
                            Text("Update Workout")
                        }
                    }
                    Divider()
                }
            }
        }
    }
}

#Preview {
    ExercisesView()
}
