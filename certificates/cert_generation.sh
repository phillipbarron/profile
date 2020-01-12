#!/usr/bin/env bash

if [ -z "$P12_LOCATION" ]; then
    printf "Please enter the location of your exported .p12 file [$HOME/workspace/dev.bbc.co.uk.p12]: "
    read P12_LOCATION
    P12_LOCATION="${P12_LOCATION:-$HOME/workspace/dev.bbc.co.uk.p12}"
    # Replace ~ with $HOME so it expands correctly
    P12_LOCATION=${P12_LOCATION/#\~/$HOME}
fi

if [ -f $P12_LOCATION ]; then
    # Certificate needs to be executable for the exports to work
    chmod +x $P12_LOCATION
    mkdir -p $HOME/.certs
    echo "Found P12. It will ask you for your password if required"
    openssl pkcs12 -in $P12_LOCATION -out $HOME/.certs/dev.bbc.co.uk.pem -clcerts -nodes
    openssl pkcs12 -export -in $HOME/.certs/dev.bbc.co.uk.pem -passout pass:dev.bbc.co.uk -out $HOME/.certs/dev.bbc.co.uk.p12 -name dev.bbc.co.uk
    openssl pkcs12 -nocerts -nodes -passin pass:dev.bbc.co.uk -in $HOME/.certs/dev.bbc.co.uk.p12 -out $HOME/.certs/dev.bbc.co.uk.key
    openssl pkcs12 -nokeys -clcerts -passin pass:dev.bbc.co.uk -in $HOME/.certs/dev.bbc.co.uk.p12 -out $HOME/.certs/dev.bbc.co.uk.crt
    
    echo "Created the following certificates. The p12 password is dev.bbc.co.uk"
    ls -l $HOME/.certs
else
    echo "Cannot find Developer Certificate!"
    exit 1
fi

# CA Bundle stuff
echo "Creating CA Bundles"
mkdir -p $HOME/.certs
curl https://ca.dev.bbc.co.uk/ca.pem > $HOME/.certs/ca.pem
curl https://ca.dev.bbc.co.uk/cloud-ca.pem > $HOME/.certs/cloud-ca.pem

# Temporarily store value in SSL_CERT_FILE as there may be a case when rerunning this script after moving
# or deleting the certs folder where curl attempts to reference a CA Bundle which doesn't exist in the location
SSL_CERT_FILE_ORIG=$SSL_CERT_FILE
unset SSL_CERT_FILE

curl https://curl.haxx.se/ca/cacert.pem > $HOME/.certs/ca-bundle.tmp
cat $HOME/.certs/ca-bundle.tmp $HOME/.certs/ca.pem $HOME/.certs/cloud-ca.pem > $HOME/.certs/ca-bundle.crt
rm $HOME/.certs/*.tmp

export SSL_CERT_FILE=$SSL_CERT_FILE_ORIG
