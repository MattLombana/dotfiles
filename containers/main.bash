#! /bin/zsh




load_containers() {
    echo "Loading containers..."
    CURRENT_DIR=$(pwd)
    cd ~/.dotfiles/containers
    for LOADFILE in $(find . -type f -name 'load.bash'); do
        . ./$LOADFILE
    done
    cd $CURRENT_DIR
}

load_containers
