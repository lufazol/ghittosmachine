//
//  TutorialView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 30/01/24.
//

import SwiftUI

struct TutorialView: View {
    @EnvironmentObject var gameState: GameState
    @State var isFocusingElement: Bool = false
    @State var isOpaque: Bool = true

    var tutorialTexts: [String] = [
        "Oh! What a relief, you're in time.\nThe customers are almost here.",
        "We usually don't accept humans for this position, but I guess you'll have to do.",
        "So, at the top of the machine's screen you have the customer's order.\nYou can see the bottle and the notes they want for their perfume.",
        "The first command to make a perfume in our fragrance machine is git add.\nIt adds a specific scent to a fragrance.",
        "To add notes to a fragrance, switch to the add tab of the machine...",
        "Perfumes have top, heart and base notes. Use the left picker to select the category, and the right picker to select a note.",
        "After that, pull the lever on the right to add the note to the mixing.\nSince perfumes have top, heart and base notes, you will repeat this process three times.",
        "You can see the added notes on the git status panel.",
        "And, in case you have added the wrong notes, you can press git restore . to clean them and start again.",
        "Second step: go to the commit tab to pick the bottle for the perfume.",
        "Here you just need to select the bottle that the customer asked for.",
        "After that, pull the lever again to fill it with the perfume mixing.",
        "You can see the finished perfume on the git log panel.",
        "To throw away a finished perfume -- in case you've done something wrong --, tap the git reset --hard HEADˆ button.",
        "But let us be optimistic! If the perfume is as ordered, you can finally switch the machine to the push tab...",
        "And press the send button to 'push' it to the customer!",
        "Speaking of customers, your first real customer just arrived!!!\nBest of luck with your first order -- and chop-chop, off to work!"
        
    ]
    
    func checkTutorialScreen() -> String {
        
        if gameState.tutorialCounter < 5
        {
            return "screen1"
        } else if gameState.tutorialCounter == 5 || gameState.tutorialCounter == 6 {
            return "screen2"
        } else if gameState.tutorialCounter == 7 || gameState.tutorialCounter == 8 {
            return "screen3"
        } else if gameState.tutorialCounter < 12 {
            return "screen4"
        } else if gameState.tutorialCounter < 14 {
            return "screen5"
        } else {
            return "screen6"
        }
    }
    
    func checkDialogBoxOffset() -> CGFloat {
        if gameState.tutorialCounter != 12 {
            return -20
        } else {
            return -160
        }
    }
    
    func getGhittoImage() -> String {
        if gameState.tutorialCounter == 1 ||
            gameState.tutorialCounter == 8 ||
            gameState.tutorialCounter == 13
        {
            return "ghitto3"
        }
        else if gameState.tutorialCounter == 2 ||
                    gameState.tutorialCounter == 3 ||
                    gameState.tutorialCounter == 4 ||
                    gameState.tutorialCounter == 7 ||
                    gameState.tutorialCounter == 10 ||
                    gameState.tutorialCounter == 14
        {
            return "ghitto1"
        }
        else {
            return "ghitto2"
        }
    }
    
    var body: some View {
        ZStack {
            Image(checkTutorialScreen())
                .resizable()
                .opacity(isOpaque ? 0.4: 0.9)
                .ignoresSafeArea()
                .overlay(
                    ZStack {

                        // focus on order
                        if gameState.tutorialCounter == 2
                        {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.clear)
                                .frame(width: 260, height: 110)
                                .overlay(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: -3, y: -335)
                        }
                        // focus on add tab
                        else if gameState.tutorialCounter == 4 {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.clear)
                                .frame(width: 140, height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: -120, y: 165)
                        }
                        // focus on pickers and order note
                        else if gameState.tutorialCounter == 5 {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.clear)
                                .frame(width: 120, height: 140)
                                .overlay(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: 10, y: 265)
                            
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.clear)
                                .frame(width: 120, height: 140)
                                .overlay(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: -120, y: 265)
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.clear)
                                .frame(width: 160, height: 90)
                                .overlay(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: 30, y: -335)
                        }
                        // focus on lever
                        else if gameState.tutorialCounter == 6 {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.clear)
                                .frame(width: 60, height: 160)
                                .overlay(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: 135, y: 285)
                        }
                        // focus on git status panel
                        else if gameState.tutorialCounter == 7 {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.clear)
                                .frame(width: 210, height: 145)
                                .overlay(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: 70, y: -192)
                        }
                        // focus on git restore
                        else if gameState.tutorialCounter == 8 {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.clear)
                                .frame(width: 270, height: 60)
                                .overlay(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: -55, y: 360)
                        }
                        // focus on git commit tab
                        else if gameState.tutorialCounter == 9 {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.clear)
                                .frame(width: 140, height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: 0, y: 165)
                        }
                        // focus on bottle and order bottle
                        else if gameState.tutorialCounter == 10 {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.clear)
                                .frame(width: 90, height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: -125, y: 302)
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.clear)
                                .frame(width: 80, height: 80)
                                .overlay(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: -65, y: -335)
                        }
                        // focus on lever
                        else if gameState.tutorialCounter == 11 {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.clear)
                                .frame(width: 60, height: 160)
                                .overlay(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: 135, y: 285)
                        }
                        // focus on git log panel
                        else if gameState.tutorialCounter == 12 {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.clear)
                                .frame(width: 220, height: 150)
                                .overlay(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: 70, y: 0)
                        }
                        // focus on git reset hard
                        else if gameState.tutorialCounter == 13 {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.clear)
                                .frame(width: 270, height: 60)
                                .overlay(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: -55, y: 360)
                        }
                        // focus on push tab
                        else if gameState.tutorialCounter == 14 {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.clear)
                                .frame(width: 140, height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: 120, y: 165)
                        }
                        // focus on push button
                        else if gameState.tutorialCounter == 15 {
                            Circle()
                                .fill(Color.clear)
                                .frame(width: 170, height: 170)
                                .overlay(
                                    Circle()
                                        .stroke(Color.pink, lineWidth: isFocusingElement ? 10 : 0)
                                )
                                .offset(x: 0, y: 284)
                        }
                    }
                )
            
            ZStack {
                VStack {
                    Text(tutorialTexts[gameState.tutorialCounter])
                        .foregroundColor(.black)
                        .font(.custom("Noteworthy-Bold", size: 20))
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width: 290)
                        .padding()
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.black, lineWidth: 3)
                                    )
                                
                                Spacer()
                                

                            }

                        )

                    HStack {
                        Image(getGhittoImage())
                            .resizable()
                            .frame(width: 120, height: 120)
                        Spacer()
                        if gameState.tutorialCounter > 0
                        {
                            Button(action: {
                                gameState.tutorialCounter -= 1
                                gameState.soundPlayer1.playSound(named: "tutorialButton", volume: 0.36)
                            }) {
                                Image(systemName: "arrow.left.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.pink)
                                    .imageScale(.large)
                            }
                        }

                        Button(action: {
                            if gameState.tutorialCounter < tutorialTexts.count - 1
                            {
                                gameState.tutorialCounter += 1
                                gameState.soundPlayer2.playSound(named: "tutorialButton", volume: 0.36)
                                withAnimation(Animation.default.repeatForever()) {
                                    isFocusingElement.toggle()
                                }
                                
                                if gameState.tutorialCounter == 2 ||
                                    (gameState.tutorialCounter >= 4 &&
                                    gameState.tutorialCounter != 16)
                                {
                                    isOpaque = false
                                }
                                else {
                                    isOpaque = true
                                }
                            } else if gameState.tutorialCounter == tutorialTexts.count - 1 {
                                gameState.isInTutorial = false
                            }
                        }) {
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.pink)
                                .imageScale(.large)
                            
                        }
                        .padding()
                    }
                    .offset(y: -10)

                }
            }
            .offset(y: checkDialogBoxOffset())
            .frame(width: 330, height: 200)
        }
    }
}

#Preview {
    TutorialView()
}
