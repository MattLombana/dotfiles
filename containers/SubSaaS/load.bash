build-subsaas() {
    docker build -t subsaas:latest .
}

subsaas() {
    docker run --rm -it --net=host --name subsaas --privileged -v ~/Documents:/host subsaas:latest "$@"
}
