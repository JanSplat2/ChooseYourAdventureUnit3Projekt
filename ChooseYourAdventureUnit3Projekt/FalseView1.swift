//
//  FalseView.swift
//  ChooseYourAdventureUnit3Projekt
//
//  Created by Dittrich, Jan - Student on 10/6/25.
//

import SwiftUI

struct FalseView1: View {
    @Binding var Name: String
    
    var body: some View {
        VStack {
            Text("Narrator: Oh no! \(Name) chose the wrong path and fell into lava!")
                .font(.headline)
                .padding()
            
            Image("Lava")
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 500)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Spacer()
            
            NavigationLink(destination: ContentView(Name: $Name)) {
                Text("Restart")
                    .font(.headline)
                    .padding()
                    .frame(width: 200)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .transition(.slide)
    }
}

#Preview {
    @Previewable @State var name: String = "Alex"
    FalseView1(Name: $name)
}
