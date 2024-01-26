//
//  ResetHardButtonView.swift
//
//
//  Created by Luan Fazolin on 26/01/24.
//

import SwiftUI

struct ResetHardButtonView: View {
    @EnvironmentObject var gameData: GameData
    @EnvironmentObject var gameState: GameState

    var body: some View {
        VStack {
            Button(action: {
                // less than 4 notes and note not already added: add note and display text
                if gameData.addedNotes.count > 0
                {
                    gameData.addedNotes = []
                    gameState.notesCleaned = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        gameState.notesCleaned = false
                    }
                }
                else
                {
                    gameState.noNotesAdded = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        gameState.noNotesAdded = false
                    }
                }

            }) {
                Text("git reset --hard HEADˆ")
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 240, height: 40)
                    .background(Color.red)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    ResetHardButtonView()
}
