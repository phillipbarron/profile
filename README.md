# profile

this is the bash profile for the Mac - this will mostly work in ubuntu too but may need a little tweaking.

all the config files are in .profile_config and will need copying in to the home folder:

```bash
mkdir $HOME/.profile_config

cp .profile_config/.* $HOME/.profile_config
cp .zshrc $HOME/.zshrc

init
```

### todo

* create a variables file for all the secret stuff an reference throughout
* integrate with [profile stuff](https://github.com/phillipbarron/dev-env)
