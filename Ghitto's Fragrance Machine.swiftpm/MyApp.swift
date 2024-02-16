import SwiftUI

@main
struct MyApp: App {
    @StateObject var gameData = GameData()
    @StateObject var gameState = GameState()


    var body: some Scene {
        WindowGroup {
            MenuView()
                .environmentObject(gameData)
                .environmentObject(gameState)
                .preferredColorScheme(.light)
        }
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }

    init(hexString: String, alpha: Double = 1.0) {
        var hexSanitized = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        self.init(hex: UInt(rgb), alpha: alpha)
    }
}
