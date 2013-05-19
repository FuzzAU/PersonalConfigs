#!/bin/bash

# Backup file/folder if it is not a symlink
function backup {
if [ -e $1 ] && [ ! -L $1  ]; then
    mv $1 $1.backup
fi
}

VIMRC=~/.vimrc
VIMDIR=~/.vim
GITCONFIG=~/.gitconfig

# Backup existing configs
backup $VIMRC
backup $VIMDIR
backup $GITCONFIG

# Link git config file
ln -sf $PWD/git/.gitconfig ~/.gitconfig

# Link vim configs
ln -sf $PWD/vim/.vimrc ~/.vimrc
ln -sf $PWD/vim/.vim ~/.vim 
