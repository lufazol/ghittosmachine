//
//  CommitButtonView.swift
//
//
//  Created by Luan Fazolin on 26/01/24.
//

import SwiftUI

struct CommitButtonView: View {
    @EnvironmentObject var gameData: GameData
    @EnvironmentObject var gameState: GameState

    var body: some View {
        Button(action: {
            if gameData.addedNotes.count > 0 && gameState.bottleToAdd != "" && !gameState.perfumeOnLog
            {
                let perfumeReady = Perfume()
                perfumeReady.bottle = gameState.bottleToAdd
                perfumeReady.notes = gameData.addedNotes
                
                gameData.perfumeReady = perfumeReady
                                
                gameData.addedNotes = []
                gameState.bottleToAdd = ""
                gameState.selectedBottle = ""
                gameState.perfumeBeingAdded = true
                
                gameState.soundPlayer1.playSound(named: "platformSound")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    gameState.soundPlayer2.playSound(named: "bottleFill")
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                    gameState.perfumeBeingAdded = false
                }
                gameState.perfumeOnLog = true
                withAnimation(Animation.easeInOut(duration: 1.0)) {
                    gameState.isOnPlatform = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(Animation.easeInOut(duration: 1)) {
                        gameState.mixingShouldFall = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    gameState.mixingShouldFall = false
                }
                withAnimation(Animation.easeInOut(duration: 1.5).delay(2)) {
                    gameState.isMoving = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    gameState.isOnPlatform = false
                    gameState.isMoving = false
                }
            } else if gameState.perfumeOnLog
            {
                gameState.errorSoundPlayer.playSound(named: "error")
                gameState.logIsFullWarning = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    gameState.logIsFullWarning = false
                }
            } else if gameData.addedNotes.count > 0 && gameState.bottleToAdd == "" && !gameState.perfumeOnLog
            {
                gameState.errorSoundPlayer.playSound(named: "error")
                gameState.noBottleSelectedWarning = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    gameState.noBottleSelectedWarning = false
                }
            }
        }) {
            Image(systemName: "plus.rectangle.portrait.fill")
                .resizable()
                .frame(width: 30, height: 40)
                .padding()
                .foregroundColor(Color(hex: 0xF08080))
        }
        .padding(.trailing)
    }
}

#Preview {
    CommitButtonView()
}
