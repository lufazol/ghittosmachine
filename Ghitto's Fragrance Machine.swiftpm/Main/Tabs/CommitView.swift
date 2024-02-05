//
//  CommitView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct CommitView: View {

    var body: some View {
        Rectangle()
            .foregroundColor(Color(hex: 0xFAE1DD))
            .edgesIgnoringSafeArea(.all)
            .overlay(
                HStack {
                    Spacer()
                    VStack {
                            Spacer()

                            BottlesButtonsView()
                            
                            Spacer()
                            
                            ResetHardButtonView()
                    }
                    Spacer()
                    CommitButtonView()
                }
            )
            .background(
                Rectangle()
                    .stroke(Color.black, lineWidth: 3)
            )
    }
}

#Preview {
    CommitView()
}
