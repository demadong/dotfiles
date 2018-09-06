#!/bin/bash
#######################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in this repo
#######################

####### Variables

dir=~/dotfiles # dotfiles dir
olddir=~/dotfiles-backup # backup dotfiles dir
files="bashrc vimrc zshrc tmux.conf"

######################

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

echo "cd to $dir directory"
cd $dir
echo "...done"

for file in $files; do
	echo "backing up existing dotfiles..."
	mv ~/.$file $olddir
	echo "creating symlink to $file in home dir"
	ln -s $dir/$file ~/.$file
done
