//
//  FontsView.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 01/02/24.
//

import SwiftUI

struct FontsView: View {
    var body: some View {
        List {
            ForEach(UIFont.familyNames, id: \.self) { family in
                Section(header: Text(family)) {
                    ForEach(UIFont.fontNames(forFamilyName: family), id: \.self) { font in
                        Text(font)
                            .font(.custom(font, size: 20))
                    }
                }
            }
        }
    }
}

#Preview {
    FontsView()
}
