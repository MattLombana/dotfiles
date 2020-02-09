#! /bin/bash

# curl https://raw.githubusercontent.com/MattLombana/dotfiles/master/autostart.sh | bash

sudo apt-get install zsh tmux
git clone https://github.com/MattLombana/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./makesymlinks.sh
