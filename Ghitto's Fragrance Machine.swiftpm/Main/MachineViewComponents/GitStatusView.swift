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
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(Color.black, lineWidth: 4)
                )
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color(hex: 0xfff2cc))
                .overlay(
                    VStack {
                        if gameState.notesCleaned {
                            Spacer()
                            Text("cleaning mixing...")
                                .font(.custom("AmericanTypewriter", size: 16))
                                .padding()
                            Spacer()
                        } else {
                            HStack {
                                Text("git status")
                                    .font(.custom("AmericanTypewriter-Bold", size: 16))
                                    .padding(.leading)
                                Spacer()
                            }
                            .padding(.top)
                            Spacer()
                            VStack (alignment: .leading) {
                                if gameData.addedNotes.isEmpty
                                {
                                    HStack {
                                        Text("No notes added")
                                            .font(.custom("AmericanTypewriter", size: 16))
                                            .padding(.leading)
                                        Spacer()
                                    }

                                } else {
                                    ForEach(gameData.addedNotes, id: \.self) { item in
                                        HStack {
                                            Text(item)
                                                .font(.custom("AmericanTypewriter", size: 16))
                                                .padding(.leading)
                                            Spacer()
                                        }

                                    }
                                }
                                Spacer()
                            }
                        }

                        Spacer()
                    }
                )
        }
        .frame(width: 180, height: 130)
        .position(x: 270, y: 90)
    }
}

#Preview {
    GitStatusView()
}
