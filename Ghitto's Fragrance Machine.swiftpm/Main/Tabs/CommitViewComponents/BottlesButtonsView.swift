//
//  BottlesButtonsView.swift
//
//
//  Created by Luan Fazolin on 26/01/24.
//

import SwiftUI

struct BottlesButtonsView: View {
    @EnvironmentObject var gameData: GameData
    @EnvironmentObject var gameState: GameState
    
    var size: CGFloat = 60
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button(action: {
                    gameState.bottleToAdd = "bottle1"
                    gameState.selectedBottle = "bottle1"
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .fill(gameState.selectedBottle == "bottle1" ? Color(hex: 0xF08080) : Color(hex: 0xFEC5BB))
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                        
                        Image("bottle1")
                            .resizable()
                            .frame(width: size, height: size)
                    }

                }
                .padding(.horizontal)
                Button(action: {
                    gameState.bottleToAdd = "bottle2"
                    gameState.selectedBottle = "bottle2"
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .fill(gameState.selectedBottle == "bottle2" ? Color(hex: 0xF08080) : Color(hex: 0xFEC5BB))
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                        
                        Image("bottle2")
                            .resizable()
                            .frame(width: size, height: size)
                    }
                }
                .padding(.horizontal)
            }
            HStack {
                Button(action: {
                    gameState.bottleToAdd = "bottle3"
                    gameState.selectedBottle = "bottle3"
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .fill(gameState.selectedBottle == "bottle3" ? Color(hex: 0xF08080) : Color(hex: 0xFEC5BB))
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                        
                        Image("bottle3")
                            .resizable()
                            .frame(width: size, height: size)
                    }
                }
                .padding(.horizontal)
                Button(action: {
                    gameState.bottleToAdd = "bottle4"
                    gameState.selectedBottle = "bottle4"
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .fill(gameState.selectedBottle == "bottle4" ? Color(hex: 0xF08080) : Color(hex: 0xFEC5BB))
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                        
                        Image("bottle4")
                            .resizable()
                            .frame(width: size, height: size)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    BottlesButtonsView()
}
