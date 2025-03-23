//
//  LoginViewModel.swift
//  Landmarks
//
//  Created by Sahil Gupta on 18/03/25.
//

import FirebaseAuth
import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else { return }
        
        // Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
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
