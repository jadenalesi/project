//
//  ExercisesView.swift
//  FE_Rebuild
//
//  Created by Jaden Alesi on 4/1/24.
//

import SwiftUI

struct ExercisesView: View {
    @State var multiSelect = Set<UUID>()
    @State var newExercise = ""
    @State var newExerciseSets = 1
    @State var newExerciseReps = 1
    @State var addExerciseSheetShowing: Bool = false
    @State var doUpdate: Bool = false
    
    let workout: Workout
   
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(workout.exercises) { exercise in
                        HStack {
                            Text(exercise.name)
                            NavigationLink(destination: ExDetails(exercise: exercise, currWorkout: workout)) {
                                EmptyView() // Empty label to make whole row tappable
                            }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.large)
                .navigationTitle(workout.name)
                .navigationBarItems(trailing: HStack {
                    Button(action: { addExerciseSheetShowing.toggle() }) {
                        Image(systemName: "plus")
                    }
                    Button(action: { RemoveWorkout(workoutToDelete: workout);doUpdate = true }) {
                        Image(systemName: "trash")
                    }
                    .alert("Workout removed. You may leave this screen.", isPresented: $doUpdate) {
                        Button("Ok", role: .cancel) {}
                    }
                })
                .sheet(isPresented: $addExerciseSheetShowing) {
                    VStack {
                        TextField("Name of Exercise", text: $newExercise)
                            .padding()
                       
                        Stepper("Sets: \(newExerciseSets)", value: $newExerciseSets)
                            .padding()
                       
                        Stepper("Reps: \(newExerciseReps)",value: $newExerciseReps)
                            .padding()
                       
                        Button(action: { AddingExercise() }) {
                            Text("Add")
                        }
                        .padding()
                    }
                    .presentationDetents([.fraction(0.50)])
                }
            }
        }
        .onAppear {
            newExercise = "H"
            newExercise = ""
        }
    }
    func AddingExercise() {
        guard newExercise.count > 0 else { return }
       
        masterExercises.append(CreateNewExercise(exName: newExercise, exSets: newExerciseSets, exReps: newExerciseReps))
        workout.exercises.append(CreateNewExercise(exName: newExercise, exSets: newExerciseSets, exReps: newExerciseReps))
       
        addExerciseSheetShowing.toggle()
       
        newExercise = ""
        newExerciseReps = 1
        newExerciseSets = 1
    }
}
func RemoveWorkout(workoutToDelete: Workout) {
    if let index = masterWorkouts.firstIndex(where: { $0.name == workoutToDelete.name }) {
        masterWorkouts.remove(at: index)
    }
}

class ExerciseList: ObservableObject {
    
}
//#Preview {
//    ExercisesView()
//}
