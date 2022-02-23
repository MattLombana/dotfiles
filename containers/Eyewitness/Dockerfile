FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update && \
    apt-get install -y git wget && \
    rm -rf /var/lib/apt/lists/*

RUN    git clone --depth 1 https://github.com/FortyNorthSecurity/EyeWitness.git

RUN cd EyeWitness/Python/setup && \
    ./setup.sh && \
    cd .. && \
    mkdir -p /tmp/EyeWitness

ENTRYPOINT ["python3", "/EyeWitness/Python/EyeWitness.py"]
