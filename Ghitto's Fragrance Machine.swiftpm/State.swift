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
    @Published var topNotes: [String] = ["bergamot", "cherry", "grapefruit", "lavender", "mint", "peach", "pitanga"]
    @Published var heartNotes: [String] = ["cinnamon", "geranium", "jasmine", "pink pepper", "rose", "tuberose", "ylang-ylang"]
    @Published var baseNotes: [String] = ["amber", "musk", "patchouli", "praline", "sandalwood", "tonka bean", "vanilla"]
    @Published var score: Int = 0
    @Published var highestScore: Int = 0
    @Published var ordersDelivered: Int = 0
    @Published var lastOrderBottle: String = "emptybottle1"
    @Published var timer: Timer? = nil
    @Published var perfumeReady: Perfume?
    @Published var order: Perfume?

    var possibleNotes: [String] = ["bergamot", "cherry", "grapefruit", "lavender", "mint", "peach", "pitanga", "cinnamon", "geranium", "jasmine", "pink pepper", "rose", "tuberose", "ylang-ylang", "amber", "musk", "patchouli", "praline", "sandalwood", "tonka bean", "vanilla"]
    var possibleBottles: [String] = ["bottle1", "bottle2", "bottle3", "bottle4"]

    init() {
        self.order = Perfume()
        generateOrder()
    }

    func generateOrder() {
        var orderNotes: [String] = []
        
        let randomTopNote = topNotes[Int.random(in: 0...topNotes.count-1)]
        let randomHeartNote = heartNotes[Int.random(in: 0...heartNotes.count-1)]
        let randomBaseNote = baseNotes[Int.random(in: 0...baseNotes.count-1)]
        
        orderNotes.append(randomTopNote)
        orderNotes.append(randomHeartNote)
        orderNotes.append(randomBaseNote)

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
    @Published var noteToAdd: String = "jasmine"
    @Published var lastNoteAdded: String = "jasmine"
    @Published var perfumeRemoved: Bool = false
    @Published var perfumeBeingAdded: Bool = false
    @Published var perfumeOnLog: Bool = false
    @Published var logIsFullWarning: Bool = false
    @Published var selectedTab: String = "add"
    @Published var perfumeBeingSent: Bool = false
    @Published var noPerfumeToSendWarning: Bool = false
    @Published var hasOrder: Bool = false
    @Published var wrongPerfumeWarning: Bool = false
    @Published var isInTutorial: Bool = true
    @Published var selectedBottle: String = ""
    @Published var isOnPlatform: Bool = false
    @Published var isMoving: Bool = false
    @Published var addLeverIsDown: Bool = false
    @Published var isDropping: Bool = false
    @Published var mixingShouldFall: Bool = false
    @Published var soundPlayer1 = SoundPlayer()
    @Published var soundPlayer2 = SoundPlayer()
    @Published var soundPlayer3 = SoundPlayer()
    @Published var errorSoundPlayer = SoundPlayer()
    @Published var backgroundSoundPlayer = SoundPlayer()
    @Published var menuBackgroundPlayer = SoundPlayer()
    @Published var isShowingAbout: Bool = false
    @Published var isPlaying: Bool = false
    @Published var firstOrderFinished: Bool = false
    @Published var tutorialEnded: Bool = false
    @Published var menuAnimationsAreOn: Bool = false
    @Published var isOnPlayAgainScreen: Bool = false
    @Published var secondsRemaining: Int = 60
}

class Perfume: ObservableObject {
    @Published var bottle: String = ""
    @Published var notes: [String] = []
}

class SoundPlayer {
    var audioPlayer: AVAudioPlayer?

    func playSound(named fileName: String, fileType: String = "mp3", volume: Float = 0.4, loops: Int = 0) {
        guard let path = Bundle.main.path(forResource: fileName, ofType: fileType) else {
            print("Sound file not found: \(fileName)")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.volume = volume
            audioPlayer?.numberOfLoops = loops
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func stopSound()
    {
        audioPlayer?.stop()
    }
}
