//
//  PushView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct PushView: View {
    @EnvironmentObject var gameState: GameState
    @EnvironmentObject var gameData: GameData

    var body: some View {
        Rectangle()
            .foregroundColor(Color(hex: 0xFAE1DD))
            .edgesIgnoringSafeArea(.all)
            .overlay(
                ZStack {
                    Button (action: {
                        if gameState.perfumeOnLog &&
                           gameData.perfumeReady?.bottle == gameData.order?.bottle &&
                            Set(gameData.perfumeReady!.notes) == Set(gameData.order!.notes)
                        {
                            gameState.soundPlayer1.playSound(named: "bottleDelivered")
                            gameState.perfumeOnLog = false
                            
                            if gameState.tutorialEnded {
                                gameData.score += gameData.perfumeReady!.notes.count
                                gameData.ordersDelivered += 1
                                if gameData.ordersDelivered < 4 {
                                    gameState.secondsRemaining = 60 - gameData.ordersDelivered * 10
                                }
                                else {
                                    gameState.secondsRemaining = 20
                                }
                            }
                            gameData.perfumeReady = nil
                            gameState.perfumeBeingSent = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                gameState.perfumeBeingSent = false
                            }
                            gameData.generateOrder()
                            gameState.firstOrderFinished = true
                            gameData.timer?.invalidate()
                            gameData.timer = nil
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
                        } else if !gameState.perfumeOnLog {
                            gameState.errorSoundPlayer.playSound(named: "error")
                            gameState.noPerfumeToSendWarning = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                gameState.noPerfumeToSendWarning = false
                            }
                        } else {
                            gameState.errorSoundPlayer.playSound(named: "error")
                            gameState.wrongPerfumeWarning = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                gameState.wrongPerfumeWarning = false
                            }
                        }
                        
                    }) {
                        Circle()
                            .frame(width: 150, height: 150)
                            .foregroundColor(Color(hex: 0x87D1FF))
                            .overlay(
                                Text("send perfume")
                                    .font(.custom("Noteworthy-Bold", size: 18))
                                    .foregroundColor(.black)
                            )
                            .background(
                                Circle()
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                }
            )
            .background(
                Rectangle()
                    .stroke(Color.black, lineWidth: 3)
            )
    }
}

#Preview {
    PushView()
}
