//
//  TabsView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct TabsView: View {
    @Binding var selectedTab: String

    var body: some View {
        HStack {
            Button("git add") {
                // Action for Button 1
                selectedTab = "add"
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)

            Button("git commit -m") {
                // Action for Button 2
                selectedTab = "commit"
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            
            Button("git push") {
                // Action for Button 3
                selectedTab = "push"
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
        }
        .padding()
    }
}

#Preview {
    TabsView(selectedTab: .constant("add"))
}
