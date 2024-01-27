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
            .foregroundColor(.purple)
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
    }
}

#Preview {
    CommitView()
}
