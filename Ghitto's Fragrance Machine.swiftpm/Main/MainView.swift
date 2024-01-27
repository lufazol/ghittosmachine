//
//  MainView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var gameState: GameState
    
    var body: some View {
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

#Preview {
    MainView()
}
