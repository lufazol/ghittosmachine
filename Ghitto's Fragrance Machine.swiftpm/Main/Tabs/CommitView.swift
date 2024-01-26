//
//  CommitView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct CommitView: View {
    @State private var texts = ["test", "test2", "test3"]
    @State private var data = ""
    @State private var bottles: [String] = ["bottle1", "bottle2", "bottle3", "bottle4"]

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
