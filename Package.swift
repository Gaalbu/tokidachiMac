// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TokidachiMac",
    platforms: [.macOS(.v13)],
    products: [.executable(name: "TokidachiMac", targets: ["TokidachiMac"])],
    targets: [
        .executableTarget(name: "TokidachiMac"),
        .testTarget(name: "TokidachiMacTests", dependencies: ["TokidachiMac"], resources: [.copy("Fixtures")])
    ]
)
