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
                      checksum: "5e5197d1e61dc1dcde5912318ee905d509449db08ea579fd21a6bc22d0c9d0e3"),
        .binaryTarget(name: "libcrypto",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libcrypto-1.10.0+OpenSSL_1_1_1o.xcframework.zip",
                      checksum: "32ab8605ce363538f357dfc81976fdae9eaa627f881a1cc1a21d58368b44a801"),
        .binaryTarget(name: "libssl",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libssl-1.10.0+OpenSSL_1_1_1o.xcframework.zip",
                      checksum: "f8282b4bb6834be97de7857060a95aab4bfc77974052c16ddd93840e4bfa7522")
    ]
)
