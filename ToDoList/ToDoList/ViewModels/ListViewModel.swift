//
//  ListViewModel.swift
//  ToDoList
//
//  Created by B on 03/10/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [itemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "itemList"
    
    init() {
        getItems()
    }

    
    func getItems() {
       
       guard
        let data = UserDefaults.standard.data(forKey: itemsKey),
        let savedItems = try? JSONDecoder().decode([itemModel].self, from: data)
        else {
           return
       }
        
        self.items = savedItems
        
    }
    
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = itemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: itemModel) {
        
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
        
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "itemList")
        }
    }
    
}
