//
//  ToDoListItemsView.swift
//  Landmarks
//
//  Created by Sahil Gupta on 18/03/25.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    @StateObject private var viewModel: ToDoListViewModel
    
    init(userId: String) {
        _viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.toDoListItems) { toDoListItem in
                    ToDoListItemView(toDoListItem: toDoListItem, userId: viewModel.userId)
                        .swipeActions {
                            Button("Delete") {
                                viewModel
                                    .delete(toDoListItemId: toDoListItem.id)
                            }
                            .tint(.red)
                            .labelStyle(.iconOnly)
                            .overlay(Image(systemName: "trash"))
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .onAppear {
                viewModel.fetchItems()
            }
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
