build-telnet() {
    docker build -t telnet:latest .
}

telnet() {
docker run --rm -it --net=host --name telnet --privileged telnet:latest "$@"
}
