//
//  ItemModel.swift
//  TodoList
//
//  Created by Nick Sarno on 3/2/21.
//

import Foundation

// Immutable Struct has only 'let' constants
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let dueDate: Date
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, description: String, dueDate: Date, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, description: description, dueDate: dueDate, isCompleted: !isCompleted)
    }
    
}

