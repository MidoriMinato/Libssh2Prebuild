# Libssh2Prebuild

This is a forked project from [original Libssh2Prebuild](https://github.com/DimaRU/Libssh2Prebuild). Differences are as follows.

* Changed to Swift Package.
* Libssl, libcrypto are added in the release binary.

### Supported platforms and architectures
| Platform          |  Architectures     |
|-------------------|--------------------|
| macOS             | x86_64 arm64       |
| iOS               | arm64 armv7 armv7s |
| iOS Simulator     | x86_64 arm64       |
| watchOS           | armv7k arm64_32    |
| watchOS Simulator | x86_64 arm64       |
| tvOS              | arm64              |
| tvOS Simulator    | x86_64 arm64       |
| mac Catalyst      | x86_64 arm64       |

## Installation

Add Libssh2Prebuild package with Xcode Swift Package Manager. Enter the following URL in the search box.

`https://github.com/MidoriMinato/Libssh2Prebuild`

You can select which libraries you use.
