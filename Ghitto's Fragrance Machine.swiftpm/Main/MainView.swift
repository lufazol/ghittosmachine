//
//  MainView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var gameState: GameState
    @EnvironmentObject var gameDate: GameData

    @State var isAnimated: Bool = false
    
    var body: some View {
        if gameState.isInTutorial == true {
            TutorialView()
        } else {
            ZStack {
                Image("wall")
                    .resizable()
                
                Image(gameDate.perfumeReady?.bottle ?? "")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .offset(x: gameState.isMoving ? 60 : -105, y: gameState.isOnPlatform ? 32 : 92)
                
                Image("machine")
                    .resizable()
                    .offset(y: -5)
                
                VStack {
                    CustomerView()
                        .frame(height: 90)
                    MachineView()
                        .frame(width: 396, height: 420)
                    TabsView()
                        .frame(height: 35)
                    if gameState.selectedTab == "add"
                    {
                        AddView()
                    }
                    else if gameState.selectedTab == "commit"
                    {
                        CommitView()
                    }
                    else if gameState.selectedTab == "push"
                    {
                        PushView()
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
