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
                      checksum: "766e9d92fd1a31d1fed43cea92d060ba35fbc23d7dda0c55fc860fe778bb043e"),
        .binaryTarget(name: "libcrypto",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libcrypto.xcframework.zip",
                      checksum: "6a6f92bba102c14d0f9ab11caab04ddef3053e78806d050c51aa3aba81ae496a"),
        .binaryTarget(name: "libssl",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libssl.xcframework.zip",
                      checksum: "8880e1af4580ff82ccb252514db226665a35759192a9ce25bea1d06dd78d149b"),
        .binaryTarget(name: "libgit2",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libgit2.xcframework.zip",
                      checksum: "bbaa8121a64f877a9d784258c68708ac47984724f7d0209db05441c00f032fc3")
    ]
)
