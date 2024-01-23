//
//  CustomerView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 22/01/24.
//

import SwiftUI

struct CustomerView: View {
    var body: some View {
        Color.blue
            .edgesIgnoringSafeArea(.all)
            .overlay(
                Text("Customer area")
                    .foregroundColor(.white)
                    .padding()
            )
    }
}

#Preview {
    CustomerView()
}
