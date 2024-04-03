//
//  Splash_Screen_View.swift
//  Flow_Exercise_1
//
//  Created by Grant Harsch on 2/29/24.
//

import SwiftUI

/*
 Task of Splash_Screen_View:
    This view is our splash screen for Flow Exercise. This view is essentially only present for the amount of time it takes the signin/signup view to finish loading.
    We have made 3 variables which are used in the simple animation.
    Basically, if the signin/signup view is active we go there. If not we play a simple animation for the splash screen and once the animation is over we make the signin/signup view active.
 */

struct Splash_Screen_View: View {
    @Binding var active: Bool
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State var isLoggedIn: Bool = false
    
    var body: some View {
            ZStack
            {
                
                Color(red: 0.09186466783, green: 0.0820229426, blue: 0.5)
                    .ignoresSafeArea()
                VStack{
                    VStack
                    {
                        Image("Flow_Exersize_Logo_Large")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.all)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear
                    {
                        withAnimation(.easeIn(duration: 1.0))
                        {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
            }
            
            .onAppear
            {
                DispatchQueue.main.asyncAfter(deadline: .now() + 6.0)
                {
                    withAnimation(.easeOut(duration: 0.5))
                    {
                        active = true
                    }
                }
            }
        }
    }

//#Preview {
 //   Splash_Screen_View()
//}
