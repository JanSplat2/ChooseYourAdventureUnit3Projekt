//
//  FalseView.swift
//  ChooseYourAdventureUnit3Projekt
//
//  Created by Dittrich, Jan - Student on 10/7/25.
//

import SwiftUI

struct FalseView2: View {
    @Binding var Name: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(LinearGradient(colors: [.greenFalse2, .secndGreenFalse2], startPoint: .top, endPoint: .bottomTrailing))
                .ignoresSafeArea()
            VStack {
                Text("Narrator: \(Name) opened the red door... and woke the dragon!")
                    .font(.headline)
                    .padding()
                
                Image("Dragon")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 350, height: 300)
                    .padding()
                
                NavigationLink(destination: ContentView(Name: $Name)) {
                    Text("Restart")
                        .font(.headline)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .transition(.opacity)
        }
    }
}


#Preview {
    @Previewable @State var name: String = "Alex"
    FalseView2(Name: $name)
}
