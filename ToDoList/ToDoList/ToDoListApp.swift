//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by B on 30/09/2023.
//

import SwiftUI


@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
             
                ListView()
                
            }
            .navigationViewStyle(.stack)
            .environmentObject(listViewModel)
        }
    }
}
