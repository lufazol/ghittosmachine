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
                        if gameState.perfumeOnLog {
                            gameState.perfumeOnLog = false
                            gameData.perfumeReady = nil
                            gameState.perfumeBeingSent = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                gameState.perfumeBeingSent = false
                            }
                        } else {
                            gameState.noPerfumeToSendWarning = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                gameState.noPerfumeToSendWarning = false
                            }
                        }
                        
                    }) {
                        Circle()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.yellow)
                            .overlay(
                                Text("send perfume")
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
