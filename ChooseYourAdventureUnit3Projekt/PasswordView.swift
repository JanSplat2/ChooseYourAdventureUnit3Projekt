//
//  PasswordView.swift
//  ChooseYourAdventureUnit3Projekt
//
//  Created by Dittrich, Jan - Student on 10/7/25.
//

import SwiftUI

struct PasswordView: View {
    @Binding var Name: String
    @State private var password: String = ""
    @State private var wrongPassword = false
    
    func checkPassword(_ input: String) -> Bool {
        return input == "Unicorn"
    }
    
    var body: some View {
        VStack {
            Text("Narrator: \(Name), Trivia Question: What is the national aninmal of Scotlan?")
                .font(.headline)
                .padding()
            
            TextField("Enter Animal", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Unlock") {
                wrongPassword = !checkPassword(password)
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
            
            if checkPassword(password) {
                NavigationLink("Continue", destination: TrueEndingView(Name: $Name))
                    .padding()
            }
            
            if wrongPassword {
                NavigationLink("Wrong! Back to Start", destination: ContentView(Name: $Name))
                    .foregroundColor(.red)
            }
        }
        .padding()
        .transition(.slide)
    }
}

#Preview {
    @Previewable @State var name: String = "Alex"
    PasswordView(Name: $name)
}
