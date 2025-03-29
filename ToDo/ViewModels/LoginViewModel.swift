//
//  LoginViewModel.swift
//  Landmarks
//
//  Created by Sahil Gupta on 18/03/25.
//

import FirebaseAuth
import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    // Logs-in with email and password
    func login() {
        guard validate() else { return }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    // Validates the login details
    private func validate() -> Bool {
        errorMessage = ""
        
        guard
            !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        else {
            errorMessage = "Email or password is empty"
            return false
        }
        
        guard
            email.contains("@") && email.contains(".")
        else {
            errorMessage = "Please enter a valid email address."
            return false
        }
        
        return true
    }
}

