build-template() {
    docker build -t template:latest .
}

template() {
    docker run --rm -it --net=host --name template --privileged -v ~/Documents:/host template:latest "$@"
}
