//
//  RegisterView.swift
//  Landmarks
//
//  Created by Sahil Gupta on 18/03/25.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            Spacer().frame(height: 80)
            
            Text("Almost There!")
                .font(.system(size: 50))
                .foregroundColor(.white)
                .bold()
            
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .onChange(of: viewModel.name) {
                        print(viewModel.name)
                        viewModel.errorMessage = ""
                    }
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onChange(of: viewModel.email) {
                        print(viewModel.errorMessage)
                        viewModel.errorMessage = ""
                    }
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .onChange(of: viewModel.password) {
                        print(viewModel.password)
                        viewModel.errorMessage = ""
                    }
                
                TLButtonView(title: "Create Account", backgroundColor: Color.blue) {
                    viewModel.register()
                }
                
                // If the registration details are invalid then pop-up an error message
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
