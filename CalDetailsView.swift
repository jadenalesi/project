//
//  CalDetailsView.swift
//  FE_Rebuild
//
//  Created by Jaden Alesi on 4/2/24.
//

import SwiftUI

struct CalDetailsView: View {
    let checkDate: Date
    @State var newSelection = UUID()
    @State var hasWorkout = Bool()
    @State var exerciseList = [Exercise]()
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Your Exercises")
            }
            .onAppear {
                for workout in masterWorkouts {
                    if (workout.day == checkDate) {
                        exerciseList = workout.exercises
                        break
                    }
                    else if (workout.repeating){
                        for i in 1...52{
                            if (checkDate == workout.day + TimeInterval(i*604800)){
                                exerciseList = workout.exercises
                                break
                            }
                        }
                    }
                }
            }
            VStack {
                List {
                    ForEach (exerciseList) { exercise in
                        HStack {
                            Text(exercise.name + ": \(exercise.sets)x\(exercise.reps)")
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    CalDetailsView()
//}
