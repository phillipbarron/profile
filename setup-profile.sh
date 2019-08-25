#!/usr/bin/env bash

# Export host OS
. $PWD/host-os.sh


copyConfigfiles(){
    mkdir $HOME/.profile_config
    cp dotfiles/* $HOME/.profile_config
    mv $HOME/.zshrc $HOME/.zshrc.bak
    mv $HOME/.profile_config/zshrc $HOME/.zshrc
}

installOhMyZsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
}

installForLinux() {
    # Install ZSH and Oh-My-ZSH
    apt-get install -y zsh curl git
    installOhMyZsh
    copyConfigfiles
}

installForMacOS() {
    # Install ZSH and Oh-My-ZSH
    brew install zsh curl git
    installOhMyZsh
    copyConfigfiles
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