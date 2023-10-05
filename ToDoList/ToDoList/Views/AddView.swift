//
//  AddView.swift
//  ToDoList
//
//  Created by B on 30/09/2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 65)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonClicked,
                       
                       label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 65)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .padding(.top)
                    
                })

            }
            .padding(15)
        }
        .navigationTitle("Add New Item")
        .alert(isPresented: $showAlert, content: getAlert)

    }
    
    func saveButtonClicked() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your item must be at least 3 characters long."
            showAlert.toggle()
            return false
        } else if textFieldText.count > 50 {
            alertTitle = "Your item can not be longer than 50 character."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
