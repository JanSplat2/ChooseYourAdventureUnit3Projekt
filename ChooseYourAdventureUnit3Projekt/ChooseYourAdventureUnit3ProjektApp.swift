//
//  ChooseYourAdventureUnit3ProjektApp.swift
//  ChooseYourAdventureUnit3Projekt
//
//  Created by Dittrich, Jan - Student on 10/3/25.
//

import SwiftUI

@main
struct ChooseYourAdventureUnit3ProjektApp: App {
    var body: some Scene {
        WindowGroup {
            @Previewable @State var Name: String = "Hello"
            ContentView(Name: $Name)
        }
    }
}
