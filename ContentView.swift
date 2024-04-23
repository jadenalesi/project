//
//  ContentView.swift
//  FE_Rebuild
//
//  Created by Jaden Alesi on 4/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var active:Bool = false
    @State var isLoggedIn:Bool = false
    @State var isSignedUp: Bool = false
    
    var body: some View {
        if !active
        {
            Splash_Screen_View(active: $active)
        }
        else if !isLoggedIn
        {
            Login_Signup_View(isLoggedIn: $isLoggedIn)
        }
        else if !isSignedUp && !isLoggedIn
        {
            Signup_View(isSignedUp: $isSignedUp)
        }
        else if isSignedUp && !isLoggedIn
        {
            Login_Signup_View(isLoggedIn: $isLoggedIn)
        }
        else
        {
            MainContentView()
        }
    }
}

struct MainContentView: View {
    @State private var isLoggedIn = true
    
    var body: some View {
        VStack {
            TabView {
                WorkoutView()
                    .tabItem{
                        Label("Workout",systemImage:"dumbbell")
                            .padding()
                    }
                CalendarView()
                    .tabItem {
                        Label("Calendar",systemImage: "calendar")
                            .padding()
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings",systemImage: "gear")
                            .padding()
                    }
                
            }
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.backgroundColor = UIColor(Color.purple.opacity(0.2))
                appearance.shadowColor = UIColor(.purple)
                appearance.backgroundEffect = UIBlurEffect(style: .extraLight)
                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
    }
}

#Preview {
    MainContentView()
}
