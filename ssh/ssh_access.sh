#!/usr/bin/env bash

writePublicKeyToCosmos() {
    echo "Writing your SSH Public Key to Cosmos"
    
    RESPONSE_CODE=$(curl -s -o /dev/null -w "%{http_code}" -XPUT --cert $HOME/.certs/dev.bbc.co.uk.pem -H"Content-Type: application/json" --data "{\"ssh_public_key\":\"$(cat $HOME/.ssh/id_rsa.pub)\"}" https://cosmos.api.bbci.co.uk/v1/users/me)
    
    if [[ "$RESPONSE_CODE" -ne "200" ]]; then
        echo "Failed to write SSH key to Cosmos, response code was $RESPONSE_CODE"
    else
        echo "Written SSH key to Cosmos."
    fi
}

writeSshKeyToGithub(){
    echo "Writing your SSH Public Key to Github"
    read -p "Github Username: " GITHUB_USERNAME
    read -s -p "Github Password: " GITHUB_PASSWORD
    echo
    read -s -p "Github OTP 2FA Token Value (6 digits): " GITHUB_OTP
    GITHUB_OUTPUT=$(curl -s -v -H"X-GitHub-OTP: $GITHUB_OTP" -u "$GITHUB_USERNAME:$GITHUB_PASSWORD" --data "{\"title\":\"devenv-setup\",\"key\":\"$(cat $HOME/.ssh/id_rsa.pub)\"}" https://api.github.com/user/keys)
    
    echo $GITHUB_OUTPUT | grep "key is already in use"
    
    if [ $? -eq 0 ]; then
        echo "SSH key is already installed in Github"
    else
        echo "SSH key installed in Github"
    fi
}

printf "Write SSH key to Cosmos? [y/N]\n"
read writeToCosmos

if [ "$writeToCosmos" == "y" ]; then
    writeToCosmos
fi

printf "Write SSH key to GitHub? [y/N]\n"
read writeToGithub

if [ "$writeToGithub" == "y" ]; then
    writeSshKeyToGithub
fi