// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SSH2",
    products: [
        .library(name: "libssh2", targets: ["libssh2"]),
        .library(name: "libcrypto", targets: ["libcrypto"]),
        .library(name: "libssl", targets: ["libssl"])
    ],
    targets: [
        .binaryTarget(name: "libssh2",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libssh2.xcframework.zip",
                      checksum: "924c79c482ed9ca582a8cbab90e138786eb2fc30af22bab111f6f82ad5fae23f"),
        .binaryTarget(name: "libcrypto",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libcrypto.xcframework.zip",
                      checksum: "625a667d23f04d2808f02d76e12cc5fc0da7099fd4b8aac5c5277690c9b617e8"),
        .binaryTarget(name: "libssl",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libssl.xcframework.zip",
                      checksum: "1741b458bbae2ef4580c8fa486b7b89ef122baebe646eb089f7116ce8f9f2c56")
    ]
)
