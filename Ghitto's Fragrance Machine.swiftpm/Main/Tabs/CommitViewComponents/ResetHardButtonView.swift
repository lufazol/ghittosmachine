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
                if gameData.perfumeReady == nil
                {
                    gameState.noPerfumeReadyWarning = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        gameState.noPerfumeReadyWarning = false
                    }
                }
                else
                {
                    gameState.perfumeRemoved = true
                    gameState.perfumeOnLog = false
                    gameData.perfumeReady = nil
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        gameState.perfumeRemoved = false
                    }
                }

            }) {
                Text("git reset --hard HEADˆ")
                    .foregroundColor(.white)
                    .font(.custom("Noteworthy-Bold", size: 18))
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
