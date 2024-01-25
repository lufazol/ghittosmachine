//
//  Objects.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 23/01/24.
//

import Foundation

class GameData: ObservableObject {
    @Published var selectedNote: String = "vanilla"
    @Published var addedNotes: [String] = []
    @Published var perfumesReady: [Perfume] = []
}

class GameState: ObservableObject {
    @Published var exceededNotesWarning: Bool = false
    @Published var noteAdded: Bool = false
    @Published var noNotesAdded: Bool = false
    @Published var noteAlreadyAdded: Bool = false
    @Published var notesCleaned: Bool = false
    @Published var noteToAdd: String = "rose"
}

class Perfume: ObservableObject {
    @Published var bottle: String = ""
    @Published var notes: [String] = []
}
