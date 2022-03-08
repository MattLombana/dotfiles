build-bloodhound-py() {
    docker build -t bloodhound-py:latest .
}

bloodhound-py() {
    docker run --rm -it --net=host --name bloodhound-py --privileged -v ~/Documents:/host bloodhound-py:latest "$@"
}
