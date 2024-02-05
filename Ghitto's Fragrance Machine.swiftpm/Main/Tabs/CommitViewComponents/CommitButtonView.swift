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
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    gameState.perfumeBeingAdded = false
                }
                gameState.perfumeOnLog = true
                withAnimation(Animation.easeInOut(duration: 2.0)) {
                    gameState.isOnPlatform = true
                }
                withAnimation(Animation.easeInOut(duration: 2.5).delay(3.0)) {
                    gameState.isMoving = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    gameState.isOnPlatform = false
                    gameState.isMoving = false
                }
            } else if gameState.perfumeOnLog
            {
                gameState.logIsFullWarning = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    gameState.logIsFullWarning = false
                }
            } else if gameData.addedNotes.count > 0 && gameState.bottleToAdd == "" && !gameState.perfumeOnLog
            {
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
