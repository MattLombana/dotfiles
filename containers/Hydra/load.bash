hydra() {
    docker run --rm -it --net=host --name hydra --privileged -v ~/Documents:/host vanhauser/hydra:latest "$@"
}
