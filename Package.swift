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
                      checksum: "1b2aec4631f344e269c5227db6dc965a7e140af54c3813b17c21dc051f11db67"),
        .binaryTarget(name: "libcrypto",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libcrypto.xcframework.zip",
                      checksum: "ac762e36ed92561df60f737c10623970e63e4c051d032c3ce98546097c546f94"),
        .binaryTarget(name: "libssl",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.10.0+OpenSSL_1_1_1o/libssl.xcframework.zip",
                      checksum: "ce53ab9aad90bffb1a22da716ca02f74cc7c716a68b57f45b9fe4f35b59856bd")
    ]
)
