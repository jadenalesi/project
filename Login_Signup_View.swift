//
//  Login_Signin_View.swift
//  Flow_Exercise_1
//
//  Created by Grant Harsch on 2/29/24.
//

import SwiftUI

/*
 Here we have our Login/Signup view which is simply how we get to 2 different views (Login_View and Signup_View). This is done through a navigation view and links that take you to the other views.
 */

struct Login_Signup_View: View {
    @State private var username = ""
    @State private var password = ""
    @State private var opacity = 0.4
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationStack{
            ZStack
            {
                VStack
                {
                    
                    Text("Login:")
                        .foregroundColor(.black)
                        .padding([.top, .leading, .trailing])
                        .font(.title)
                    HStack
                    {
                        VStack
                        {
                            TextField("Username", text: $username)
                                .frame(width: 200, height: 30)
                                .textFieldStyle(.roundedBorder)
                                .disableAutocorrection(true)
                                .cornerRadius(5)
                                .padding()
                            
                            TextField("Password", text: $password)
                                .frame(width: 200, height: 30)
                                .textFieldStyle(.roundedBorder)
                                .disableAutocorrection(true)
                                .cornerRadius(5)
                                .padding()
                        }
                        Button
                        {
                            isLoggedIn = true
                        }label: {
                            Text("Go")
                                .foregroundColor(.white)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                        .frame(width: 70, height: 50)
                        .background(Color(.blue))
                        .cornerRadius(25)
                    }
                    Text("Don't have an account?")
                        .foregroundColor(.black)
                        .padding([.top, .leading, .trailing])
                        .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    
                    NavigationLink
                    {
                        Signup_View()
                            .navigationBarBackButtonHidden(true)
                    }label: {
                        Text("Signup")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    .padding(.all)
                    .background(Color(.blue))
                    .cornerRadius(25)
                }
            }
        }
    }
}

//#Preview {
//    Login_Signup_View()
//}
