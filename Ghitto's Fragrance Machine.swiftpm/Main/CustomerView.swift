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
    @State private var secondsRemaining = 60
    @State private var timer: Timer? = nil

    var body: some View {
        Rectangle()
            .frame(width: 400, height: 170)
            .foregroundColor(Color(hex: 0xeeeeee))
            .edgesIgnoringSafeArea(.all)
            .background(
                Rectangle()
                    .stroke(Color.black, lineWidth: 3)
                    .offset(y: -18)
            )
            .overlay(
                HStack {
                    Spacer()
                    ZStack {
                        Image(systemName: "hourglass.circle")
                            .resizable()
                            .foregroundColor(gameState.tutorialEnded ? Color(hex: 0xF08080) : .clear)
                            .frame(width: 35, height: 35)
                            .offset(x: 4, y: -23)
                        Text("\(gameState.secondsRemaining)")
                            .position(x: 36, y: 70)
                            .font(.custom("AmericanTypewriter", size: 26))
                            .foregroundColor(gameState.tutorialEnded ? .black :  .clear)
                    }
                    .frame(width: 65, height: 100)
                    .padding(.leading)
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .fill(Color(hex: 0xFFBC75))
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(Color.black, lineWidth: 2)
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
                                    HStack {
                                        Text("top:")
                                            .foregroundColor(.black)
                                            .font(.custom("AmericanTypewriter-Bold", size: 16))
                                        Text(gameData.order!.notes[0])
                                            .foregroundColor(.black)
                                            .font(.custom("AmericanTypewriter", size: 16))
                                    }
                                    
                                    HStack {
                                        Text("heart:")
                                            .foregroundColor(.black)
                                            .font(.custom("AmericanTypewriter-Bold", size: 16))
                                        Text(gameData.order!.notes[1])
                                            .foregroundColor(.black)
                                            .font(.custom("AmericanTypewriter", size: 16))
                                    }
                                    
                                    HStack {
                                        Text("base:")
                                            .foregroundColor(.black)
                                            .font(.custom("AmericanTypewriter-Bold", size: 16))
                                        Text(gameData.order!.notes[2])
                                            .foregroundColor(.black)
                                            .font(.custom("AmericanTypewriter", size: 16))
                                    }

                                }
                                Spacer()
                            }
                        }

                    }
                    .frame(width: 250, height: 100)
                    
                    ZStack {
                        Image(systemName: "trophy.circle")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(gameState.tutorialEnded ? Color(hex: 0xF08080) :  .clear)
                            .offset(x: -6, y: -23)
                        Text("\(gameData.score)")
                            .position(x: 29, y: 70)
                            .font(.custom("AmericanTypewriter", size: 26))
                            .foregroundColor(gameState.tutorialEnded ? .black : .clear)
                    }
                    .frame(width: 70, height: 100)
                    .padding(.trailing)
                    Spacer()
                }
                
            )
    }
}

#Preview {
    CustomerView()
}
