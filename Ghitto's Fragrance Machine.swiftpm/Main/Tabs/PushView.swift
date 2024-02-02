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
            .foregroundColor(.purple)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                ZStack {
                    Button (action: {
                        if gameState.perfumeOnLog &&
                           gameData.perfumeReady?.bottle == gameData.order?.bottle &&
                            Set(gameData.perfumeReady!.notes) == Set(gameData.order!.notes)
                        {
                            gameState.perfumeOnLog = false
                            gameData.score += gameData.perfumeReady!.notes.count
                            gameData.perfumeReady = nil
                            gameState.perfumeBeingSent = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                gameState.perfumeBeingSent = false
                            }
                            gameData.generateOrder()
                        } else if !gameState.perfumeOnLog {
                            gameState.noPerfumeToSendWarning = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                gameState.noPerfumeToSendWarning = false
                            }
                        } else {
                            gameState.wrongPerfumeWarning = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                gameState.wrongPerfumeWarning = false
                            }
                        }
                        
                    }) {
                        Circle()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.yellow)
                            .overlay(
                                Text("send perfume")
                                    .font(.custom("Noteworthy-Bold", size: 18))
                                    .foregroundColor(.black)
                            )
                    }
                }
            )
    }
}

#Preview {
    PushView()
}
