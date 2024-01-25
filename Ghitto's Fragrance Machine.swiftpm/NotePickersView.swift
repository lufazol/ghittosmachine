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
    
    @State private var selectedNotesGroup = ["rose", "jasmine", "pink pepper"]

    var body: some View {
        HStack {
            Picker("Category", selection: $selectedCategory) {
                ForEach(categories, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.wheel)
            .foregroundColor(.white)
            
            
            if selectedCategory == "top"
            {
                Picker("Category", selection: $gameState.noteToAdd) {
                    ForEach(topNotes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)
                .foregroundColor(.white)
            }
            
            else if selectedCategory == "heart"
            {
                Picker("Category", selection: $gameState.noteToAdd) {
                    ForEach(heartNotes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)
                .foregroundColor(.white)
            }
            
            else
            {
                Picker("Category", selection: $gameState.noteToAdd) {
                    ForEach(baseNotes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)
                .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    NotePickersView()
}
