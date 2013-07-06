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

# Link to extra bash stuff
# Check first if this line is not in the bashrc
ln -sf $PWD/bash/.bashextras ~/.bashextras
if ! grep -q "bashextras" ~/.bashrc; then
    echo "source ~/.bashextras" >> ~/.bashrc 
fi

# Link python config
ln -sf $PWD/python/.pythonrc ~/.pythonrc
