// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "BLAKE3",
    products: [
        .library(
            name: "BLAKE3",
            targets: ["BLAKE3"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nixberg/crypto-traits-swift", from: "0.2.1"),
        .package(url: "https://github.com/nixberg/endianbytes-swift", "0.4.0"..<"0.5.0"),
        .package(url: "https://github.com/nixberg/hexstring-swift", from: "0.2.0"),
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "BLAKE3",
            dependencies: [
                .product(name: "Duplex", package: "crypto-traits-swift"),
                .product(name: "EndianBytes", package: "endianbytes-swift"),
                .product(name: "Algorithms", package: "swift-algorithms"),
            ]),
        .testTarget(
            name: "BLAKE3Tests",
            dependencies: [
                "BLAKE3",
                .product(name: "HexString", package: "hexstring-swift"),
            ],
            resources: [
                .copy("test_vectors.json")
            ]),
    ]
)
