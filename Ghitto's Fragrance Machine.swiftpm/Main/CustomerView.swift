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
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                
                HStack {
                    Spacer()
                    ZStack {
                        Color.pink
                        
                        if gameData.order == nil
                        {
                            Text("No order yet")
                                .foregroundColor(.white)
                                .padding()
                        } else if gameState.perfumeBeingSent {
                            Text("Thanks!\nNew order arriving...")
                                .foregroundColor(.white)
                                .padding()
                        } else {
                            HStack {
                                Spacer()
                                Image(gameData.order?.bottle ?? "bottle1")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                VStack (alignment: .leading) {
                                    ForEach(gameData.order!.notes, id: \.self) { item in
                                        Text(item)
                                            .foregroundColor(.white)
                                            .padding(.leading)
                                    }
                                }
                                Spacer()
                            }
                        }

                    }
                    .frame(width: 220, height: 100)
                    
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
