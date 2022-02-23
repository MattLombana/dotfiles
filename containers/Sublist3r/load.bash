build-sublist3r() {
    docker build -t sublist3r:latest .
}

sublist3r() {
    docker run --rm -it --net=host --name sublist3r --privileged -v ~/Documents:/host sublist3r:latest "$@"
}
