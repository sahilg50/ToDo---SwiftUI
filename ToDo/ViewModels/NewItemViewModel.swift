//
//  NewItemViewModel.swift
//  Landmarks
//
//  Created by Sahil Gupta on 18/03/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    
    init() {}
    
    // Saves the new to-do item
    func save() {
        guard canSave else { return }
        
        // Get current user id
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        // Create Model
        let itemId = UUID().uuidString
        let newItem = ToDoListItemModel(id: itemId,
                                   title: title,
                                   dueDate: dueDate,
                                   createdDate: Date(),
                                   isDone: false)
        
        // Save Model
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(itemId)
            .setData(newItem.asDictionary())
    }
    
    // Validates if all the details for to-do item is saved
    var canSave: Bool {
        if(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) { return false }
        
        if(dueDate <= Date().addingTimeInterval(-60 * 60 * 24)) { return false }
        
        return true
    }
}
