//
//  NotePickersView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 25/01/24.
//

import SwiftUI

struct NotePickersView: View {
    @EnvironmentObject var gameData: GameData
    @EnvironmentObject var gameState: GameState

    //@State private var selectedCategory = "heart"

    @State private var selectedTopNote = "orange"
    
    @State private var selectedHeartNote = "jasmine"
    
    @State private var selectedBaseNote = "praline"
    
    var body: some View {
        HStack {
            // render first picker
            Picker("Category", selection: $gameState.selectedCategory) {
                ForEach(gameData.categories, id: \.self) { category in
                    Text(category)
                        .foregroundColor(.white)
                }
            }
            .pickerStyle(.wheel)

            // render second picker
            Picker("Notes", selection: $gameState.noteToAdd) {
                switch gameState.selectedCategory {
                case "top":
                    ForEach(gameData.topNotes, id: \.self) { note in
                        Text(note)
                            .foregroundColor(.white)
                    }
                case "heart":
                    ForEach(gameData.heartNotes, id: \.self) { note in
                        Text(note)
                            .foregroundColor(.white)
                    }
                case "base":
                    ForEach(gameData.baseNotes, id: \.self) { note in
                        Text(note)
                            .foregroundColor(.white)
                    }
                default:
                    ForEach(gameData.heartNotes, id: \.self) { note in
                        Text(note)
                            .foregroundColor(.white)
                    }
                }
            }
            .pickerStyle(.wheel)
            .onChange(of: gameState.selectedCategory) { category in
                switch gameState.selectedCategory {
                case "top":
                    gameState.noteToAdd = gameData.topNotes[0]
                case "heart":
                    gameState.noteToAdd = gameData.heartNotes[0]
                case "base":
                    gameState.noteToAdd = gameData.baseNotes[0]
                default:
                    gameState.noteToAdd = "rose"
                }
            }

        }
    }
}


#Preview {
    NotePickersView()
}
