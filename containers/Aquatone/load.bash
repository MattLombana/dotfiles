build-aquatone() {
    docker build -t aquatone:latest .
}

aquatone() {
    docker run --rm -it --net=host --name aquatone --privileged -v ~/Documents:/host aquatone:latest "$@"
}
