#!/usr/bin/env bash

if [ "$1" == "" ]; then
     echo "ERROR: Bad build ID providen!"
     exit 1;
fi

git submodule update --init && ./scripts/applyPatches.sh

sed -i -e s/unknown/"${1}"/g ./Waterfall-Proxy/proxy/src/main/java/net/md_5/bungee/VersionInfo.java

if [ "$2" == "--jar" ]; then
     mvn clean package
fi
