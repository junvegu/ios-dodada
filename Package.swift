// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dodada",
    platforms: [
        .iOS(.v16)
       ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Dodada",
            targets: ["Dodada"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Dodada",
            dependencies: [],
            resources: [.process("Resources/Fonts")]
            
        ),
        
        .testTarget(
            name: "DodadaTests",
            dependencies: ["Dodada"]),
        .executableTarget(name: "DodadaPreview", dependencies: ["Dodada"])
    ]
)
