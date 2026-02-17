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
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "2.0.0"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSVGCoder.git", from: "1.4.0")
    ],
    targets: [
        .target(
            name: "Dodada",
            dependencies: [
                .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI"),
                .product(name: "SDWebImageSVGCoder", package: "SDWebImageSVGCoder")
            ],
            resources: [
                   .process("Resources/Fonts"),
                   .process("Resources/Assets/Countries.json")
               ]
        ),
        
        .testTarget(
            name: "DodadaTests",
            dependencies: ["Dodada"]
        )
    ]
)

