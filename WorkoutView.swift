//
//  WorkoutView.swift
//  FE_Rebuild
//
//  Created by Jaden Alesi on 4/1/24.
//

import SwiftUI

struct WorkoutView: View {
    @State public var newWorkout = ""
    @State public var workouts = Array<Workout>()
    var body: some View {
        VStack{
            List {
                Section {
                    TextField("Add New Workout", text: $newWorkout)
                        .keyboardType(.default)
                        .onSubmit {
                            workouts.append(CreateNewWorkout(workName: newWorkout))
                        }
                }
                Section {
                    ForEach(workouts) { workout in
                        HStack {
                            Text(workout.name)
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
