#!/bin/bash
######################
# install.sh
# This script creates the symlinks for the home directory to make 
# some settings more portable.
# Taken from github.com/michaeljsmalley/dotfiles
# Modifications by Charles Rice
######################

##### Variables

dir=~/dotfiles			#dotfiles directory
olddir=~/dotfiles_old
files="bashrc bash_aliases fluxbox"

#####

#create dotfiles_old in home dir
echo "Creating $olddir for backup of any existing dotfiles in !"
mkdir -p $olddir
echo "...done"

#change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

#move any existing dotfiles in home dir to dotfiles_old directory, tehn create 
# symlinks in homedir
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	#check if the file is already a link and if not make it so
	if [ -h $files ]; then
		echo "already there"
	else
		mv ~/.$file $olddir
		echo "Creating symlink to $file in home directory."
		ln -s $dir/$file ~/.$file
	fi
done


