//
//  MenuView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var gameData: GameData
    @EnvironmentObject var gameState: GameState

    var body: some View {
        ZStack {
            

            
            if gameState.isPlaying {
                MainView()
            }

            else {
                
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                Image("clouds")
                    .resizable()
                    .offset(x: gameState.menuAnimationsAreOn ? 390 : -380)
                
                Image("smoke")
                    .resizable()
                    .offset(y: gameState.menuAnimationsAreOn ? -340 : 270)
                
                Image("grass")
                    .resizable()
                
                Image("house")
                    .resizable()
                
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 340, height: 280)
                    .foregroundColor(.clear)
                    .overlay(
                        Text("Ghitto's Fragrance Machine")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .font(.custom("AcademyEngravedLetPlain", size: 64))
                    )
                    .offset(y: -220)
                
                Button(action: {
                    gameState.menuBackgroundPlayer.stopSound()
                    gameState.isPlaying = true
                }) {
                    RoundedRectangle(cornerRadius: 25)
                        .overlay {
                            Text("Play")
                                .foregroundColor(.black)
                                .font(.custom("Noteworthy-Bold", size: 20))
                        }
                        .foregroundColor(Color(hex: 0xFF6666))
                }
                .frame(width: 190, height: 80)
                .offset(y: 180)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 3)
                        .offset(y: 180)
                )
                
                Button(action: {
                    gameState.isShowingAbout = true
                }) {
                    RoundedRectangle(cornerRadius: 25)
                        .overlay {
                            Text("About")
                                .foregroundColor(.black)
                                .font(.custom("Noteworthy-Bold", size: 20))
                        }
                        .foregroundColor(Color(hex: 0xFF6666))
                }
                .frame(width: 190, height: 80)
                .offset(y: 290)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 3)
                        .offset(y: 290)
                )
                
                if gameState.isShowingAbout {
                    AboutView()
                }
            }
            

        }
        .onAppear {
            withAnimation(Animation.linear(duration: 24).repeatForever(autoreverses: false)) {
                gameState.menuAnimationsAreOn = true
            }
            gameState.backgroundSoundPlayer.playSound(named: "menuPiano", volume: 0.37, loops: -1)
            gameState.menuBackgroundPlayer.playSound(named: "menuBirds", volume: 0.11, loops: -1)
        }
    }
}

#Preview {
    MenuView()
}
