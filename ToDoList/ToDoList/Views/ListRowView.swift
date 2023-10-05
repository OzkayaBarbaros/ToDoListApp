//
//  ListRowView.swift
//  ToDoList
//
//  Created by B on 30/09/2023.
//

import SwiftUI

struct ListRowView: View {
    
    let item: itemModel
    
    var body: some View {
        
        HStack {
            
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
            
        }
        .font(.title2)
        .padding(.vertical, 10)
    }
}


struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = itemModel(title: "First item!", isCompleted: false)
    static var item2 = itemModel(title: "Second item!", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
    }
}
