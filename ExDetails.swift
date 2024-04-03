//
//  ExDetails.swift
//  FlowUpdated
//
//  Created by Grant Harsch on 4/2/24.
//

import SwiftUI

struct ExDetails: View {
    let exercise: Exercise
    
    var body: some View {
        Text("Name: " + exercise.name)
        Text("Reps: " + "\(exercise.reps)")
        Text("Sets: " + "\(exercise.sets)")
    }
}
//#Preview {
//    ExDetails()
//}
