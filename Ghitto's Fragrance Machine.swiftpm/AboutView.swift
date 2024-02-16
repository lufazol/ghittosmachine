//
//  AboutView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct AboutView: View {
    @EnvironmentObject var gameState: GameState

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .overlay(
                    ZStack {
                        VStack {
                            Text("About")
                                .foregroundColor(.black)
                                .font(.custom("Noteworthy-Bold", size: 20))
                                .padding()
                            Spacer()
                            Text("Hey there! =)")
                                .foregroundColor(.black)
                                .padding()
                                .font(.custom("Noteworthy-Regular", size: 20))
                            Text("I'm Luan Fazolin, a Brazilian Computer Science student, who really likes git and who also happens to have a keen interest on perfumes.")
                                .foregroundColor(.black)
                                .padding()
                                .font(.custom("Noteworthy-Regular", size: 20))
                            Text("The game was developed as part of the Swift Student Challenge for 2024's WWDC.")
                                .foregroundColor(.black)
                                .padding()
                                .font(.custom("Noteworthy-Regular", size: 20))
                            Text("Besides that, my main goal is that it can help people that are learning git to get used to its basics commands and use flow, while also sharing a bit about perfume making in an environment inspired by the aesthetics from some early 2000's games.")
                                .foregroundColor(.black)
                                .padding()
                                .font(.custom("Noteworthy-Regular", size: 20))
                            Spacer()
                        }
                        
                        Button(action: {
                            gameState.isShowingAbout = false
                        }) {
                            Image(systemName: "x.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.pink)
                                .imageScale(.large)
                        }
                        .offset(x: -140, y: -330)

                    }

                )
                .padding()
                .foregroundColor(Color(hex: 0xFEC5BB))
                .background(
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(.black, lineWidth: 4)
                        .padding()
                )
        }
    }
}

#Preview {
    AboutView()
}
