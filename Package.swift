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
                      checksum: "41edc1c13db36a3c4e8502fda88657633879d7ebf3a6f89469dbe4dc2c7d765d"),
        .binaryTarget(name: "libcrypto",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libcrypto.xcframework.zip",
                      checksum: "e5535aa3c58edada02c63d0a3de368b81d3934ffde741694775a04306b3acf2a"),
        .binaryTarget(name: "libssl",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libssl.xcframework.zip",
                      checksum: "13ef2b58f80fe095846bed50950eac236bdf908d6e6b2aab52fc707bb39a8ffa"),
        .binaryTarget(name: "libgit2",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libgit2.xcframework.zip",
                      checksum: "2aa6a16a7fc3c42a6def41e2f8d95b7f26346d25c9c750a308d7947bb3a1228f")
    ]
)
