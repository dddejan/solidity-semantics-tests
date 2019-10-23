#!/bin/bash

rev=$1

git clone https://github.com/SRI-CSL/solidity.git solc-verify
cd solc-verify
git checkout $rev
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/solc-verify-examples/install -DBOOGIE_BIN=/solc-verify-examples/boogie/Binaries
make -j4
make install
