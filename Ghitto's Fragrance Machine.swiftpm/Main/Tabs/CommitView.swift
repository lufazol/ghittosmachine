//
//  CommitView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct CommitView: View {
    var body: some View {
        Color.purple
            .edgesIgnoringSafeArea(.all)
            .overlay(
                Text("Commit View")
                    .foregroundColor(.white)
                    .padding()
            )
    }
}

#Preview {
    CommitView()
}
