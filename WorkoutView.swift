//
//  WorkoutView.swift
//  FE_Rebuild
//
//  Created by Jaden Alesi on 4/1/24.
//

import SwiftUI

struct WorkoutView: View {
    @State public var newWorkout = ""
    var body: some View {
        VStack{
            NavigationView{
                List {
                    Section {
                        TextField("Add New Workout", text: $newWorkout)
                            .keyboardType(.default)
                            .onSubmit {
                                masterWorkouts.append(CreateNewWorkout(workName: newWorkout))
                            }
                    }
                    Section {
                        ForEach(masterWorkouts) { workout in
                            HStack {
                                Text(workout.name)
                                NavigationLink{
                                    ExercisesView()
                                }
                            label:{}
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    WorkoutView()
}
