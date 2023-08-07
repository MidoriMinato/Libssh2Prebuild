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
                      checksum: "37f39c6842451e08708ab76f043098fcf021b2a6c01cd1746aada0d9b43a89b0"),
        .binaryTarget(name: "libcrypto",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libcrypto.xcframework.zip",
                      checksum: "5447cf5f07c4e8ea92acffcd9dc81de59f04805c6c6a444556d2d7dd949b75a6"),
        .binaryTarget(name: "libssl",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libssl.xcframework.zip",
                      checksum: "8555cfacdd89bd558898dd021ccca88c629d6900485a6bc9044efbec7002ce63"),
        .binaryTarget(name: "libgit2",
                      url: "https://github.com/MidoriMinato/Libssh2Prebuild/releases/download/1.11.0+OpenSSL_1_1_1v/libgit2.xcframework.zip",
                      checksum: "a1d333e777971ac19311ee62f7584ccae51d7754d2b51e8d074b98655a72014f")
    ]
)
