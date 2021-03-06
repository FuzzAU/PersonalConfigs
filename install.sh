#!/bin/bash

# Backup file/folder if it is not a symlink
function backup {
if [ -e $1 ] && [ ! -L $1  ]; then
    echo "Backing up $1 to $1.backup"
    mv $1 $1.backup
fi
}

function install {
backup $2
if [ ! -f $2 ]; then
    ln -sf $1 $2
fi
}

VIMRC=~/.vimrc
VIMDIR=~/.vim
GITCONFIG=~/.gitconfig
PYTHONRC=~/.pythonrc
BASHEXTRAS=~/.bashextras
BASHPS1=~/.bashps1
BASHRC=~/.bashrc
TMUXCONF=~/.tmux.conf
DIRCOLORS=~/.dircolors
# Bash profile for use with OS X
BASHPROFILE=~/.bash_profile
MACGITCOMPLETION=~/.git-completion.bash
POWERLINECONFIG=~/.config/powerline

## Prompt to install python3
minimum_required=("python3" "python3-pip")
read -p "Install python3 & pip for powerline? [Y/n]: " answer
## Set the default value if no answer was given
answer=${answer:Y}
## If the answer matches y or Y, install
[[ $answer =~ [Yy] ]] && sudo apt-get install ${minimum_required[@]}

## Check to install powerline
pip_packages=("powerline-status powerline-gitstatus")
read -p "Install powerline? [Y/n]: " answer
## Set the default value if no answer was given
answer=${answer:Y}
## If the answer matches y or Y, install
[[ $answer =~ [Yy] ]] && pip3 install ${pip_packages[@]}

# Create location for powerline
mkdir -p ~/.config
install $PWD/powerline/ $POWERLINECONFIG

# Install configuration links
install $PWD/git/gitconfig $GITCONFIG
#install $PWD/vim/vimrc $VIMRC
#install $PWD/vim/.vim $VIMDIR
install $PWD/tmux/tmux.conf $TMUXCONF
install $PWD/python/pythonrc $PYTHONRC
install $PWD/bash/bashextras $BASHEXTRAS
install $PWD/bash/dircolors $DIRCOLORS
#install $PWD/bash/ps1 $BASHPS1

# There is some extra work to be done on OS X because it uses bash_profile by default
# We will attempt to have bash_profile load bashrc
# If bashrc doesn't exist, then create it. It will then load the extras
if [ `uname | grep Darwin ` ]; then
    if ! grep -sq "bashrc" $BASHPROFILE; then
        echo "source $BASHRC" >> $BASHPROFILE
    fi
fi

# Link to extra bash stuff
# Check first if this line is not in the bashrc
if ! grep -sq "bashextras" $BASHRC; then
    echo "source $BASHEXTRAS" >> $BASHRC 
fi

# Put this reminder in for the git config, because I always forget it
echo "Remember to update the gitconfig to have the correct e-mail address!!"
