#!/bin/bash

echo "-------- Start installing apt-get packages"
APT_INSTALLS="build-essential git-core libdb++-dev libssl-dev libboost-all-dev"
sudo apt-get update
sudo apt-get install -yf $APT_INSTALLS

echo "-------- Retrieving logcoin source"
LGC_REPO="https://github.com/ivangonekrazy/litecoin.git"
LGC_DEST="~/workspace"
LGC_BRANCH="logcoin"
mkdir $LGC_DEST
cd $LGC_DEST
git clone $LGC_REPO

echo "-------- Building logcoind"
cd $LGC_DEST/litecoin/src
git checkout $LGC_BRANCH
make -f makefile.unix all

echo "-------- Installing logcoind"
sudo cp $LGC_DEST/litecoin/src/logcoind /usr/bin/logcoind

echo "-------- Starting logcoind"
/usr/bin/logcoind -daemon
