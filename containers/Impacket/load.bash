build-impacket() {
    docker build -t impacket:latest .
}

impacket() {
    docker run --rm -it --net=host --name impacket --privileged -v ~/Documents:/host impacket:latest "$@"
}
