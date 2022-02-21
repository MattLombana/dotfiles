#! /bin/zsh

echo "Loading containers..."

for LOADFILE in $(find . -type f -name 'load.bash'); do
    . ./$LOADFILE
done
