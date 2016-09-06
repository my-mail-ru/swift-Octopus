import PackageDescription

let package = Package(
	name: "Octopus",
	targets: [
		Target(name: "COctopus"),
		Target(name: "Octopus", dependencies: [.Target(name: "COctopus")])
	]
)
