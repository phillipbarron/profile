#!/usr/bin/env bash

# Import Dev Cert into OS X Keychain (Safari/Chrome)
security import $HOME/.certs/dev.bbc.co.uk.p12 -k $HOME/Library/Keychains/login.keychain -P dev.bbc.co.uk

# Import Cloud Root
sudo security add-trusted-cert -d -r trustRoot -k $HOME/Library/Keychains/login.keychain $HOME/.certs/cloud-ca.pem

# Import Greenhouse Root (should do nothing for BBC Desktop)
sudo security add-trusted-cert -d -r trustRoot -k $HOME/Library/Keychains/login.keychain $HOME/.certs/ca.pem