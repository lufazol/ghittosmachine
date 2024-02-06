//
//  Objects.swift
//  Ghitto's Fragrance Machine
//
//  Created by Luan Fazolin on 23/01/24.
//

import AVFoundation
import Foundation

class GameData: ObservableObject {
    @Published var addedNotes: [String] = []
    @Published var categories: [String] = ["top", "heart", "base"]
    @Published var topNotes: [String] = ["bergamot", "orange", "cherry"]
    @Published var heartNotes: [String] = ["rose", "jasmine", "pink pepper"]
    @Published var baseNotes: [String] = ["vanilla", "praline", "amber"]
    @Published var score: Int = 0
    @Published var perfumeReady: Perfume?
    @Published var order: Perfume?

    var possibleNotes: [String] = ["bergamot", "orange", "cherry", "rose", "jasmine", "pink pepper", "vanilla", "praline", "amber"]
    var possibleBottles: [String] = ["bottle1", "bottle2", "bottle3", "bottle4"]

    init() {
        self.order = Perfume()
        generateOrder()
    }

    func generateOrder() {
        var orderNotes: [String] = []
                
        let numberOfNotes = Int.random(in: 1...4)
        
        while orderNotes.count < numberOfNotes
        {
            let randomNote = possibleNotes[Int.random(in: 0...possibleNotes.count-1)]
            
            if !orderNotes.contains(randomNote)
            {
                orderNotes.append(randomNote)
            }
        }

        self.order?.notes = Array(orderNotes)
        
        self.order?.bottle = possibleBottles[Int.random(in: 0...possibleBottles.count-1)]
    }
}

class GameState: ObservableObject {
    @Published var tutorialCounter: Int = 0
    @Published var selectedCategory: String = "heart"
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
    @Published var perfumeBeingSent: Bool = false
    @Published var noPerfumeToSendWarning: Bool = false
    @Published var hasOrder: Bool = false
    @Published var wrongPerfumeWarning: Bool = false
    @Published var isInTutorial: Bool = false
    @Published var selectedBottle: String = ""
    @Published var isOnPlatform: Bool = false
    @Published var isMoving: Bool = false
    @Published var isDropping: Bool = false
    @Published var mixingShouldFall: Bool = false
    @Published var soundPlayer = SoundPlayer()
}

class Perfume: ObservableObject {
    @Published var bottle: String = ""
    @Published var notes: [String] = []
}

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound() {
        
        guard let url = Bundle.main.url(forResource: "platformSound", withExtension: ".mp3") else {return}

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound.")
        }
    }
}

class SoundPlayer {
    var audioPlayer: AVAudioPlayer?

    func playSound(named fileName: String, fileType: String = "mp3") {
        guard let path = Bundle.main.path(forResource: fileName, ofType: fileType) else {
            print("Sound file not found: \(fileName)")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            print(path)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
