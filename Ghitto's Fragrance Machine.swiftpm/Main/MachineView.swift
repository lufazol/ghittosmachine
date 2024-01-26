//
//  MachineView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI
import SpriteKit

struct MachineView: View {
    @EnvironmentObject var gameData: GameData
    @EnvironmentObject var gameState: GameState
    
    @State private var warning: Bool = false

    let stringArray: [String] = ["Item 1", "Item 2", "Item 3", "Item 4"]

    var body: some View {
        
        ZStack {
            ZStack (alignment: .leading) {
                Color.green
                VStack (alignment: .leading) {
                    Spacer()
                    VStack {
                        Text("git status")
                            .padding(.leading)
                    }
                    Spacer()
                    VStack (alignment: .leading) {
                        if gameData.addedNotes.isEmpty
                        {
                            Text("No notes added")
                                .font(.body)
                                .padding(.leading)
                        } else {
                            ForEach(gameData.addedNotes, id: \.self) { item in
                                Text(item)
                                    .font(.body)
                                    .foregroundColor(.blue)
                                    .padding(.leading)
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
            .frame(width: 180, height: 130)
            .position(x: 270, y: 90)
            
            
            ZStack (alignment: .leading) {
                Color.blue
                VStack (alignment: .leading) {
                    Spacer()
                    VStack {
                        Text("git log")
                            .padding(.leading)
                    }
                    Spacer()
                    VStack {
                        if gameData.perfumesReady.isEmpty
                        {
                            Text("No perfumes ready")
                                .font(.body)
                                .padding(.leading)
                        } else {
                            ForEach(stringArray, id: \.self) { item in
                                Text(item)
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .padding(.leading)
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
            .frame(width: 160, height: 130) // Set the width and h
            .position(x: 280, y: 270)

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
                }
            }
            .frame(width: 280, height: 40) // Set the width and h
            .position(x: 200, y: 395)
        }

    }
}

#Preview {
    MachineView()
}
