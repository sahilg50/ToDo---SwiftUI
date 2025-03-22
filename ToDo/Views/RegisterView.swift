//
//  RegisterView.swift
//  Landmarks
//
//  Created by Sahil Gupta on 18/03/25.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Spacer().frame(height: 80)
            
            Text("Almost There!")
                .font(.system(size: 50))
                .foregroundColor(.white)
                .bold()
            
            
            Form {
                TextField("Full Name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Email Address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButtonView(title: "Create Account", backgrundColor: Color.blue) {
                    
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
