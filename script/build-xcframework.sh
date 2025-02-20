#!/bin/bash
#
# build_xctframework.sh
# Copyright © 2020 Dmitriy Borovikov. All rights reserved.
#

#Functions
fetchSource () {
  local url=$1
  local filename=$2
  local path=$3
  local file=$BUILD/$filename

  mkdir -p "$path"
  echo "Downloading $filename"
  curl -L -S -s "$url" --output "$file"
  local md5
  md5=$(md5 -q "$file")
  echo "MD5: $md5"

  tar -zxkf "$file" -C "$path" --strip-components 1 2>&-
  rm -f "$file"
}

buildLibrary () {
  export BUILT_PRODUCTS_DIR=$1
  export SDK_PLATFORM=$2
  export PLATFORM=$3
  export EFFECTIVE_PLATFORM_NAME=$4
  export ARCHS=$5
  export MIN_VERSION=$6

  "$ROOT_PATH/script/build-openssl.sh"
  "$ROOT_PATH/script/build-libssh2.sh"
  if [[ $PLATFORM == iPhoneOS ]] || [[ $PLATFORM == iPhoneSimulator ]] || [[ $PLATFORM == MacOSX ]]; then
	"$ROOT_PATH/script/build-libgit2.sh"
  fi

#  rm -rf "$TEMPPATH"
}


#====================================================================#

set -e

#Config

BUILD_THREADS=$(sysctl hw.ncpu | awk '{print $2}')
export BUILD_THREADS
LIBSSH_TAG=1.11.0
LIBSSL_TAG=OpenSSL_1_1_1v
LIBGIT_TAG=v1.3.1

TAG=$LIBSSH_TAG+$LIBSSL_TAG
ZIPNAME_SSH2=libssh2.xcframework.zip
ZIPNAME_CRYPTO=libcrypto.xcframework.zip
ZIPNAME_SSL=libssl.xcframework.zip
ZIPNAME_GIT2=libgit2.xcframework.zip
GIT_REMOTE_URL_UNFINISHED=$(git config --get remote.origin.url|sed "s=^ssh://==; s=^https://==; s=:=/=; s/git@//; s/.git$//;")
DOWNLOAD_URL_SSH2=https://$GIT_REMOTE_URL_UNFINISHED/releases/download/$TAG/$ZIPNAME_SSH2
DOWNLOAD_URL_CRYPTO=https://$GIT_REMOTE_URL_UNFINISHED/releases/download/$TAG/$ZIPNAME_CRYPTO
DOWNLOAD_URL_SSL=https://$GIT_REMOTE_URL_UNFINISHED/releases/download/$TAG/$ZIPNAME_SSL
DOWNLOAD_URL_GIT2=https://$GIT_REMOTE_URL_UNFINISHED/releases/download/$TAG/$ZIPNAME_GIT2

ROOT_PATH=$(cd "$(dirname "$0")/.."; pwd -P)
export ROOT_PATH
pushd "$ROOT_PATH" > /dev/null

export BUILD=$ROOT_PATH/build
export TEMPPATH=$ROOT_PATH/temp

export LIBSSLDIR="$TEMPPATH/openssl"
export LIBSSHDIR="$TEMPPATH/libssh2"
export LIBGITDIR="$TEMPPATH/libgit2"
export OPENSSL_SOURCE="$BUILD/openssl/src/"
export LIBSSH_SOURCE="$BUILD/libssh2/src/"
export LIBGIT_SOURCE="$BUILD/libgit2/src/"

#Download

if [[ -d "$OPENSSL_SOURCE" ]] && [[ -d "$LIBSSH_SOURCE" ]] && [[ -d "$LIBGIT_SOURCE" ]]; then
  echo "Sources already downloaded"
else
  fetchSource "https://github.com/libssh2/libssh2/releases/download/libssh2-$LIBSSH_TAG/libssh2-$LIBSSH_TAG.tar.gz" "libssh2.tar.gz" "$LIBSSH_SOURCE"
  fetchSource "https://github.com/openssl/openssl/archive/$LIBSSL_TAG.tar.gz" "openssl.tar.gz" "$OPENSSL_SOURCE"
  fetchSource "https://github.com/libgit2/libgit2/archive/$LIBGIT_TAG.tar.gz" "libgit2.tar.gz" "$LIBGIT_SOURCE"
fi

#Build

#buildLibrary () {
#export BUILT_PRODUCTS_DIR=$1
#export SDK_PLATFORM=$2
#export PLATFORM=$3
#export EFFECTIVE_PLATFORM_NAME=$4
#export ARCHS=$5
#export MIN_VERSION=$6

buildLibrary "$BUILD/iphoneos" "iphoneos" "iPhoneOS" "" "armv7 armv7s arm64" "9.0"
buildLibrary "$BUILD/iphonesimulator" "iphonesimulator" "iPhoneSimulator" "" "x86_64 arm64" "9.0"
buildLibrary "$BUILD/macosx" "macosx" "MacOSX" "" "x86_64 arm64" "10.10"
buildLibrary "$BUILD/maccatalyst" "macosx" "MacOSX" "-maccatalyst" "x86_64 arm64" "10.15"
buildLibrary "$BUILD/appletvsimulator" "appletvsimulator" "AppleTVSimulator" "" "x86_64 arm64" "9.0"
buildLibrary "$BUILD/appletvos" "appletvos" "AppleTVOS" "" "arm64" "9.0"
buildLibrary "$BUILD/watchsimulator" "watchsimulator" "WatchSimulator" "" "x86_64 arm64" "2.0"
buildLibrary "$BUILD/watchos" "watchos" "WatchOS" "" "armv7k arm64_32" "2.0"

#Create xcramework (libssh2)

xcodebuild -create-xcframework \
 -library "$BUILD/macosx/lib/libssh2.a" \
 -headers "$BUILD/macosx/include-libssh2" \
 -library "$BUILD/iphoneos/lib/libssh2.a" \
 -headers "$BUILD/iphoneos/include-libssh2" \
 -library "$BUILD/iphonesimulator/lib/libssh2.a" \
 -headers "$BUILD/iphonesimulator/include-libssh2" \
 -library "$BUILD/maccatalyst/lib/libssh2.a" \
 -headers "$BUILD/maccatalyst/include-libssh2" \
 -library "$BUILD/appletvsimulator/lib/libssh2.a" \
 -headers "$BUILD/appletvsimulator/include-libssh2" \
 -library "$BUILD/appletvos/lib/libssh2.a" \
 -headers "$BUILD/appletvos/include-libssh2" \
 -library "$BUILD/watchsimulator/lib/libssh2.a" \
 -headers "$BUILD/watchsimulator/include-libssh2" \
 -library "$BUILD/watchos/lib/libssh2.a" \
 -headers "$BUILD/watchos/include-libssh2" \
 -output libssh2.xcframework

zip --recurse-paths -X --quiet $ZIPNAME_SSH2 libssh2.xcframework
rm -rf libssh2.xcframework
CHECKSUM_SSH2=$(shasum -a 256 -b $ZIPNAME_SSH2 | awk '{print $1}')

#Create xcramework (libcrypto)

xcodebuild -create-xcframework \
 -library "$BUILD/macosx/lib/libcrypto.a" \
 -library "$BUILD/iphoneos/lib/libcrypto.a" \
 -library "$BUILD/iphonesimulator/lib/libcrypto.a" \
 -library "$BUILD/maccatalyst/lib/libcrypto.a" \
 -library "$BUILD/appletvsimulator/lib/libcrypto.a" \
 -library "$BUILD/appletvos/lib/libcrypto.a" \
 -library "$BUILD/watchsimulator/lib/libcrypto.a" \
 -library "$BUILD/watchos/lib/libcrypto.a" \
 -output libcrypto.xcframework

zip --recurse-paths -X --quiet $ZIPNAME_CRYPTO libcrypto.xcframework
rm -rf libcrypto.xcframework
CHECKSUM_CRYPTO=$(shasum -a 256 -b $ZIPNAME_CRYPTO | awk '{print $1}')

#Create xcramework (libssl)

xcodebuild -create-xcframework \
 -library "$BUILD/macosx/lib/libssl.a" \
 -library "$BUILD/iphoneos/lib/libssl.a" \
 -library "$BUILD/iphonesimulator/lib/libssl.a" \
 -library "$BUILD/maccatalyst/lib/libssl.a" \
 -library "$BUILD/appletvsimulator/lib/libssl.a" \
 -library "$BUILD/appletvos/lib/libssl.a" \
 -library "$BUILD/watchsimulator/lib/libssl.a" \
 -library "$BUILD/watchos/lib/libssl.a" \
 -output libssl.xcframework

zip --recurse-paths -X --quiet $ZIPNAME_SSL libssl.xcframework
rm -rf libssl.xcframework
CHECKSUM_SSL=$(shasum -a 256 -b $ZIPNAME_SSL | awk '{print $1}')
 
#Create xcramework (libgit2)

xcodebuild -create-xcframework \
 -library "$BUILD/iphoneos/lib/libgit2.a" \
 -headers "$BUILD/iphoneos/include-libgit2" \
 -library "$BUILD/iphonesimulator/lib/libgit2.a" \
 -headers "$BUILD/iphonesimulator/include-libgit2" \
 -library "$BUILD/maccatalyst/lib/libgit2.a" \
 -headers "$BUILD/maccatalyst/include-libgit2" \
 -output libgit2.xcframework

zip --recurse-paths -X --quiet $ZIPNAME_GIT2 libgit2.xcframework
rm -rf libgit2.xcframework
CHECKSUM_GIT2=$(shasum -a 256 -b $ZIPNAME_GIT2 | awk '{print $1}')

#Create Package.swift

cat >Package.swift << EOL
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
                      url: "$DOWNLOAD_URL_SSH2",
                      checksum: "$CHECKSUM_SSH2"),
        .binaryTarget(name: "libcrypto",
                      url: "$DOWNLOAD_URL_CRYPTO",
                      checksum: "$CHECKSUM_CRYPTO"),
        .binaryTarget(name: "libssl",
                      url: "$DOWNLOAD_URL_SSL",
                      checksum: "$CHECKSUM_SSL"),
        .binaryTarget(name: "libgit2",
                      url: "$DOWNLOAD_URL_GIT2",
                      checksum: "$CHECKSUM_GIT2")
    ]
)
EOL

#Commit

if [[ $1 == "commit" ]]; then

git add Package.swift
git commit -m "Build $TAG"
git tag $TAG
git push
git push --tags
gh release create "$TAG" $ZIPNAME_SSH2 $ZIPNAME_CRYPTO $ZIPNAME_SSL $ZIPNAME_GIT2 --title "$TAG" --notes-file $ROOT_PATH/script/release-note.md

fi

popd > /dev/null
