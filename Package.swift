// swift-tools-version:4.0
import PackageDescription

let package = Package(
	name: "Octopus",
	products: [
		.library(name: "Octopus", targets: ["Octopus"]),
	],
	dependencies: [
		.package(url: "https://github.com/my-mail-ru/swift-CIProto.git", from: "0.2.1"),
	],
	targets: [
		.target(name: "Octopus"),
		.testTarget(name: "OctopusTests", dependencies: ["Octopus"]),
	]
)
