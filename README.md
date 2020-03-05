# Dev environment setup

## Profile

Profile setup script - installs zsh & oh-my-zsh then adds a load of config stuff (git, optimo, maven, cosmos, jq, curl).

## Certificates

generates all the certificates needed for BBC dev work. Requires the location of your BBC p12 format certificate

## SSH

Sets up your ssh config to allow access to BBC deployed stuff - sets key in Cosmos, writes your SSH key to GitHub & sets proxy SSH settings

## Cosmos tooling

installs cosmos ssh tooling

```bash
./setup-profile.sh
```

execute as about and chose install options

### todo

* create a variables file for all the secret stuff and reference throughout
* integrate with [dev-env](https://github.com/phillipbarron/dev-env) - ***in progress***
* Fix the java setup for Linux (at present we just remove it)
* install the Python requirements for the cosmos tooling on Macos / Ubuntu
* add Scala setup
* review the PATH in the BASH profile
* integrate the ssh stuff - ***in progress***
* provide an interactive menu - ***in progress***
