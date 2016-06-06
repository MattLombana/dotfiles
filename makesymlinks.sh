#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# The Arguments passed to the script will be the files symlinked to
############################

#Exit If no arguements were passed
if [[ $# -eq 0 ]]; then
	echo "No Arguments were passed!"
	exit 1
fi

########## Variables
dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=$*    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
    
    if [[ $file == "vimrc" ]]; then
    	echo "starting to install Awesome Vim"
    	# install awesome vim (.vimrc)
		git clone git://github.com/amix/vimrc.git ~/.vim_runtime
		sh ~/.vim_runtime/install_awesome_vimrc.sh#statements
    fi
done
