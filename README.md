# profile

Profile setup script - installs zsh & oh-my-zsh adds a load of config stuff (git, optimo, maven, cosmos).

```bash
./setup-profile.sh
```

### todo

* create a variables file for all the secret stuff and reference throughout
* integrate with [dev-env](https://github.com/phillipbarron/dev-env)
* Fix the java setup for Linux (at present we just remove it)
* Change the ownership of the config files? Had some odd permissions stuff on the last run
* install the Python requirements for the cosmps tooling on Macos / Ubuntu
* automatically do the certificate installation
* add Scala setup
* remove any me-centric stuff
* intregrate the ssh stuff
