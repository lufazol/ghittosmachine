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

    @State private var selectedTopNote = "bergamot"
    
    @State private var selectedHeartNote = "jasmine"
    
    @State private var selectedBaseNote = "amber"
    
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(Color(hex: 0xFEC5BB))
                    .overlay(
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
                // render first picker
                Picker("Category", selection: $gameState.selectedCategory) {
                    ForEach(gameData.categories, id: \.self) { category in
                        Text(category)
                            .foregroundColor(.black)
                            .font(.custom("Noteworthy-Bold", size: 20))
                    }
                }
                .pickerStyle(.wheel)
            }

            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(Color(hex: 0xFEC5BB))
                    .overlay(
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(Color.black, lineWidth: 1)
                    )
                // render second picker
                Picker("Notes", selection: $gameState.noteToAdd) {
                    switch gameState.selectedCategory {
                    case "top":
                        ForEach(gameData.topNotes, id: \.self) { note in
                            Text(note)
                                .foregroundColor(.black)
                                .font(.custom("Noteworthy-Bold", size: 20))
                        }
                    case "heart":
                        ForEach(gameData.heartNotes, id: \.self) { note in
                            Text(note)
                                .foregroundColor(.black)
                                .font(.custom("Noteworthy-Bold", size: 20))
                        }
                    case "base":
                        ForEach(gameData.baseNotes, id: \.self) { note in
                            Text(note)
                                .foregroundColor(.black)
                                .font(.custom("Noteworthy-Bold", size: 20))
                        }
                    default:
                        ForEach(gameData.heartNotes, id: \.self) { note in
                            Text(note)
                                .foregroundColor(.black)
                                .font(.custom("Noteworthy-Bold", size: 20))
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

            Spacer()
        }
    }
}


#Preview {
    NotePickersView()
}
