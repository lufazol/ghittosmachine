//
//  TestScene.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import Foundation
import SpriteKit
import SwiftUI

// A simple game scene with falling boxes
class GameScene: SKScene {
    @ObservedObject var gameData: GameData
    
    init(gameData: GameData) {
        self.gameData = gameData
        super.init(size: CGSize(width: 396, height: 440))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
                
        let note = SKLabelNode(text: gameData.selectedNote)
        note.position = location
        
        addChild(note)
        addChild(box)
    }
}

// A sample SwiftUI creating a GameScene and sizing it
// at 300x400 points
struct TestView: View {
    @EnvironmentObject var gameData: GameData

    var scene: SKScene {
        let scene = GameScene(gameData: gameData)
        scene.size = CGSize(width: 396, height: 440)
        scene.scaleMode = .fill
        return scene
    }

    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 396, height: 440)
    }
}
