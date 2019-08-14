#!/usr/bin/env bash

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="pygmalion"

plugins=(git)

# User configuration

export PATH="$PATH:/usr/local:/usr/local/sbin:/bin:/usr/sbin:/sbin:$HOME/javalibs/ant/bin:$HOME/javalibs/maven/bin:$HOME/javalibs/gradle/bin:$HOME/Workspace/galileo:$PATH"

source $ZSH/oh-my-zsh.sh

export BASH_CONFIG_DIR="$HOME/.profile_config"

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

alias cd..="cd .."
alias init=". ~/.zshrc && echo 'bash profile re-initialised'"
