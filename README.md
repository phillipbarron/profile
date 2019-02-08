# profile

this is the bash profile for the Mac - this will mostly work in ubuntu too however all the explicit paths will need updating

all the config files are in .profile_config and will need copying in to the home folder:

```bash
mkdir $HOME/.profile_config

cp .profile_config/* $HOME/.profile_config
cp .zshrc $HOME/.zshrc

init
```