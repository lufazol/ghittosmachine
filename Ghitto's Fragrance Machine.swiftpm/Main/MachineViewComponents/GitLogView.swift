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
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(Color.black, lineWidth: 4)
                )
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color(hex: 0xfff2cc))
                .overlay(
                    VStack (alignment: .leading) {
                        if gameState.perfumeBeingSent {
                            Spacer()
                            Text("sending perfume...")
                                .font(.custom("AmericanTypewriter", size: 16))
                                .padding()
                            Spacer()
                        }
                        else if gameState.perfumeBeingAdded {
                            Spacer()
                            Text("filling bottle...")
                                .font(.custom("AmericanTypewriter", size: 16))
                                .padding()
                            Spacer()
                        }
                        else if !gameState.perfumeRemoved {
                            HStack {
                                Text("git log")
                                    .font(.custom("AmericanTypewriter-Bold", size: 16))
                                    .padding(.leading)
                                Spacer()
                            }
                            .padding(.top)
                            Spacer()
                            VStack {
                                if gameData.perfumeReady == nil
                                {
                                    Text("No perfume ready")
                                        .font(.custom("AmericanTypewriter", size: 16))
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
                                                    .font(.custom("AmericanTypewriter", size: 16))
                                                    .padding(.leading)
                                            }
                                        }
                                        Spacer()
                                    }
                                }
                                Spacer()
                            }
                            Spacer()
                        } else  {
                            Text("cleaning...")
                                .padding()
                            Spacer()
                        }
                    }
                )
        }
        .frame(width: 200, height: 130) // Set the width and h
        .position(x: 270, y: 280)
    }
}

#Preview {
    GitLogView()
}
