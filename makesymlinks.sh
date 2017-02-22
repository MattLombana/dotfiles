#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dir=~/dotfiles                          # dotfiles directory
olddir=~/dotfiles_old                   # old dotfiles backup directory
files="bashrc vimrc bash_aliases"       # list of files/folders to symlink in homedir
vim_plugins="
git@github.com:davidhalter/jedi-vim.git
git@github.com/davidhalter/jedi.git
git@github.com/scrooloose/nerdcommenter.git
git@github.com/trusktr/seti.vim
git@github.com:majutsushi/tagbar.git
git@github.com:csexton/trailertrash.vim.git
git@github.com:mbbill/undotree.git
git@github.com:panozzaj/vim-autocorrect.git
git@github.com:alvan/vim-closetag.git
git@github.com:xolox/vim-easytags.git
git@github.com:airblade/vim-gitgutter.git
git@github.com:jamessan/vim-gnupg.git
git@github.com:severin-lemaignan/vim-minimap.git
git@github.com:xolox/vim-misc.git
git@github.com:jistr/vim-nerdtree-tabs.git
git@github.com:lervag/vimtex.git
git@github.com:Valloric/YouCompleteMe.git
git@github.com/ross/requests-futures
git@github.com/Valloric/ycmd"

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
    if [[ $file == "vimrc" ]]; then
        echo "starting to install Awesome Vim"
        # install awesome vim (.vimrc)
        git clone git://github.com/amix/vimrc.git ~/.vim_runtime
        sh ~/.vim_runtime/install_awesome_vimrc.sh
        echo "Awesome Vim is installed"
        mkdir ./vim/bundle
        echo "Starting to install Vim Plugins"
        for plugin in $vim_plugins; do
            git clone $plugin ~/.vim/bundle/
        done

        echo "Vim plugins are downloaded, Make sure to configure 'YouCompleteMe'"
    fi

    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file


done
