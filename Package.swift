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
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libssh2-1.10.0+OpenSSL_1_1_1o.xcframework.zip",
                      checksum: "986bf47df3855311517697c1c069823776a4c2447510294aea70301c22b5f15d"),
        .binaryTarget(name: "libcrypto",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libcrypto-1.10.0+OpenSSL_1_1_1o.xcframework.zip",
                      checksum: "f4f7637f9b8f7089a050bae53d2e542933e11396eef7c07c08ab89d9d9cf1756"),
        .binaryTarget(name: "libssl",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libssl-1.10.0+OpenSSL_1_1_1o.xcframework.zip",
                      checksum: "ed78af84dcfe0b006f89f5fb10c0d90cb1f9b49c9a996309aa2fa3adb45f67ca")
    ]
)
