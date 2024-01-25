//
//  AddView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var gameData: GameData
    @EnvironmentObject var gameState: GameState

    var body: some View {
        Color.blue
            .edgesIgnoringSafeArea(.all)
            .overlay(
                HStack {
                    Spacer()
                    
                    VStack {
                        Spacer()
                        
                        NotePickersView()
                        
                        Spacer()
                        
                        RestoreButtonView()
                    }

                    AddButtonView()
                
                    Spacer()
                }
            )
    }
}

#Preview {
    AddView()
}
