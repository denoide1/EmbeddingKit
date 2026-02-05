// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "EmbedKit",
  platforms: [
    .macOS(.v14),
    .iOS(.v17),
  ],
  products: [
    .library(
      name: "EmbedKit",
      targets: ["EmbedKit"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.0.0"),
    .package(url: "https://github.com/ml-explore/mlx-swift-lm.git", from: "0.1.0"),
  ],
  targets: [
    .target(
      name: "EmbedKit",
      dependencies: [
        .product(name: "MLXEmbedders", package: "mlx-swift-lm"),
      ]
    ),
    .executableTarget(
      name: "EmbedCLI",
      dependencies: [
        "EmbedKit",
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ]
    ),
    .testTarget(
      name: "EmbedKitTests",
      dependencies: ["EmbedKit"]
    ),
  ]
)
