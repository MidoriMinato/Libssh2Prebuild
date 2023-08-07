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
                      checksum: "6cb6a7f1dc8a29fdb992e2c1bcf9631ace9f814c9d23b6d368f8d8cb412f9818"),
        .binaryTarget(name: "libcrypto",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libcrypto.xcframework.zip",
                      checksum: "28401e47c20fd40cc68eaae5e0ad5ddcd391abec27f48b27d12d6f05cc8cec4a"),
        .binaryTarget(name: "libssl",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libssl.xcframework.zip",
                      checksum: "287914810a44545034b32894b76181a246fcabec438e0942aa89cd2618598e42"),
        .binaryTarget(name: "libgit2",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libgit2.xcframework.zip",
                      checksum: "d4c0c4fa0b4ffd0fc744567765affa766c89b038707c5a46bce959c81b77fa35")
    ]
)
