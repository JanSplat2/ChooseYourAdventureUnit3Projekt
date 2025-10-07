//
//  TrueView1.swift
//  ChooseYourAdventureUnit3Projekt
//
//  Created by Dittrich, Jan - Student on 10/3/25.
//

import SwiftUI

struct TrueView1: View {
    @Binding var Name: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(LinearGradient(colors: [.blueTrue1, .brownTrue1], startPoint: .top, endPoint: .bottom))
                .ignoresSafeArea()
            VStack {
                Text("Narrator: \(Name) enters a mysterious forest.")
                    .font(.headline)
                    .padding()
                
                Image("Forest")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 350, height: 300)
                    .padding()
                
                Text("Two paths appear ahead...")
                    .padding(.bottom)
                
                HStack {
                    Spacer()
                    NavigationLink("Left Path", destination: TrueView2(Name: $Name))
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                    Spacer()
                    NavigationLink("Right Path", destination: FalseView1(Name: $Name))
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    Spacer()
                }
            }
            .transition(.opacity)
        }
    }
}

#Preview {
    @Previewable @State var name: String = "Alex"
    TrueView1(Name: $name)
}
