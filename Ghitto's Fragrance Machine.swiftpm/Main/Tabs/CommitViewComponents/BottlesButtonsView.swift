//
//  BottlesButtonsView.swift
//
//
//  Created by Luan Fazolin on 26/01/24.
//

import SwiftUI

struct BottlesButtonsView: View {
    @EnvironmentObject var gameData: GameData
    @EnvironmentObject var gameState: GameState
    
    var size: CGFloat = 60
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button(action: {
                    gameState.bottleToAdd = "bottle1"
                    gameState.selectedBottle = "bottle1"
                }) {
                    Image("bottle1")
                        .resizable()
                        .frame(width: size, height: size)
                        .border(Color.pink, width: gameState.selectedBottle == "bottle1" ? 6 : 0)
                }
                .padding(.horizontal)
                Button(action: {
                    gameState.bottleToAdd = "bottle2"
                    gameState.selectedBottle = "bottle2"
                }) {
                    Image("bottle2")
                        .resizable()
                        .frame(width: size, height: size)
                        .border(Color.pink, width: gameState.selectedBottle == "bottle2" ? 6 : 0)
                }
                .padding(.horizontal)
            }
            HStack {
                Button(action: {
                    gameState.bottleToAdd = "bottle3"
                    gameState.selectedBottle = "bottle3"
                }) {
                    Image("bottle3")
                        .resizable()
                        .frame(width: size, height: size)
                        .border(Color.pink, width: gameState.selectedBottle == "bottle3" ? 6 : 0)
                }
                .padding(.horizontal)
                Button(action: {
                    gameState.bottleToAdd = "bottle4"
                    gameState.selectedBottle = "bottle4"
                }) {
                    Image("bottle4")
                        .resizable()
                        .frame(width: size, height: size)
                        .border(Color.pink, width: gameState.selectedBottle == "bottle4" ? 6 : 0)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    BottlesButtonsView()
}
