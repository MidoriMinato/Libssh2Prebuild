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
                      checksum: "17ec50bb37366b9020df1a5fb58b9c5dd20e84720c0b0f57b84d634e17f19991"),
        .binaryTarget(name: "libcrypto",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libcrypto.xcframework.zip",
                      checksum: "56080537ae65ced50b11c29248432456cf0a9a8f34a5599352cb07d6cf0ea9af"),
        .binaryTarget(name: "libssl",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libssl.xcframework.zip",
                      checksum: "f85d6ccb162f705ec08fbd0cab40c7d605e8c88f78ae5fb39f8f78a344c7a8c1"),
        .binaryTarget(name: "libgit2",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libgit2.xcframework.zip",
                      checksum: "68219d1aee5ab1f8a9d8cd028c7e39eba6f9f6aed3a28c78644743ece7c77ca1")
    ]
)
