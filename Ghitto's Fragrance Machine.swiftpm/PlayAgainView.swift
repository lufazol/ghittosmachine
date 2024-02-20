//
//  EndGameView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 16/02/24.
//

import SwiftUI

struct PlayAgainView: View {
    @EnvironmentObject var gameState: GameState
    @EnvironmentObject var gameData: GameData


    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .overlay(
                    ZStack {
                        VStack {
                            Text("Final score:")
                                .foregroundColor(.black)
                                .font(.custom("Noteworthy-Bold", size: 36))
                                .padding(.horizontal)
                                .multilineTextAlignment(.center)
                            Text("\(gameData.score)")
                                .foregroundColor(.black)
                                .font(.custom("Noteworthy-Bold", size: 32))
                                .multilineTextAlignment(.center)
                            Text("Highest score:")
                                .foregroundColor(.black)
                                .padding(.top)
                                .font(.custom("Noteworthy-Bold", size: 36))
                                .padding(.horizontal)
                                .multilineTextAlignment(.center)
                            Text("\(gameData.highestScore)")
                                .foregroundColor(.black)
                                .font(.custom("Noteworthy-Bold", size: 32))
                                .multilineTextAlignment(.center)
                            
                        }
                        .offset(y: -120)
                        Button(action: {
                            gameData.addedNotes = []
                            gameState.bottleToAdd = ""
                            gameState.selectedBottle = ""
                            gameData.perfumeReady = nil
                            gameState.isOnPlayAgainScreen = false
                            gameData.score = 0
                            gameState.secondsRemaining = 60
                            gameData.ordersDelivered = 0
                            gameData.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                if gameState.secondsRemaining > 0 {
                                    gameState.secondsRemaining -= 1
                                } else {
                                    gameData.timer?.invalidate()
                                    gameData.timer = nil
                                    if gameState.tutorialEnded {
                                        gameState.isOnPlayAgainScreen = true
                                        if gameData.score > gameData.highestScore {
                                            gameData.highestScore = gameData.score
                                        }
                                    }
                                }
                            }
                        }) {
                            RoundedRectangle(cornerRadius: 25)
                                .overlay {
                                    Text("Play again")
                                        .foregroundColor(.black)
                                        .font(.custom("Noteworthy-Bold", size: 20))
                                }
                                .foregroundColor(Color(hex: 0xFF6666))
                        }
                        .frame(width: 190, height: 80)
                        .offset(y: 110)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 3)
                                .offset(y: 110)
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
                        .offset(y: 230)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 3)
                                .offset(y: 230)
                        )


                    }

                )
                .padding()
                .frame(width: 360, height: 680)
                .offset(y: 40)
                .foregroundColor(Color(hex: 0xFEC5BB))
                .background(
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(.black, lineWidth: 4)
                        .padding()
                        .offset(y: 40)
                )
        }
    }
}

#Preview {
    EndGameView()
}
