//
//  ToDoListItem.swift
//  Landmarks
//
//  Created by Sahil Gupta on 18/03/25.
//

import Foundation

struct ToDoListItemModel: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: Date
    let createdDate: Date
    var isDone: Bool
    
    mutating func toggleDone() {
        isDone.toggle()
    }
}
