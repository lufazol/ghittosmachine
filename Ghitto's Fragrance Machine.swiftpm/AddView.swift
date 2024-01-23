//
//  AddView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct AddView: View {
    var body: some View {
        Color.blue
            .edgesIgnoringSafeArea(.all)
            .overlay(
                Text("Add View")
                    .foregroundColor(.white)
                    .padding()
            )
    }
}

#Preview {
    AddView()
}
