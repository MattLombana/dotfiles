FROM ubuntu:latest

RUN apt-get update && apt-get install -y git python3 python3-pip net-tools
WORKDIR /
RUN git clone https://github.com/lgandx/Responder.git && \
    pip3 install netifaces
WORKDIR /Responder

ENTRYPOINT ["python3", "/Responder/Responder.py"]
# ENTRYPOINT ["/bin/bash"]
