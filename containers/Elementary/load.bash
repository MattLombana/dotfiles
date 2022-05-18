build-elementary() {
    docker build -t elementary:latest .
}

elementary() {
    docker run --rm -it --net=host --name elementary --privileged -v ~/Documents:/host -v /var/run/docker.sock:/var/run/docker.sock elementary:latest "$@"
}
