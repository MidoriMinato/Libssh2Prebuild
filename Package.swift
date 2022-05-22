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
                      checksum: "10801daad29851208dc570e58fd35b4052595d00c0e88302c68171af13528266"),
        .binaryTarget(name: "libcrypto",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libcrypto-1.10.0+OpenSSL_1_1_1o.xcframework.zip",
                      checksum: "a958d4ef6ff3bc297830cd73717f460ee72e65abd013d93cafce4c0a9575d31b"),
        .binaryTarget(name: "libssl",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libssl-1.10.0+OpenSSL_1_1_1o.xcframework.zip",
                      checksum: "d8ae11dac5169a3f092163b26dbd613d08e0343345f82f2979c4b569e016bdf9")
    ]
)
