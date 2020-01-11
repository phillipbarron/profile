#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Generate SSH Certificate
# if [ ! -f "$HOME/.ssh/id_rsa" ]; then
#     if [ ! -w "$HOME/.rnd" ]; then
#         # Remove .rnd before cert generation as it's owned by root and openssh doesn't like that
#         # Used for entropy for RNG
#         # NOTE: Requires sudo
#         # TODO: Should we just chown it instead?
#         echo ".rnd owned by root, removing. Will ask for your machine password."
#         sudo rm -f $HOME/.rnd
#     fi
    
#     printf "Generating SSH Certificate"
#     echo "Please follow the instructions given in the next step..."
#     echo "Note: Choose a secure password (preferably different from your login, this can be stored in your keychain so you don't have to reenter it each time)"
#     ssh-keygen -t rsa -C "$EMAIL_ADDRESS"
# fi

writeSshConfig(){
    # SSH Config
    #mkdir -p $HOME/.ssh
    #if [ ! -f $HOME/.ssh/config ]; then
    #    cp $DIR/ssh-config $HOME/.ssh/config
    #    if [ $HOST_OS == "MACOS"]; then
    #        cp $DIR/ssh-proxy $HOME/.ssh/proxy
    #        chmod +x $HOME/.ssh/proxy
    #    fi
    #fi
    printf "\nEnter your BBC email address: "
    read EMAIL_ADDRESS

    # Might be useful to move this to its own function
    export SSH_USERNAME=$(curl --cert $HOME/.certs/dev.bbc.co.uk.pem --cacert $HOME/.certs/ca-bundle.crt https://api.live.bbc.co.uk/cosmos/user/$EMAIL_ADDRESS 2>/dev/null | jq '.username' --raw-output)
    echo "THIE SSH_USERNAME IS $SSH_USERNAME"
    # sed -i -e "s#\${SSH_USERNAME}#$SSH_USERNAME#g" $HOME/.ssh/config
}

writeSshConfig