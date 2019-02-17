#!/bin/sh -e

export ZSH=/Users/barrop02/.oh-my-zsh

ZSH_THEME="pygmalion"

plugins=(git)

# User configuration

export PATH="$PATH:/usr/local/sbin:/gems/ruby-2.2.1/bin:/Users/barrop02/.rvm/gems/ruby-2.2.1@global/bin:/Users/barrop02/.rvm/rubies/ruby-2.2.1/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/barrop02/javalibs/ant/bin:/Users/barrop02/javalibs/maven/bin:/Users/barrop02/javalibs/gradle/bin:"

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/Users/barrop02/Workspace/galileo:$PATH"
export $BASH_CONFIG_DIR="$HOME/.profile_config"

. $BASH_CONFIG_DIR/.certconf
. $BASH_CONFIG_DIR/.proxyconf
. $BASH_CONFIG_DIR/.optimo
. $BASH_CONFIG_DIR/.optimo-e2e
. $BASH_CONFIG_DIR/.java_bash
. $BASH_CONFIG_DIR/.castaway
. $BASH_CONFIG_DIR/.cosmos_bash
. $BASH_CONFIG_DIR/.vagrant_bash
. $BASH_CONFIG_DIR/.bashtools
. $BASH_CONFIG_DIR/.aws_bash
. $BASH_CONFIG_DIR/.git_bash
. $BASH_CONFIG_DIR/.nvm-bash
. ~/.profile # this is RVM

alias cd..="cd .."
alias init=". ~/.zshrc && echo 'bash profile re-initialised'"


export PATH="$PATH:/usr/local"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

