//
//  NoItemsView.swift
//  ToDoList
//
//  Created by B on 04/10/2023.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Click on the Add button to add items to your list!")
                    .padding(.bottom, 25)
                
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Items")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(height: 60)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(15)
                    })
                .padding(.horizontal, 70)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.4) : Color.accentColor.opacity(0.4),
                    radius: 15,
                    x: 0,
                    y: 30)
                 
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(30)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(
            Animation
                .easeOut(duration: 6.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Hi")
        }
    }
}
