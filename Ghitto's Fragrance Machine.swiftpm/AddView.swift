//
//  AddView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var gameData: GameData

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
        Color.blue
            .edgesIgnoringSafeArea(.all)
            .overlay(
                HStack {
                    Spacer()

                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.wheel)
                    .foregroundColor(.white)
                    
                    
                    if selectedCategory == "top"
                    {
                        Picker("Category", selection: $selectedNote) {
                            ForEach(topNotes, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.wheel)
                        .foregroundColor(.white)
                    }
                    
                    else if selectedCategory == "heart"
                    {
                        Picker("Category", selection: $selectedNote) {
                            ForEach(heartNotes, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.wheel)
                        .foregroundColor(.white)
                    }
                    
                    else
                    {
                        Picker("Category", selection: $selectedNote) {
                            ForEach(baseNotes, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.wheel)
                        .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Your button action here
                        gameData.selectedNote = selectedNote
                        print(gameData.selectedNote)
                        
                    }) {
                        Image(systemName: "heart.fill") // Replace with your image name
                            .resizable()
                            .frame(width: 30, height: 30) // Set the size of the image
                            .padding()
                            .foregroundColor(.red) // Set the color of the image
                    }
                    
                    Spacer()

                }


            )
    }
}

#Preview {
    AddView()
}
