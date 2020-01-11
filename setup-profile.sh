#!/usr/bin/env bash

# Export host OS
. $PWD/host-os.sh

export SSH_USERNAME=`whoami`

getUserConfirmation() {
    printf "$1"
    read userInputResult
}

copyConfigfiles(){
    mkdir $HOME/.profile_config
    mkdir -p $HOME/.m2
    cp configuration_files/java/maven-settings.xml $HOME/.m2/settings.xml
    sed -i.bak -e "s/SSH_USERNAME/$SSH_USERNAME/g" $HOME/.m2/settings.xml
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

generateCertificates() {
    getUserConfirmation "Generate certifictes? ? [y/N]"
    if [ "$userInputResult" == "y" ]; then
        . $PWD/certificates/cert_generation.sh
    fi
}

setupProfile() {
    if [ -d "$HOME/.profile_config" ]; then
        echo "looks like it's already installed"
    else
        if [ $HOST_OS == "LINUX" ]
        then
            installForLinux
        else
            installForMacOS
        fi
    fi
}

maiMenu() {
    getUserConfirmation "Choose install option:\n1. Setup profile\n2. Install certificates\n3. Configure shh\n4. Exit\n"
    case "$userInputResult" in
    "1")
        echo "profile"
        ;;
    "2")
        generateCertificates
        ;;
    "3")
        echo "Configure ssh"
        ;;
    "4")
        echo "exit"
        return
        ;;
    *)
        echo "wtf?"
        ;;
    esac
}

maiMenu