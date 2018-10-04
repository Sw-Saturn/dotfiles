#!/bin/sh

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.wgetrc ~/.wgetrc
#ln -sf ~/dotfiles/.zshrc ~/.zshrc
#ln -sf ~/dotfiles/.zprofile ~/.zprofile

ln -sf ~/dotfiles/.vim/rc/dein.toml ~/.vim/rc/dein.toml
ln -sf ~/dotfiles/.vim/rc/dein_lazy.toml ~/.vim/rc/dein_lazy.toml
sh ~/dotfiles/lndir.sh ~/dotfiles/zprezto ~/.zprezto/runcoms
