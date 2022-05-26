// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SSH2",
    products: [
        .library(name: "libssh2", targets: ["libssh2"]),
        .library(name: "libcrypto", targets: ["libcrypto"]),
        .library(name: "libssl", targets: ["libssl"]),
        .library(name: "libgit2", targets: ["libgit2"])
    ],
    targets: [
        .binaryTarget(name: "libssh2",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libssh2.xcframework.zip",
                      checksum: "8be541f0a7a9284c46223b4319ddc77650565963264e4e436121b2da075cfe55"),
        .binaryTarget(name: "libcrypto",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libcrypto.xcframework.zip",
                      checksum: "68df7cf4d6bee3c8b4b28ccac04f0161875d11366ab81a05ceb604576564faf6"),
        .binaryTarget(name: "libssl",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libssl.xcframework.zip",
                      checksum: "ffa6d9acded640438ef01cf6b831b303530cf1d554b681d7324a9454217ac0ff"),
        .binaryTarget(name: "libgit2",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libgit2.xcframework.zip",
                      checksum: "d52687fb5f4142abaf93e7602822c28828c76c9a02bb4338f91911aefbe5028a")
    ]
)
