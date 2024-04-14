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
    let workout: Workout
    
    var body: some View {
        NavigationView
        {
            VStack
            {
                List
                {
                    ForEach(workout.exercises)
                    {exercise in
                        HStack
                        {
                            Text(exercise.name)
                            
                            NavigationLink
                            {
                                ExDetails(exercise: exercise)
                            }
                        label:{}
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.large)
                .navigationTitle(workout.name)
                .navigationBarItems(trailing: Button(action: {addExerciseSheetShowing.toggle()}, label: {Image(systemName: "plus")}))
                
                .sheet(isPresented: $addExerciseSheetShowing)
                {
                    VStack{
                            TextField("Name of Exercise", text: $newExercise)
                                .padding()
                            
                            Stepper("Sets: \(newExerciseSets)", value: $newExerciseSets)
                                .padding()
                        
                            Stepper("Reps: \(newExerciseReps)",value: $newExerciseReps)
                                .padding()
                        
                            Button(action: {AddingExercise()}, label: {Text("Add")})
                                .padding()
                    }
                    .presentationDetents([.fraction(0.50)])
                }
                
            }
        }
    }
    func AddingExercise()
    {
        guard newExercise.count > 0 else {return}
        
        masterExercises.append(CreateNewExercise(exName: newExercise, exSets: newExerciseSets, exReps: newExerciseReps))
        workout.exercises.append(CreateNewExercise(exName: newExercise, exSets: newExerciseSets, exReps: newExerciseReps))
        
        addExerciseSheetShowing.toggle()
        
        newExercise = ""
        newExerciseReps = 1
        newExerciseSets = 1
    }
}

//#Preview {
//    ExercisesView()
//}
