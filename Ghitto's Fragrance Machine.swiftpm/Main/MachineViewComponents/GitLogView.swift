//
//  GitLogView.swift
//
//
//  Created by Luan Fazolin on 26/01/24.
//

import SwiftUI

struct GitLogView: View {
    @EnvironmentObject var gameData: GameData
    @EnvironmentObject var gameState: GameState

    let stringArray: [String] = ["Item 1", "Item 2", "Item 3", "Item 4"]

    var body: some View {
        ZStack (alignment: .leading) {
            Color.green
            VStack (alignment: .leading) {
                Spacer()
                if !gameState.perfumeRemoved {
                    VStack {
                        Text("git log")
                            .padding(.leading)
                    }
                    Spacer()
                    VStack {
                        if gameData.perfumeReady == nil
                        {
                            Text("No perfume ready")
                                .font(.body)
                                .padding(.leading)
                        } else {
                            Spacer()
                            HStack {
                                Spacer()
                                Image(gameData.perfumeReady?.bottle ?? "bottle1")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                VStack (alignment: .leading) {
                                    ForEach(gameData.perfumeReady!.notes, id: \.self) { item in
                                        Text(item)
                                            .foregroundColor(.white)
                                            .padding(.leading)
                                    }
                                }
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                } else {
                    Text("cleaning...")
                        .padding()
                    Spacer()
                }

            }
        }
        .frame(width: 200, height: 130) // Set the width and h
        .position(x: 270, y: 270)
    }
}

#Preview {
    GitLogView()
}
