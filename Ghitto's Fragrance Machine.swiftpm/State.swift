//
//  Objects.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 23/01/24.
//

import Foundation

class GameData: ObservableObject {
    @Published var addedNotes: [String] = []
    @Published var perfumeReady: Perfume?
}

class GameState: ObservableObject {
    @Published var bottleToAdd: String =  ""
    @Published var exceededNotesWarning: Bool = false
    @Published var noteAdded: Bool = false
    @Published var noNotesAdded: Bool = false
    @Published var noPerfumeReadyWarning: Bool = false
    @Published var noteAlreadyAdded: Bool = false
    @Published var noBottleSelectedWarning: Bool = false
    @Published var notesCleaned: Bool = false
    @Published var noteToAdd: String = "rose"
    @Published var perfumeRemoved: Bool = false
    @Published var perfumeBeingAdded: Bool = false
    @Published var perfumeOnLog: Bool = false
    @Published var logIsFullWarning: Bool = false
    @Published var selectedTab: String = "add"
}

class Perfume: ObservableObject {
    @Published var bottle: String = ""
    @Published var notes: [String] = []
}
