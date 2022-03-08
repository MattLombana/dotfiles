build-rdp-sec-check() {
    docker build -t rdp-sec-check:latest .
}

rdp-sec-check() {
    docker run --rm -it --net=host --name rdp-sec-check --privileged -v ~/Documents:/host rdp-sec-check:latest "$@"
}
