//
//  LoginView.swift
//  Landmarks
//
//  Created by Sahil Gupta on 18/03/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
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
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButtonView(title: "Log In", backgroundColor: Color.blue) {
                        viewModel.login()
                    }
                    
                    // If the login details are empty then pop-up an error message
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                }
            
                // Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink(
                        "Create an account",
                        destination: RegisterView()
                    )
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    LoginView()
}
