// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(name: "Konfetti",
                      products: [
                        .library(name: "Konfetti", targets: ["Konfetti"]),
                      ],
                      targets: [
                        .target(name: "Konfetti")
                      ])
