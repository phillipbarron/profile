#!/usr/bin/env bash

# Export host OS
source $PWD/host-os.sh

installForLinux() {
    # Install ZSH and Oh-My-ZSH
    apt-get install -y zsh curl git
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

installForMacOS() {
    # Install ZSH and Oh-My-ZSH
    brew install zsh curl git
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

if [ -d "$HOME/.profile_config" ]
then 
    echo "looks like it's already installed"
else
    if [ $HOST_OS == "LINUX" ]
    then
        installForLinux
    else
        installForMacOS
    fi
fi