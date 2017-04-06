import PackageDescription

let package = Package(
	name: "Octopus",
	targets: [
		Target(name: "Octopus"),
	],
	dependencies: [
		.Package(url: "https://github.com/my-mail-ru/swift-CIProto.git", versions: Version(0, 2, 0)..<Version(0, .max, .max)),
	]
)
