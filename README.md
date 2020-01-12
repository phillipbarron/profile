# Dev environment setup

## Profile

Profile setup script - installs zsh & oh-my-zsh adds a load of config stuff (git, optimo, maven, cosmos, jq, curl).

## Certificates

generates all the certificates needed for BBC dev work. Requires the location of your BBC p12 format certificate

## SSH

Sets up your ssh config to allow access to BBC deployed stuff - sets key in Cosmos, writes your SSH key to GitHub & sets proxy SSH settings

## Cosmos tooling

install cosmos ssh tooling

```bash
./setup-profile.sh
```

### todo

* create a variables file for all the secret stuff and reference throughout
* integrate with [dev-env](https://github.com/phillipbarron/dev-env) - ***in progress***
* Fix the java setup for Linux (at present we just remove it)
* Change the ownership of the config files? Had some odd permissions stuff on the last run
* install the Python requirements for the cosmps tooling on Macos / Ubuntu
* add Scala setup
* integrate the ssh stuff - ***in progress***
* update the ssh script to require confirmation for each step - ***in progress***
* set default location for cert to $HOME/workspace - ***in progress***
