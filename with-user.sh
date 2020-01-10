#!/usr/bin/env bash

echo "shall I print something ? [y/N]"

read shouldReadSomething

if [ "$shouldReadSomething" == "y" ]; then
    echo "BINGO"
fi