// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Dodada",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Dodada",
            targets: ["Dodada"]),
    ],
    dependencies: [
        // Agregamos la dependencia de SDWebImageSwiftUI
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "Dodada",
            dependencies: [
                .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI")
            ],
            resources: [.process("Resources/Fonts")]
        ),
        
        .testTarget(
            name: "DodadaTests",
            dependencies: ["Dodada"]
        ),
        
        .executableTarget(
            name: "DodadaPreview",
            dependencies: ["Dodada"]
        )
    ]
)

