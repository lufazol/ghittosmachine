//
//  TabsView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct TabsView: View {
    @EnvironmentObject var gameData: GameData
    @EnvironmentObject var gameState: GameState

    var body: some View {
        HStack {
            Button("git add") {
                // Action for Button 1
                gameState.selectedTab = "add"
                gameState.noteToAdd = "rose"
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)

            Button("git commit -m") {
                // Action for Button 2
                gameState.selectedTab = "commit"
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            
            Button("git push") {
                // Action for Button 3
                gameState.selectedTab = "push"
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
        }
        .padding()
    }
}

#Preview {
    TabsView()
}
