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
                      checksum: "cd0f9f6985ed4393a947e0f053a9ef930b7af2fb2f0f1d7b382b2376c6850f3d"),
        .binaryTarget(name: "libcrypto",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libcrypto-1.10.0+OpenSSL_1_1_1o.xcframework.zip",
                      checksum: "2941272692041a73e567408f063ea9e53fef4cb777b87c13b1f1b4f2dbdd1729"),
        .binaryTarget(name: "libssl",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libssl-1.10.0+OpenSSL_1_1_1o.xcframework.zip",
                      checksum: "effd670ae4bc9336d0fe941d29d0b12c343848445a8171fe50c636d24db99dc1")
    ]
)
