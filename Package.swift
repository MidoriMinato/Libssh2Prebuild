// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "libssh2",
    products: [
        .library(name: "libssh2", targets: ["dummy","libssh2"]),
        .library(name: "libcrypto", targets: ["dummy","libcrypto"]),
        .library(name: "libssl", targets: ["dummy","libssl"]),
        .library(name: "libgit2", targets: ["dummy","libgit2"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "dummy"),
        .binaryTarget(name: "libssh2",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libssh2.xcframework.zip",
                      checksum: "1496934ebf474e2883b01bc656968fe32f3174f5f783ddbe3f75ddca0616199c"),
        .binaryTarget(name: "libcrypto",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libcrypto.xcframework.zip",
                      checksum: "b4ba3bb2e52ebb3db70b825e6710570b1297ad89b78c60744ad77d965c2deb2d"),
        .binaryTarget(name: "libssl",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libssl.xcframework.zip",
                      checksum: "5f8e82c927099daa51f9e3e6f769e58fe97d3c2d302385096fb0ec24a26023ba"),
        .binaryTarget(name: "libgit2",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libgit2.xcframework.zip",
                      checksum: "8dec0b92560e1cd72495f670500e55e27cc18753153154a1a30d0cf641bb154d")
    ]
)
