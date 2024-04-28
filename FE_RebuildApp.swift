//
//  FE_RebuildApp.swift
//  FE_Rebuild
//
//  Created by Jaden Alesi on 4/1/24.
//

import SwiftUI
import FirebaseCore

@main
struct FE_RebuildApp: App {
    
    init()
    {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
