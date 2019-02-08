#!/bin/sh -e

export ZSH=/Users/barrop02/.oh-my-zsh

ZSH_THEME="pygmalion"

plugins=(git)

# User configuration

export PATH="$PATH:/usr/local/sbin:/gems/ruby-2.2.1/bin:/Users/barrop02/.rvm/gems/ruby-2.2.1@global/bin:/Users/barrop02/.rvm/rubies/ruby-2.2.1/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/barrop02/javalibs/ant/bin:/Users/barrop02/javalibs/maven/bin:/Users/barrop02/javalibs/gradle/bin:"

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/Users/barrop02/Workspace/galileo:$PATH"

source ~/.profile_config/.certconf
source ~/.profile_config/.proxyconf
source ~/.profile_config/.optimo
source ~/.profile_config/.optimo-e2e
source ~/.profile_config/.java_bash
source ~/.profile_config/.castaway
source ~/.profile_config/.cosmos_bash
source ~/.profile_config/.vagrant_bash
source ~/.profile_config/.bashtools
source ~/.profile_config/.aws_bash
source ~/.profile_config/.git_bash
source ~./profile_config/.nvm-bash
source ~/.profile # this is RVM

alias cd..="cd .."
alias init=". ~/.zshrc && echo 'bash profile re-initialised'"


export PATH="$PATH:/usr/local"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

