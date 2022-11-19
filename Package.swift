// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "libssh2",
    platforms: [
        .macOS(.v10_14), .iOS(.v13)
    ],
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
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libssh2.xcframework.zip",
                      checksum: "ea9fc91f6ab9c00ea0886907c8980f3dcf7da389e6ccaf205ee3f929a9a9d6da"),
        .binaryTarget(name: "libcrypto",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libcrypto.xcframework.zip",
                      checksum: "703ecf79c39ad8ddc6c7dd0bb55e458191e4151f1264c5b834f77dbd9632a766"),
        .binaryTarget(name: "libssl",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libssl.xcframework.zip",
                      checksum: "f89db4a9ed479db6415db6ee2c63b15790e2c7710cfe5e939b11f7b12370332b"),
        .binaryTarget(name: "libgit2",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libgit2.xcframework.zip",
                      checksum: "27604f890c4d43885c1bf21d16d2924ffbe6e370c1f482693a75695572bdced8")
    ]
)
