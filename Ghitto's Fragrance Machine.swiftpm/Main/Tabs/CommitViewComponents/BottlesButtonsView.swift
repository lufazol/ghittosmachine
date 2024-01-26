//
//  BottlesButtonsView.swift
//
//
//  Created by Luan Fazolin on 26/01/24.
//

import SwiftUI

struct BottlesButtonsView: View {
    var size: CGFloat = 60
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button(action: {}) {
                    Image("bottle1")
                        .resizable()
                        .frame(width: size, height: size)
                }
                .padding(.horizontal)
                Button(action: {}) {
                    Image("bottle2")
                        .resizable()
                        .frame(width: size, height: size)
                }
                .padding(.horizontal)
            }
            HStack {
                Button(action: {}) {
                    Image("bottle3")
                        .resizable()
                        .frame(width: size, height: size)
                }
                .padding(.horizontal)
                Button(action: {}) {
                    Image("bottle4")
                        .resizable()
                        .frame(width: size, height: size)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    BottlesButtonsView()
}
