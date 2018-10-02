#!/usr/bin/env bash

set -eu -o pipefail

export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"

mkdir -p $PREFIX/bin
mkdir -p $PREFIX/lib

mkdir -p build
cd build
cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DCMAKE_BUILD_TYPE=RELEASE -DCONDA_BUILD=TRUE -DCMAKE_OSX_DEPLOYMENT_TARGET=10.9 -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX -DBOOST_ROOT=$PREFIX -DBoost_NO_SYSTEM_PATHS=TRUE ..
make install VERBOSE=1 CFLAGS="-L${PREFIX}/lib -I${PREFIX}/include"