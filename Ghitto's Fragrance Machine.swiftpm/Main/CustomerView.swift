//
//  CustomerView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct CustomerView: View {
    @EnvironmentObject var gameState: GameState
    @EnvironmentObject var gameData: GameData

    var body: some View {
        Rectangle()
            .frame(width: 400, height: 170)
            .foregroundColor(Color(hex: 0xFAE1DD))
            .edgesIgnoringSafeArea(.all)
            .background(
                Rectangle()
                    .stroke(Color.black, lineWidth: 1.5)
                    .offset(y: -18)
            )
            .overlay(
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .fill(Color(hex: 0xFFBC75))
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                        
                        if gameData.order == nil
                        {
                            Text("No order yet")
                                .foregroundColor(.black)
                                .padding()
                        } else if gameState.perfumeBeingSent {
                            Text("Thanks!\nNew order arriving...")
                                .foregroundColor(.black)
                                .padding()
                        } else {
                            HStack {
                                Spacer()
                                Image(gameData.order?.bottle ?? "bottle1")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                VStack (alignment: .leading) {
                                    Text("top: " + gameData.order!.notes[0])
                                        .foregroundColor(.black)
                                        .padding(.leading)
                                        .font(.custom("AmericanTypewriter", size: 16))
                                    Text("heart: " + gameData.order!.notes[1])
                                        .foregroundColor(.black)
                                        .padding(.leading)
                                        .font(.custom("AmericanTypewriter", size: 16))
                                    Text("base: " + gameData.order!.notes[2])
                                        .foregroundColor(.black)
                                        .padding(.leading)
                                        .font(.custom("AmericanTypewriter", size: 16))
                                }
                                Spacer()
                            }
                        }

                    }
                    .frame(width: 250, height: 100)
                    
                    ZStack {
                        Color.clear
                        Text("\(gameData.score)")
                            .position(x: 37, y: 70)
                            .font(.system(size: 34))
                            .foregroundColor(.white)
                    }
                    .frame(width: 80, height: 100)
                }
                
            )
    }
}

#Preview {
    CustomerView()
}
