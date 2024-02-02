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
                    .font(.custom("AmericanTypewriter", size: 16))
                    .foregroundColor(.white)
            } else if (gameState.noteAlreadyAdded)
            {
                Text("Note already added")
                    .font(.custom("AmericanTypewriter", size: 16))
                    .foregroundColor(.white)
            } else if (gameState.noteAdded)
            {
                Text("git add -a \(gameState.noteToAdd)")
                    .font(.custom("AmericanTypewriter", size: 16))
                    .foregroundColor(.white)
            } else if (gameState.notesCleaned)
            {
                Text("git restore .")
                    .font(.custom("AmericanTypewriter", size: 16))
                    .foregroundColor(.white)
            } else if (gameState.noNotesAdded)
            {
                Text("No notes added")
                    .font(.custom("AmericanTypewriter", size: 16))
                    .foregroundColor(.white)
            } else if (gameState.perfumeRemoved)
            {
                Text("git reset --hard HEADˆ")
                    .font(.custom("AmericanTypewriter", size: 16))
                    .foregroundColor(.white)
            } else if (gameState.perfumeBeingAdded)
            {
                Text("git commit -m 'perfume'")
                    .font(.custom("AmericanTypewriter", size: 16))
                    .foregroundColor(.white)
            } else if (gameState.noPerfumeReadyWarning)
            {
                Text("No perfume ready")
                    .font(.custom("AmericanTypewriter", size: 16))
                    .foregroundColor(.white)
            } else if (gameState.logIsFullWarning)
            {
                Text("finished perfume already on log")
                    .font(.custom("AmericanTypewriter", size: 16))
                    .foregroundColor(.white)
            } else if (gameState.noBottleSelectedWarning)
            {
                Text("No bottle selected")
                    .font(.custom("AmericanTypewriter", size: 16))
                    .foregroundColor(.white)
            } else if (gameState.perfumeBeingSent)
            {
                Text("git push")
                    .font(.custom("AmericanTypewriter", size: 16))
                    .foregroundColor(.white)
            } else if (gameState.noPerfumeToSendWarning)
            {
                Text("No perfume ready to send")
                    .font(.custom("AmericanTypewriter", size: 16))
                    .foregroundColor(.white)
            } else if (gameState.wrongPerfumeWarning)
            {
                Text("Wrong perfume! Clean up and start again :(")
                    .font(.custom("AmericanTypewriter", size: 16))
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
