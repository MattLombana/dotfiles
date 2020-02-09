#! /bin/bash

# curl https://raw.githubusercontent.com/MattLombana/dotfiles/master/autostart.sh | bash

git clone https://github.com/MattLombana/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./makesymlinks.sh
