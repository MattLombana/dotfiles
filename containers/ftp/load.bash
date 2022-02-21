build-ftp() {
    docker build -t ftp:latest .
}

ftp() {
docker run --rm -it --net=host --name ftp --privileged ftp:latest "$@"
}
