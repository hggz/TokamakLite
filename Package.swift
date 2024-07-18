// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TokamakLite",
    platforms: [
      .macOS(.v11),
      .iOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TokamakLite",
            targets: ["TokamakLite"]),
    ],
    dependencies: [
      .package(
        url: "https://github.com/OpenCombine/OpenCombine.git",
        from: "0.12.0"
      ),
    ],
    targets: [
        .target(
          name: "TokamakCore",
          dependencies: [
            .product(
              name: "OpenCombineShim",
              package: "OpenCombine"
            ),
          ]
        ),
        .target(
          name: "TokamakStaticHTML",
          dependencies: [
            "TokamakCore",
          ]
        ),
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "TokamakLite",
            dependencies: [
                "TokamakStaticHTML"
            ]
        ),
        .testTarget(
            name: "TokamakLiteTests",
            dependencies: ["TokamakLite"]),
    ]
)
