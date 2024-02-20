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

    func getLeverStatus() -> String {
        if gameState.addLeverIsDown == true {
            return "leverdown"
        } else {
            return "leverup"
        }
    }

    var body: some View {
        Button(action: {
            // less than 4 notes and note not already added: add note and display text
            if gameData.addedNotes.count < 4 && !(gameData.addedNotes.contains(gameState.noteToAdd))
            {
                gameState.lastNoteAdded = gameState.noteToAdd
                gameData.addedNotes.append(gameState.noteToAdd)
                gameState.noteAdded = true
                gameState.addLeverIsDown = true
                gameState.soundPlayer1.playSound(named: "drop")
                gameState.soundPlayer2.playSound(named: "lever")
                withAnimation(Animation.easeInOut(duration: 0.7)) {
                    gameState.isDropping = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    gameState.isDropping = false
                    gameState.addLeverIsDown = false
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    gameState.noteAdded = false
                }
            }
            // already has 4 notes: show limit warning
            else if gameData.addedNotes.count >= 4
            {
                gameState.errorSoundPlayer.playSound(named: "error")
                gameState.exceededNotesWarning = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    gameState.exceededNotesWarning = false
                }
            }
            // note already added and note not being just added: show already added warning
            else if gameData.addedNotes.contains(gameState.noteToAdd) && !(gameState.noteAdded)
            {
                gameState.errorSoundPlayer.playSound(named: "error")
                gameState.noteAlreadyAdded = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    gameState.noteAlreadyAdded = false
                }
            }

        }) {
            Image(getLeverStatus())
                .resizable()
                .frame(width: 70, height: 120)
                .padding()
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.trailing)
    }
}

#Preview {
    AddButtonView()
}
