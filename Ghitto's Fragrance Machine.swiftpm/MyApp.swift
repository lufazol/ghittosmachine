import SwiftUI

@main
struct MyApp: App {
    @StateObject var gameData = GameData()
    @StateObject var gameState = GameState()


    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(gameData)
                .environmentObject(gameState)
        }
    }
}
