#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dir=~/dotfiles                          # dotfiles directory
olddir=~/dotfiles_old                   # old dotfiles backup directory
files="bash_profile bashrc vimrc bash_aliases tmux.conf"       # list of files/folders to symlink in homedir
odd_files="flake8"                      # list of files that need to be handled individually
vim_plugins="
https://github.com/davidhalter/jedi-vim.git
https://github.com/davidhalter/jedi.git
https://github.com/scrooloose/nerdcommenter.git
https://github.com/trusktr/seti.vim
https://github.com/majutsushi/tagbar.git
https://github.com/csexton/trailertrash.vim.git
https://github.com/mbbill/undotree.git
https://github.com/panozzaj/vim-autocorrect.git
https://github.com/alvan/vim-closetag.git
https://github.com/xolox/vim-easytags.git
https://github.com/airblade/vim-gitgutter.git
https://github.com/jamessan/vim-gnupg.git
https://github.com/severin-lemaignan/vim-minimap.git
https://github.com/xolox/vim-misc.git
https://github.com/jistr/vim-nerdtree-tabs.git
https://github.com/lervag/vimtex.git
https://github.com/Valloric/YouCompleteMe.git
https://github.com/ross/requests-futures
https://github.com/Valloric/ycmd"

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

    if [[ $file == "vimrc" ]]; then
        echo "starting to install Awesome Vim"
        # install awesome vim (.vimrc)
        git clone https://github.com/amix/vimrc.git ~/.vim_runtime
        sh ~/.vim_runtime/install_awesome_vimrc.sh
        echo "Awesome Vim is installed"
        mkdir ~/.vim
        mkdir ~/.vim/bundle
        echo "Starting to install Vim Plugins"
        cd ~/.vim/bundle
        for plugin in $vim_plugins; do
            git clone $plugin
            echo ""
        done
        mv ~/.$file ~/dotfiles_old
        echo ""
        echo ""

        echo "Vim plugins are downloaded, Make sure to configure 'YouCompleteMe'"
    fi

    if [[ $file == "tmux.conf" ]]; then
        echo "setting up teamocil directory"
        ln -s $dir/teamocil/ ~/.teamocil
        echo "Setting up tmux gitbar"
        git clone https://github.com/aurelien-rainone/tmux-gitbar.git ~/.tmux-gitbar
        ln -s $dir/tmux-gitbar.conf ~/.tmux-gitbar.conf
    fi

    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file

done

for file in $odd_files; do
    if [[ $file == "flake8" ]]; then
        echo "installing flake8 config"
        mkdir ~/.config
        mv ~/.config/flake8 $olddir/flake8
        ln -s $dir/flake8 ~/.config/flake8
    fi

done
