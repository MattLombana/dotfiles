cme() {
    docker run --rm -it --net=host --name cme -v ~/.cme:/root/.cme -v ~/Documents:/host byt3bl33d3r/crackmapexec $@
}
