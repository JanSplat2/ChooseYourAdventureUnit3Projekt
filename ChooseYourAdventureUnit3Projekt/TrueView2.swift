//
//  TrieView2.swift
//  ChooseYourAdventureUnit3Projekt
//
//  Created by Dittrich, Jan - Student on 10/7/25.
//

import SwiftUI

struct TrueView2: View {
    @Binding var Name: String
    
    var body: some View {
        VStack {
            Text("Narrator: \(Name) finds a glowing cave with two doors.")
                .font(.headline)
                .padding()
            
            Image("Cave")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
            
            Text("Which door will you open?")
                .padding()
            
            HStack {
                Spacer()
                NavigationLink("Blue Door", destination: PasswordView(Name: $Name))
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                Spacer()
                NavigationLink("Red Door", destination: FalseView2(Name: $Name))
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                Spacer()
            }
        }
        .transition(.scale)
    }
}


#Preview {
    @Previewable @State var name: String = "Alex"
    TrueView2(Name: $name)
}
