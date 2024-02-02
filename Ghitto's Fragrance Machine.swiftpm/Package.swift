// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "Ghitto's Fragrance Machine",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "Ghitto's Fragrance Machine",
            targets: ["AppModule"],
            bundleIdentifier: "com.luanfazolin.Ghitto-s-Fragrance-Machine",
            teamIdentifier: "624QKDD2FC",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .flower),
            accentColor: .presetColor(.pink),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)