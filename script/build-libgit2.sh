#!/bin/bash
#
# build-libgit2.sh
# Copyright © 2020 Dmitriy Borovikov. All rights reserved.
# Revised for libgit2 (c) 2022 Midori Minato
#

source "$ROOT_PATH/script/build-commons"

set -e

if [[ -f "$BUILT_PRODUCTS_DIR/lib/libgit2.a" ]]; then
    echo "$PLATFORM libgit2 already build"
    exit 0
fi

CLANG=$(xcrun --find clang)
export CLANG
DEVELOPER=$(xcode-select --print-path)
export DEVELOPER
mkdir -p "$BUILT_PRODUCTS_DIR"

for ARCH in $ARCHS
do
    PLATFORM_SRC="$LIBGITDIR/${PLATFORM}$EFFECTIVE_PLATFORM_NAME-$ARCH/src"
    PLATFORM_OUT="$LIBGITDIR/${PLATFORM}$EFFECTIVE_PLATFORM_NAME-$ARCH/install"
	OPENSSL_ROOT="$LIBSSLDIR/${PLATFORM}$EFFECTIVE_PLATFORM_NAME-$ARCH"
	SSH_ROOT="$LIBSSHDIR/${PLATFORM}$EFFECTIVE_PLATFORM_NAME-$ARCH/install"
    LOG="$BUILT_PRODUCTS_DIR/$PLATFORM$EFFECTIVE_PLATFORM_NAME-$ARCH-libgit2-build.log"
    LIPO_GIT2="$LIPO_GIT2 $PLATFORM_OUT/lib/libgit2.a"

    mkdir -p "$PLATFORM_SRC"
    mkdir -p "$PLATFORM_OUT"
    cp -R "$LIBGIT_SOURCE" "$PLATFORM_SRC"
    cd "$PLATFORM_SRC"

    touch "$LOG"
    echo "LOG: $LOG"
    
    export DEVROOT="$DEVELOPER/Platforms/$PLATFORM.platform/Developer"
    export SDKROOT="$DEVROOT/SDKs/$PLATFORM.sdk"

    export BITCODE_GENERATION_MODE=bitcode
    export CFLAGS="$CFLAGS -fembed-bitcode"
    
	cmake \
		-DCMAKE_OSX_ARCHITECTURES=$ARCH \
		-DCMAKE_IOS_DEVELOPER_ROOT=$DEVROOT \
		-DCMAKE_OSX_SYSROOT=$SDKROOT \
		-DCMAKE_IOS_SDK_ROOT=$SDKROOT \
		-DCMAKE_FIND_ROOT_PATH=$SDKROOT \
		-DBUILD_SHARED_LIBS=NO \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_COMPILER_WORKS=ON \
		-DCMAKE_CXX_COMPILER_WORKS=ON \
		-DCMAKE_INSTALL_PREFIX=$PLATFORM_OUT \
		-DBUILD_CLAR=NO \
		-DOPENSSL_ROOT_DIR=$OPENSSL_ROOT \
        -DOPENSSL_CRYPTO_LIBRARY=$OPENSSL_ROOT/libcrypto.a \
        -DOPENSSL_SSL_LIBRARY=$OPENSSL_ROOT/libssl.a \
        -DOPENSSL_INCLUDE_DIR=$OPENSSL_ROOT/include \
        -DUSE_SSH=YES \
        -DLIBSSH2_FOUND=YES \
        -DLIBSSH2_INCLUDE_DIRS=$SSH_ROOT/include \
		-DLIBSSH2_LIBRARY_DIRS=$SSH_ROOT/lib \
		-DBUILD_TESTS=NO \
		-S $PLATFORM_SRC -B $PLATFORM_SRC/build > $LOG 2>&1

#bitcode

	cmake --build $PLATFORM_SRC/build --target install >> $LOG 2>&1
	
    echo "libgit2 - $PLATFORM $ARCH done."
done

buildFatLibrary "$LIPO_GIT2" "$BUILT_PRODUCTS_DIR/lib/libgit2.a"
copyHeaders "$LIBGIT_SOURCE/include/" "$BUILT_PRODUCTS_DIR/include-libgit2"
cd "$BUILT_PRODUCTS_DIR/lib"

echo "libgit2 - $PLATFORM done."
