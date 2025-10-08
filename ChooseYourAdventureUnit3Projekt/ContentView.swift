//
//  ContentView.swift
//  ChooseYourAdventureUnit3Projekt
//
//  Created by Dittrich, Jan - Student on 10/3/25.
//

import SwiftUI
import AVFoundation

var player: AVAudioPlayer?

func playMainTheme() {
    let soundName = "TotKMainTheme"
    
    if let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") {
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.volume = 1.0
            player?.play()
            print("✅ Now playing \(soundName)")
        } catch {
            print("⚠️ Couldn't load \(soundName): \(error.localizedDescription)")
        }
    } else {
        print("⚠️ Sound file not found: \(soundName).mp3")
    }
}

struct ContentView: View {
    @Binding var Name: String
    
    var body: some View {
        NavigationStack {
            ZStack{
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundStyle(LinearGradient(colors: [.goldenMainView, .purpleMainView], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .ignoresSafeArea()
                VStack {
                    Image("AdventureLogo")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 200, height: 200)
                        .padding()
                    Spacer()
                    Text("Choose Your Own Adventure")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                    Spacer()
                    Text("Narrator: Hey, I'm Bill. Welcome to the adventure!")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    Spacer()
                    Text("What's your name?")
                        .font(.headline)
                        .padding(.top)
                    
                    TextField("Enter your name", text: $Name)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    if !Name.trimmingCharacters(in: .whitespaces).isEmpty {
                        NavigationLink(destination: TrueView1(Name: $Name)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.blue)
                                    .frame(width: 250, height: 150)
                                Text("Start")
                                    .font(.system(size: 60, weight: .bold, design: .monospaced))
                                    .foregroundColor(.white)
                            }
                        }
                        .transition(.scale(scale: 0.8))
                        .animation(.easeInOut, value: Name)
                    }
                    
                    Spacer()
                }
                .onAppear {
                    playMainTheme()
                }
                .onDisappear {
                    player?.stop()
                }

                .padding()
            }
        }
    }
}

#Preview {
    @Previewable @State var name: String = ""
    ContentView(Name: $name)
}
