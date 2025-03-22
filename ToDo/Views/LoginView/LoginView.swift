//
//  LoginView.swift
//  Landmarks
//
//  Created by Sahil Gupta on 18/03/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewMOdel
        
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(
                    title: "To Do List",
                    subTitle: "Get Things Done",
                    backgroundColor: Color(white: 0.9)
                )
                
                // Login Form
                Form {
                    TextField("Email Address", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButtonView(title: "Log In", backgrundColor: Color.blue) {
                        // Attempt log in
                    }
                    
                }
                
                
                // Create Account
                VStack {
                    Text("New aroud here?")
                    NavigationLink(
                        "Create an account",
                        destination: RegisterView()
                    )
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
