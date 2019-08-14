#!/usr/bin/env bash

# Export host OS
source $PWD/host-os.sh

if [ -d "$HOME/.profile_config" ]
then 
    echo "looks like it's already installed"
else
    echo "LETS INSTALL ALL THE THINGS"
fi