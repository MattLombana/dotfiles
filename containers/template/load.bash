build-template() {
    docker build -t template:latest .
}

template() {
docker run --rm -it --net=host --name template --privileged template:latest "$@"
}
