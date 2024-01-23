//
//  MachineView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI
import SpriteKit

struct MachineView: View {

    let gameScene = SKScene(fileNamed: "TestScene")
    
    var body: some View {
        
        VStack {
            if let gameScene {
                SpriteView(scene: gameScene)
                    .edgesIgnoringSafeArea([.top, .bottom])
                    .background(Color.black)
                    .navigationTitle("")
            }
        }
    }
}

#Preview {
    MachineView()
}
