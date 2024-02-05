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
        Rectangle()
            .foregroundColor(Color(hex: 0xFAE1DD))
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
                }
            )
            .background(
                Rectangle()
                    .stroke(Color.black, lineWidth: 3)
            )
    }
}

#Preview {
    AddView()
}
