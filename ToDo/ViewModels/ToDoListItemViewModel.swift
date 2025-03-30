import Foundation
import FirebaseFirestore

class ToDoListItemViewModel: ObservableObject {
    private var db = Firestore.firestore()
    
    init() {}
    
    func toggleIsDone(userId: String, toDoListItem: ToDoListItemModel) {
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(toDoListItem.id)
            .updateData(["isDone": !toDoListItem.isDone])
    }
}

