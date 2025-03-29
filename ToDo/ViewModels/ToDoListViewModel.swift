//
//  ToDoListViewModel.swift
//  Landmarks
//
//  Created by Sahil Gupta on 18/03/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListViewModel: ObservableObject {
    @Published var showingNewItemView: Bool = false
    @Published var toDoListItems: [ToDoListItemModel] = []
    
    private var db = Firestore.firestore()
    let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    // Fetches ToDo list items for the current user
    func fetchItems() {
        
        db.collection("users/\(userId)/todos").addSnapshotListener { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }
            
            self.toDoListItems = documents.map { (queryDocumentSnapshot) -> ToDoListItemModel in
                let data = queryDocumentSnapshot.data()
                
                let title = data["title"] as? String ?? ""
                let isDone = data["isDone"] as? Bool ?? false
                
                return ToDoListItemModel(
                    id: queryDocumentSnapshot.documentID,
                    title: title,
                    dueDate: Date(),
                    createdDate: Date(),
                    isDone: isDone
                )
            }
        }
    }
    
    // Deletes the ToDo list item for the current user
    func delete(toDoListItemId: String) {
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(toDoListItemId)
            .delete()
    }
}
