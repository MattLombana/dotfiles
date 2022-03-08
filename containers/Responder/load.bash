build-responder() {
    docker build -t responder:latest .
}

responder() {
    docker run --rm -it --net=host --name responder --privileged -v ~/Documents:/host responder:latest "$@"
}
