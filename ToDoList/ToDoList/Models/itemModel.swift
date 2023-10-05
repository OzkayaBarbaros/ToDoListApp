//
//  itemModel.swift
//  ToDoList
//
//  Created by B on 01/10/2023.
//

import Foundation

struct itemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> itemModel {
        return itemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
