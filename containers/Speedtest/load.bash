build-speedtest() {
    docker build -t speedtest:latest .
}

speedtest() {
    docker run --rm -it --net=host --name speedtest --privileged -v ~/Documents:/host -v ~/.config/ookla:/root/.config/ookla speedtest:latest "$@"
}
