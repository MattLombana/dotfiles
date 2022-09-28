build-fleetctl() {
    docker build -t fleetctl:latest .
}

fleetctl() {
    docker run --rm -it --net=host --name fleetctl --privileged -v ~/.fleet/:/root/.fleet -v ~/Documents:/host fleetctl:latest "$@"
}
