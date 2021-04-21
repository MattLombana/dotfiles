#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dir=~/.dotfiles                          # dotfiles directory
olddir=$dir/dotfiles_old                   # old dotfiles backup directory
files="bash_profile bashrc aliases tmux.conf gdbinit zshrc"       # list of files/folders to symlink in homedir
odd_files="flake8"                      # list of files that need to be handled individually

vim_plugins="
https://github.com/jiangmiao/auto-pairs.git
https://github.com/MarcWeber/vim-addon-mw-utils.git
https://github.com/jistr/vim-nerdtree-tabs.git
https://github.com/panozzaj/vim-autocorrect.git
https://github.com/itchyny/lightline.vim.git
https://github.com/alvan/vim-closetag.git
https://github.com/majutsushi/tagbar.git
https://github.com/garbas/vim-snipmate.git
https://github.com/nvie/vim-flake8.git
https://github.com/godlygeek/tabular.git
https://github.com/csexton/trailertrash.vim.git
https://github.com/tomtom/tlib_vim.git
https://github.com/xolox/vim-misc.git
https://github.com/pangloss/vim-javascript.git
https://github.com/plasticboy/vim-markdown.git
https://github.com/lervag/vimtex.git
https://github.com/scrooloose/nerdcommenter.git
https://github.com/honza/vim-snippets.git
https://github.com/vim-scripts/nginx.vim.git
https://github.com/preservim/nerdtree.git
https://github.com/Vimjas/vim-python-pep8-indent.git
https://github.com/maxbrunsfeld/vim-yankstack.git
"

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
    echo "Moving existing $file from ~ to $olddir"
    mv ~/.$file $olddir/

    elif [[ $file == "tmux.conf" ]]; then
        echo "setting up teamocil directory"
        ln -s $dir/teamocil/ ~/.teamocil
        echo "Setting up tmux gitbar"
        git clone https://github.com/aurelien-rainone/tmux-gitbar.git ~/.tmux-gitbar
        ln -s $dir/tmux-gitbar.conf ~/.tmux-gitbar.conf
        echo "Setting up Tmux Plugin Mangager"
        mkdir -p ~/.tmux/plugins
        mkdir -p ~/.tmux/logs
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


    elif [[ $file == "gdbinit" ]]; then
        echo "installing gdbinit config"
        git clone https://github.com/pwndbg/pwndbg.git ~/.gdb/pwndbg
        echo "Running pwndbg setup script"
        ~/.gdb/pwndbg/setup.sh

    elif [[ $file == "zshrc" ]]; then
        echo "Installing Oh-My-Zsh"
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi


    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file

done

for file in $odd_files; do
    # Cannot do flake8 with normal files, as it goes in .config
    if [[ $file == "flake8" ]]; then
        echo "installing flake8 config"
        mkdir ~/.config
        mv ~/.config/flake8 $olddir/flake8
        ln -s $dir/flake8 ~/.config/flake8
    fi


done

echo "Linking vim dir"
ln -s $dir/vim ~/.vim
echo "Installing Vim Plugins"
cd ~/.vim/bundle
for plugin in $vim_plugins; do
	git clone $plugin
	echo ""
done
mv ~/.$file $oldir/
echo ""
echo ""
echo "Vim plugins are downloaded..."



# comment out the following line in the oh-my-zsh tmux plugin 'alias tmux=_zsh_tmux_plugin_run'"
sed -i 's/alias tmux=_zsh_tmux_plugin_run/#alias tmux=_zsh_tmux_plugin_run/g' ~/.oh-my-zsh/plugins/tmux/tmux.plugin.zsh
