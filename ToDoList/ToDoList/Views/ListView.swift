//
//  ListView.swift
//  ToDoList
//
//  Created by B on 30/09/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
                
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
            
        }
        
        
        .navigationTitle("To Do List")
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
                    .fontWeight(.semibold)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AddView()) {
                    Text("Add")
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationStack {
         
            ListView()

        }
        .environmentObject(ListViewModel())
    }
}
