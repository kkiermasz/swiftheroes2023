// swift-tools-version:5.7
import PackageDescription

let package = Package(
  name: "MyPackage",
  defaultLocalization: "en_US",
  platforms: [
      .macOS(.v12),
  ],
  products: [
    .executable(name: "function-specialization", targets: ["FunctionSpecialization"]),
    .executable(name: "precomputation", targets: ["Precomputation"]),
    .executable(name: "inheritance-overriden", targets: ["InheritanceOverriden"]),
  ],
  dependencies: [],
  targets: [
    .executableTarget(
      name: "FunctionSpecialization",
      dependencies: []
    ),
    .executableTarget(
      name: "Precomputation",
      dependencies: []
    ),
    .executableTarget(
      name: "InheritanceOverriden",
      dependencies: []
    ),
  ]
)
