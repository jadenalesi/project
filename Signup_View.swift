//
//  Signup_View.swift
//  exercise_home
//
//  Created by Karen Harsch on 3/6/24.
//

import SwiftUI
import FirebaseAuth

struct Signup_View: View {
    @State private var email = ""
    @State private var password = ""
    @State private var arrowSize = 0.3
    @Binding var inSign: Bool
    
    var body: some View {
        NavigationStack
        {
            ZStack{
                VStack
                {
                    Text("Hello, welcome to Flow Exercise!")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding([.top, .leading, .trailing])
                        .foregroundColor(.black)
                    
                    Text("Create your account below by entering an email and password.")
                        .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom, .trailing])
                        .foregroundColor(.black)
                    

                    TextField("New Username", text: $username)

                    TextField("New Username", text: $email)

                        .frame(width: 200, height: 35)
                        .textFieldStyle(.roundedBorder)
                        .disableAutocorrection(true)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    
                    TextField("New Password", text: $password)
                        .frame(width: 200, height: 35)
                        .disableAutocorrection(true)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .textFieldStyle(.roundedBorder)
                    Button
                    {

                        inSign = false

                        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                            
                            if let error = error
                            {
                                email = ""
                                password = ""
                                return
                            }
                            
                            if let authResult = authResult
                            {
                                inSign = false
                            }
                        }
                        

                    }label: {Text ("Sign up")}
                        .foregroundColor(.white)
                        .frame(width: 80, height: 50)
                        .background(Color(.blue))
                        .cornerRadius(25)
                }
            }
        }
    }
}


//#Preview {
//    Signup_View()
//}
