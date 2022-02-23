build-recon-ng() {
    docker build -t recon-ng:latest .
}

recon-ng() {
    docker run --rm -it --net=host --name recon-ng --privileged -p 5000:5000 -v ~/.recon-ng:/root/.recon-ng -v ~/Documents:/host recon-ng:latest "$@"
}
