//
//  EndGameView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 16/02/24.
//

import SwiftUI

struct EndGameView: View {
    @EnvironmentObject var gameState: GameState
    @EnvironmentObject var gameData: GameData


    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .overlay(
                    ZStack {
                        VStack {
                            Text("That's it! You delivered your first order and finished the tutorial, congratulations! =)")
                                .foregroundColor(.black)
                                .font(.custom("Noteworthy-Bold", size: 20))
                                .padding(.horizontal)
                                .multilineTextAlignment(.center)
                            Text("If you keep playing, it will be more challenging: you'll have a timer to deliver each order and a score indicator, both in the upper screen.")
                                .foregroundColor(.black)
                                .font(.custom("Noteworthy-Bold", size: 20))
                                .padding()
                                .multilineTextAlignment(.center)
                            Text("You can now choose to keep playing or go back to the menu.")
                                .foregroundColor(.black)
                                .padding()
                                .multilineTextAlignment(.center)
                                .font(.custom("Noteworthy-Bold", size: 20))
                            
                        }
                        .offset(y: -120)
                        Button(action: {
                            gameState.tutorialEnded = true
                            gameState.isInTutorial = false
                            gameState.secondsRemaining = 60
                        }) {
                            RoundedRectangle(cornerRadius: 25)
                                .overlay {
                                    Text("Keep playing")
                                        .foregroundColor(.black)
                                        .font(.custom("Noteworthy-Bold", size: 20))
                                }
                                .foregroundColor(Color(hex: 0xFF6666))
                        }
                        .frame(width: 190, height: 80)
                        .offset(y: 140)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 3)
                                .offset(y: 140)
                        )
                        
                        Button(action: {
                            gameState.isPlaying = false
                            gameState.backgroundSoundPlayer.playSound(named: "menuPiano", volume: 0.37, loops: -1)
                            gameState.menuBackgroundPlayer.playSound(named: "menuBirds", volume: 0.11, loops: -1)
                            withAnimation(Animation.linear(duration: 24).repeatForever(autoreverses: false)) {
                                gameState.menuAnimationsAreOn = true
                            }
                        }) {
                            RoundedRectangle(cornerRadius: 25)
                                .overlay {
                                    Text("Back to menu")
                                        .foregroundColor(.black)
                                        .font(.custom("Noteworthy-Bold", size: 20))
                                }
                                .foregroundColor(Color(hex: 0xFF6666))
                        }
                        .frame(width: 190, height: 80)
                        .offset(y: 250)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 3)
                                .offset(y: 250)
                        )


                    }

                )
                .padding()
                .frame(width: 360, height: 760)
                .foregroundColor(Color(hex: 0xFEC5BB))
                .background(
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(.black, lineWidth: 4)
                        .padding()
                )
        }
    }
}

#Preview {
    EndGameView()
}
