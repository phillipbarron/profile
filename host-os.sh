#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]
then
    echo "MacOS land"
    export HOST_OS="MACOS"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Linux land"
    export HOST_OS="LINUX"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    echo "Windows not currently supported"
    exit 1;
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    echo "Windows not currently supported"
    exit 1;
fi
