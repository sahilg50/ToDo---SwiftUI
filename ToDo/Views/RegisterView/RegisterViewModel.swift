//
//  RegisterViewModel.swift
//  Landmarks
//
//  Created by Sahil Gupta on 18/03/25.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    // Registers the user
    func register() {
        errorMessage = ""

        guard validate() else { return }
        
        // Asynchronously tries to create the user. This avoids UI from freezing
        Task {
            do {
                let result = try await Auth.auth().createUser(withEmail: email, password: password)
                
                let userId = result.user.uid
                insertUserRecord(ID: userId)
                
                print("User created successfully: \(userId)")
                
            } catch {
                print("Error creating user: \(error.localizedDescription)")
            }
        }
    }
    
    // Inserts the user record into firestore DB
    private func insertUserRecord(ID: String){
        let newUser = User(ID: ID, name: name, email: email, joined: Date())
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(ID)
            .setData(newUser.asDictionary())
        
    }
    
    // Validates the registration details
    private func validate() -> Bool {
    
        guard
            !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        else {
            errorMessage = "Please fill in all the fields!"
            return false
        }
        
        guard email.contains("@") && email.contains(".")
        else {
            errorMessage = "Invalid email format!"
            return false
        }
        
        guard password.count >= 6
        else {
            errorMessage = "Password must be at least 6 characters long!"
            return false
        }
        
        return true
    }
}
