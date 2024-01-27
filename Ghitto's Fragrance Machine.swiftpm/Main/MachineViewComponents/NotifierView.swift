//
//  NotifierView.swift
//
//
//  Created by Luan Fazolin on 26/01/24.
//

import SwiftUI

struct NotifierView: View {
    @EnvironmentObject var gameData: GameData
    @EnvironmentObject var gameState: GameState

    var body: some View {
        ZStack {
            Color.gray
            
            if (gameState.exceededNotesWarning)
            {
                Text("Notes limit already reached")
                    .foregroundColor(.white)
            } else if (gameState.noteAlreadyAdded)
            {
                Text("Note already added")
                    .foregroundColor(.white)
            } else if (gameState.noteAdded)
            {
                Text("git add -a \(gameState.noteToAdd)")
                    .foregroundColor(.white)
            } else if (gameState.notesCleaned)
            {
                Text("git restore .")
                    .foregroundColor(.white)
            } else if (gameState.noNotesAdded)
            {
                Text("No notes added")
                    .foregroundColor(.white)
            } else if (gameState.perfumeRemoved)
            {
                Text("git reset --hard HEADˆ")
                    .foregroundColor(.white)
            } else if (gameState.perfumeBeingAdded)
            {
                Text("git commit -m 'perfume'")
                    .foregroundColor(.white)
            } else if (gameState.noPerfumeReadyWarning)
            {
                Text("No perfume ready")
                    .foregroundColor(.white)
            } else if (gameState.logIsFullWarning)
            {
                Text("finished perfume already on log")
                    .foregroundColor(.white)
            } else if (gameState.noBottleSelectedWarning)
            {
                Text("No bottle selected")
                    .foregroundColor(.white)
            } else if (gameState.perfumeBeingSent)
            {
                Text("git push")
                    .foregroundColor(.white)
            } else if (gameState.noPerfumeToSendWarning)
            {
                Text("No perfume ready to send")
                    .foregroundColor(.white)
            }
        }
        .frame(width: 280, height: 40) // Set the width and h
        .position(x: 200, y: 395)
    }
}

#Preview {
    NotifierView()
}
