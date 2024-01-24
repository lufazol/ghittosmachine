import SwiftUI

@main
struct MyApp: App {
    @StateObject var gameData = GameData()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(gameData)
        }
    }
}
