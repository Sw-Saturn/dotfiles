#!/bin/sh

sudo apt-get -y install \
    git \
    gem \
    ntp \
    wget \
    zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
gem install bundler
gem install colorls
