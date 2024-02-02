//
//  GitStatusView.swift
//
//
//  Created by Luan Fazolin on 26/01/24.
//

import SwiftUI

struct GitStatusView: View {
    @EnvironmentObject var gameData: GameData
    @EnvironmentObject var gameState: GameState

    var body: some View {
        ZStack (alignment: .leading) {
            Color.green
            VStack (alignment: .leading) {
                Spacer()
                VStack {
                    Text("git status")
                        .font(.custom("AmericanTypewriter", size: 16))
                        .padding(.leading)
                }
                Spacer()
                VStack (alignment: .leading) {
                    if gameData.addedNotes.isEmpty
                    {
                        Text("No notes added")
                            .font(.custom("AmericanTypewriter", size: 16))
                            .padding(.leading)
                    } else {
                        ForEach(gameData.addedNotes, id: \.self) { item in
                            Text(item)
                                .foregroundColor(.blue)
                                .padding(.leading)
                                .font(.custom("AmericanTypewriter", size: 16))
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(width: 180, height: 130)
        .position(x: 270, y: 90)
    }
}

#Preview {
    GitStatusView()
}
