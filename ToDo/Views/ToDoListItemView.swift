import SwiftUI

struct ToDoListItemView: View {
    @StateObject private var viewModel = ToDoListItemViewModel()
    
    let toDoListItem: ToDoListItemModel
    let userId: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(toDoListItem.title)
                    .font(Font.title)
                Text(toDoListItem.dueDate.formatted(date: .abbreviated, time: .shortened))
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(userId: userId, toDoListItem: toDoListItem)
            } label: {
                Image(systemName: toDoListItem.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    ToDoListItemView(
        toDoListItem: .init(
            id: "123456",
            title: "Test",
            dueDate: Date(),
            createdDate: Date(),
            isDone: true
        ),
        userId: "xyz"
    )
}
