//
//  PushView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct PushView: View {
    var body: some View {
        Color.orange
            .edgesIgnoringSafeArea(.all)
            .overlay(
                Text("Push View")
                    .foregroundColor(.white)
                    .padding()
            )
    }
}

#Preview {
    PushView()
}
