import Foundation
import FirebaseFirestore

class ToDoListItemViewModel: ObservableObject {
    private var db = Firestore.firestore()
    
    init() {}
    
    func toggleIsDone(userId: String, toDoListItem: ToDoListItemModel) {
        
        var toDoListItemCopy = toDoListItem
        toDoListItemCopy.isDone.toggle()
        
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(toDoListItem.id)
            .setData(toDoListItemCopy.asDictionary())
    }
}

