//
//  MainView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = "add"
    
    var body: some View {
        VStack {
            CustomerView()
                .frame(height: 90)
            MachineView()
                .frame(width: 396, height: 440)
            TabsView(selectedTab: $selectedTab)
                .frame(height: 35)
            if selectedTab == "add"
            {
                AddView()
            }
            else if selectedTab == "commit"
            {
                CommitView()
            }
            else if selectedTab == "push"
            {
                PushView()
            }
        }
    }
}

#Preview {
    MainView()
}
