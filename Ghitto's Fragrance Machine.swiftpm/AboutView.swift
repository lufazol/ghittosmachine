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

                            Image("profilePic")
                                .resizable()
                                .scaledToFill()
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .frame(width: 150, height: 150)
                                .overlay(
                                    Circle()
                                        .stroke(.black, lineWidth: 2)
                                )
                            Text("Hey there! =)")
                                .foregroundColor(.black)
                                .padding()
                                .font(.custom("Noteworthy-Regular", size: 20))
                            Text("I'm Luan Fazolin, a Computer Science student from Brazil who really likes git - and who also happens to have a keen (and somewhat unexpected) interest on perfumes.")
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding()
                                .font(.custom("Noteworthy-Regular", size: 20))
                            Text("I developed this game as part of the 2024's Swift Student Challenge.")
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding()
                                .font(.custom("Noteworthy-Regular", size: 20))
                            Text("Its objective is to help people that just started learning git commands, while also sharing a bit about perfume making in a playful and fun environment.")
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
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
