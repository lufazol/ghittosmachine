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
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: 0xD8E2DC))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
            
            if (gameState.exceededNotesWarning)
            {
                Text("Notes limit already reached")
                    .font(.custom("AmericanTypewriter-Bold", size: 16))
            } else if (gameState.noteAlreadyAdded)
            {
                Text("Note already added")
                    .font(.custom("AmericanTypewriter-Bold", size: 16))
            } else if (gameState.noteAdded)
            {
                Text("git add -a \(gameState.noteToAdd)")
                    .font(.custom("AmericanTypewriter-Bold", size: 16))
            } else if (gameState.notesCleaned)
            {
                Text("git restore .")
                    .font(.custom("AmericanTypewriter-Bold", size: 16))
            } else if (gameState.noNotesAdded)
            {
                Text("No notes added")
                    .font(.custom("AmericanTypewriter-Bold", size: 16))
            } else if (gameState.perfumeRemoved)
            {
                Text("git reset --hard HEADˆ")
                    .font(.custom("AmericanTypewriter-Bold", size: 16))
            } else if (gameState.perfumeBeingAdded)
            {
                Text("git commit -m 'perfume'")
                    .font(.custom("AmericanTypewriter-Bold", size: 16))
            } else if (gameState.noPerfumeReadyWarning)
            {
                Text("No perfume ready")
                    .font(.custom("AmericanTypewriter-Bold", size: 16))
            } else if (gameState.logIsFullWarning)
            {
                Text("finished perfume already on log")
                    .font(.custom("AmericanTypewriter-Bold", size: 16))
            } else if (gameState.noBottleSelectedWarning)
            {
                Text("No bottle selected")
                    .font(.custom("AmericanTypewriter-Bold", size: 16))
            } else if (gameState.perfumeBeingSent)
            {
                Text("git push")
                    .font(.custom("AmericanTypewriter-Bold", size: 16))
            } else if (gameState.noPerfumeToSendWarning)
            {
                Text("No perfume ready to send")
                    .font(.custom("AmericanTypewriter-Bold", size: 16))
            } else if (gameState.wrongPerfumeWarning)
            {
                Text("Wrong perfume! Clean up and start again :(")
                    .font(.custom("AmericanTypewriter-Bold", size: 16))
            }
        }
        .frame(width: 280, height: 40) // Set the width and h
        .position(x: 200, y: 400)
    }
}

#Preview {
    NotifierView()
}
