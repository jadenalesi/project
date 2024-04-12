//
//  WorkoutView.swift
//  FE_Rebuild
//
//  Created by Jaden Alesi on 4/1/24.
//

import SwiftUI

struct WorkoutView: View {
    @State public var newWorkout: String = ""
    @State public var newWorkoutDay = Date()
    @State public var addWorkoutSheetShowing: Bool = false
    @State public var opacity = 0.4
    var body: some View {
        VStack{
            NavigationStack{
                List {
                    ForEach(masterWorkouts)
                    { workout in
                        HStack
                        {
                            Text(workout.name)
                            
                            NavigationLink
                            {
                                ExercisesView(workout: workout)
                            }
                        label:{}
                        }
                    }
                }
                .navigationTitle("Your Workouts")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {addWorkoutSheetShowing.toggle()},label: {Image(systemName: "plus")}))
            }
        }
        .sheet(isPresented: $addWorkoutSheetShowing)
        {
            ZStack
            {
                Color(.gray)
                    .opacity(opacity)
                    .ignoresSafeArea()
                    .presentationDetents([.fraction(0.30)])
                
                VStack
                {
                    //textfield to add name of workout and then press enter to call AddWorkout
                    TextField("Name of Workout", text: $newWorkout)
                        .padding(.horizontal)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .frame(width: 200)
                        .cornerRadius(10)
                    
                    DatePicker("Select Date", selection: $newWorkoutDay, displayedComponents: [.date])
                        .padding()
                    
                    Button(action: {AddingWorkout()}, label: {Text("Add")})
                        .frame(width: 70, height: 50)
                        .background(Color(.blue))
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
            }
        }
    }
    
    func AddingWorkout()
    {
        guard newWorkout.count > 0 else {return}
        
        masterWorkouts.append(CreateNewWorkout(workName: newWorkout, workDay: newWorkoutDay))
        
        
        addWorkoutSheetShowing.toggle()
        
        newWorkout = ""
    }
}

#Preview {
    WorkoutView()
}
