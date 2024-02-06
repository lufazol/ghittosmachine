//
//  MainView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var gameState: GameState
    @EnvironmentObject var gameData: GameData

    @State var isAnimated: Bool = false
    
    func getEmptyBottle() -> String
    {
        if gameData.perfumeReady?.bottle == "bottle1"
        {
            return "emptybottle1"
        }
        else if gameData.perfumeReady?.bottle == "bottle2"
        {
            return "emptybottle2"
        }
        else if gameData.perfumeReady?.bottle == "bottle3"
        {
            return "emptybottle3"
        }
        else if gameData.perfumeReady?.bottle == "bottle4"
        {
            return "emptybottle4"
        }
        else {
            return "emptybottle1"
        }
    }
    

    func getMachineStatus() -> String
    {
        if gameState.notesCleaned
        {
            return "machineEmpty"
        } else if gameData.addedNotes == [] {
            return "machineCleanSolution"
        } else {
            return "machineFragranceSolution"
        }
    }
    
    var body: some View {
        if gameState.isInTutorial == true {
            TutorialView()
        } else {
            ZStack {
                Image("wall")
                    .resizable()

                Image(gameState.mixingShouldFall ? "mixing" : "")
                    .resizable()
                    .frame(width: 22, height: 60)
                    .offset(x: -105, y: gameState.mixingShouldFall ? 50 : -40)

                Image(getEmptyBottle())
                    .resizable()
                    .frame(width: 44, height: 46)
                    .offset(x: gameState.isMoving ? 60 : -105, y: gameState.isOnPlatform ? 32 : 92)

                Image(getMachineStatus())
                    .resizable()
                    .offset(y: -5)
                
                Image(gameState.isDropping ? "drops" : "")
                    .resizable()
                    .frame(width: 30, height: 60)
                    .offset(x: -105, y: gameState.isDropping ? -40 : -100)

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
