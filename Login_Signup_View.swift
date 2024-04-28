//
//  Login_Signin_View.swift
//  Flow_Exercise_1
//
//  Created by Grant Harsch on 2/29/24.
//

import SwiftUI
import FirebaseAuth

/*
 Here we have our Login/Signup view which is simply how we get to 2 different views (Login_View and Signup_View). This is done through a navigation view and links that take you to the other views.
 */
struct Login_Signup_View: View {
    @State private var email = ""
    @State private var password = ""
    @State private var opacity = 0.4
    @Binding var isLoggedIn: Bool
    @Binding var enteringSign: Bool
    
    var body: some View {
        NavigationStack{
            ZStack
            {
                VStack
                {
                    
                    Text("Login")
                        .foregroundColor(.black)
                        .padding([.top, .leading, .trailing])
                        .font(.title)
                    VStack
                    {

                        TextField("Username", text: $username)

                        TextField("Username", text: $email)

                            .frame(width: 200, height: 30)
                            .textFieldStyle(.roundedBorder)
                            .disableAutocorrection(true)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .cornerRadius(5)
                        
                        TextField("Password", text: $password)
                            .frame(width: 200, height: 30)
                            .textFieldStyle(.roundedBorder)
                            .disableAutocorrection(true)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .cornerRadius(5)
                        
                        Button
                        {
                            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                                if let error = error{
                                    email = ""
                                    password = ""
                                    print(error)
                                    return
                                }
                                
                                else
                                {
                                    isLoggedIn = true
                                }
                            }
                        }label: {
                            Text("Login")
                                .foregroundColor(.white)
                                .frame(width: 80, height: 50)
                        }
                        .background(Color(.blue))
                        .cornerRadius(25)
                    }
                    Text("Don't have an account?")
                        .foregroundColor(.black)
                        .padding([.top, .leading, .trailing])
                        .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    
                    Button
                    {
                        enteringSign = true
                    }label: {
                        Text("Signup")
                            .foregroundColor(.white)
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
