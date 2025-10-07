//
//  TrueEndingView.swift
//  ChooseYourAdventureUnit3Projekt
//
//  Created by Dittrich, Jan - Student on 10/7/25.
//

import SwiftUI

struct TrueEndingView: View {
    @Binding var Name: String
    
    var body: some View {
        VStack {
            Text("Congratulations, \(Name)! You found the treasure of wisdom!")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            
            Image("Treasure")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
            
            NavigationLink(destination: ContentView(Name: $Name)) {
                Text("Play Again")
                    .font(.headline)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .transition(.opacity)
    }
}

#Preview {
    @Previewable @State var name: String = "Alex"
    TrueEndingView(Name: $name)
}
