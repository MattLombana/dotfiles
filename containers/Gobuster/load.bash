build-gobuster() {
    docker build -t gobuster:latest .
}

gobuster() {
    docker run --rm -it --net=host --name gobuster --privileged -v ~/Documents:/host gobuster:latest "$@"
}
