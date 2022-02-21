build-nmap() {
    docker build -t nmap:latest .
}

nmap() {
docker run --rm -it --net=host --name nmap --privileged nmap:latest "$@"
}
