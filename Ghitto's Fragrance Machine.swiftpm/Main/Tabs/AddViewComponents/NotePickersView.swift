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

    @State private var selectedCategory = "heart"
    let categories = ["top", "heart", "base"]
        
    @State private var selectedNote = "vanilla"
        
    @State private var selectedTopNote = "orange"
    let topNotes = ["bergamot", "orange", "cherry"]
    
    @State private var selectedHeartNote = "jasmine"
    let heartNotes = ["rose", "jasmine", "pink pepper"]
    
    @State private var selectedBaseNote = "praline"
    let baseNotes = ["vanilla", "praline", "amber"]
    
    var body: some View {
        HStack {
            // render first picker
            Picker("Category", selection: $selectedCategory) {
                ForEach(categories, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.wheel)
            .foregroundColor(.white)
            
            // render second picker
            Picker("Notes", selection: $gameState.noteToAdd) {
                switch selectedCategory {
                case "top":
                    ForEach(topNotes, id: \.self) {
                        Text($0)
                    }
                case "heart":
                    ForEach(heartNotes, id: \.self) {
                        Text($0)
                    }
                case "base":
                    ForEach(baseNotes, id: \.self) {
                        Text($0)
                    }
                default:
                    ForEach(topNotes, id: \.self) {
                        Text($0)
                    }
                }
            }
            .pickerStyle(.wheel)
            .foregroundColor(.white)
            .onChange(of: selectedCategory) { category in
                switch selectedCategory {
                case "top":
                    gameState.noteToAdd = topNotes[0]
                case "heart":
                    gameState.noteToAdd = heartNotes[0]
                case "base":
                    gameState.noteToAdd = baseNotes[0]
                default:
                    gameState.noteToAdd = "vanilla"
                }
            }
        }
    }
}


#Preview {
    NotePickersView()
}
