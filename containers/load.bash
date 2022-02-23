#! /bin/bash

docker_bash() {
    docker exec -it $1 /bin/bash
}


docker_sh() {
    docker exec -it $1 /bin/sh
}
