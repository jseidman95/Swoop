// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swoop",
    platforms: [.iOS(.v16)],
    products: [
      // Products define the executables and libraries a package produces, and make them visible to other packages.
      .library(
        name: "Swoop",
        targets: ["Swoop"]
      ),
      .library(
        name: "Matchers",
        targets: ["Matchers"]
      )
    ],
    dependencies: [
      // Dependencies declare other packages that this package depends on.
      // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
      // Targets are the basic building blocks of a package. A target can define a module or a test suite.
      // Targets can depend on other targets in this package, and on products in packages this package depends on.
      .target(
        name: "Swoop",
        dependencies: [],
        path: "Sources/Swoop"
      ),
      .target(
        name: "Matchers",
        dependencies: ["Swoop"],
        path: "Sources/Matchers"
      ),
      .testTarget(
        name: "MatcherTests",
        dependencies: [
          "Swoop", "Matchers"
        ],
        path: "Tests/MatcherTests"
      ),
      .testTarget(
        name: "SwoopTests",
        dependencies: [
          "Swoop", "Matchers"
        ],
        path: "Tests/SwoopTests"
      )
    ]
)
