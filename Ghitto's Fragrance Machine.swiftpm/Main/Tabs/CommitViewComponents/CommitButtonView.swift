//
//  CommitButtonView.swift
//
//
//  Created by Luan Fazolin on 26/01/24.
//

import SwiftUI

struct CommitButtonView: View {
    var body: some View {
        Button(action: {}) {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .padding()
                .foregroundColor(.red)
        }
        .padding(.trailing)
    }
}

#Preview {
    CommitButtonView()
}
