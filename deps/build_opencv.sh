#!/usr/bin/env bash

cd $(dirname $BASH_SOURCE)

python opencv/platforms/ios/build_framework.py ios --iphoneos_archs arm64 --iphonesimulator_archs x86_64

