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
                      checksum: "6b38278296ee8a2b97413a9044602ecb7c562ebda3c300e34e9dfb50477ac439"),
        .binaryTarget(name: "libcrypto",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libcrypto-1.10.0+OpenSSL_1_1_1o.xcframework.zip",
                      checksum: "4a3ac91c275033672f922d6ce3c312e1a6a8d34b691b696c5462f8a471f0460a"),
        .binaryTarget(name: "libssl",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libssl-1.10.0+OpenSSL_1_1_1o.xcframework.zip",
                      checksum: "31bc901c859ff8580d9cfe4317c012288ff53400e70b5e50417e63d3146c3191")
    ]
)
