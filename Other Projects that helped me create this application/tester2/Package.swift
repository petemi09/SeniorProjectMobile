// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "tester2",
    
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "tester2",
            targets: ["tester2"]),
    ],
//    dependencies: [
//        // Dependencies declare other packages that this package depends on.
//        // .package(url: /* package url */, from: "1.0.0"),
//        .package(url: "https://github.com/mongodb/mongo-swift-driver.git", from: "1.13.0"),
//    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
//        .target(
//            name: "tester2",
//            dependencies: ["MongoSwift"]),
        
        .testTarget(
            name: "tester2Tests",
            dependencies: ["tester2"])
    ]
)

// swift-tools-version:4.0
//import PackageDescription
//
//let package = Package(
//    name: "MyPackage",
//    dependencies: [
//        .package(url: "https://github.com/mongodb/mongo-swift-driver.git", from: "VERSION.STRING.HERE"),
//        ],
//    targets: [
//        .target(name: "MyPackage", dependencies: ["MongoSwift"])
//    ]
//)
