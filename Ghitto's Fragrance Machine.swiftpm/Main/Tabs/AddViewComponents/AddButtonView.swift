//
//  AddButtonView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 25/01/24.
//

import SwiftUI

struct AddButtonView: View {
    @EnvironmentObject var gameData: GameData
    @EnvironmentObject var gameState: GameState

    var body: some View {
        Button(action: {
            // less than 4 notes and note not already added: add note and display text
            if gameData.addedNotes.count < 4 && !(gameData.addedNotes.contains(gameState.noteToAdd))
            {
                gameData.addedNotes.append(gameState.noteToAdd)
                gameState.noteAdded = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    gameState.noteAdded = false
                }
            }
            // already has 4 notes: show limit warning
            else if gameData.addedNotes.count >= 4
            {
                gameState.exceededNotesWarning = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    gameState.exceededNotesWarning = false
                }
            }
            // note already added and note not being just added: show already added warning
            else if gameData.addedNotes.contains(gameState.noteToAdd) && !(gameState.noteAdded)
            {
                gameState.noteAlreadyAdded = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    gameState.noteAlreadyAdded = false
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
    AddButtonView()
}
