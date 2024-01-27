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


    var body: some View {
        
        ZStack {
            GitStatusView()
            
            GitLogView()

            NotifierView()
        }

    }
}

#Preview {
    MachineView()
}
