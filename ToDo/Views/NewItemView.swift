
import SwiftUI

struct NewItemView : View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("Create New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 80)
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TLButtonView(title: "Save", backgroundColor: Color.pink) {
                    if(viewModel.canSave) {
                        viewModel.save()
                        newItemPresented = false
                    } else { 
                        viewModel.showAlert = true
                    }
                }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text(
                            "Please fill in all fields and select due date that is today or later."
                        )
                    )
                }
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        true
    }, set: { _ in
        
    }))
}
