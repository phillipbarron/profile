#!/usr/bin/env bash

# Export host OS
. $PWD/host-os.sh

copyConfigfiles(){
    mkdir $HOME/.profile_config
    mkdir -p $HOME/.m2
    cp configuration_files/java/maven-settings.xml $HOME/.m2/settings.xml
    cp configuration_files/* $HOME/.profile_config
    mv $HOME/.zshrc $HOME/.zshrc.bak
    mv $HOME/.profile_config/zshrc $HOME/.zshrc
    if [ $HOST_OS == "LINUX" ]; then
        sed -i.bak '/java_bash\|proxyconf/d' $HOME/.zshrc
    fi
}

installOhMyZsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        chsh -s $(which zsh)
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