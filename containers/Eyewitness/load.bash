build-eyewitness() {
    docker build -t eyewitness:latest .
}

eyewitness() {
    docker run --rm -it --net=host --name eyewitness --privileged -v ~/Documents:/host eyewitness:latest "$@"
}
