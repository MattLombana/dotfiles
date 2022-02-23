build-sslscan() {
    docker build -t sslscan:latest .
}

sslscan() {
    docker run --rm -it --net=host --name sslscan --privileged -v ~/Documents:/host sslscan:latest "$@"
}
