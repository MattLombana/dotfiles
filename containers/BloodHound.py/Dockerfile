FROM ubuntu:latest

WORKDIR /
RUN apt-get update && apt-get install -y git python3 python3-pip
RUN git clone https://github.com/fox-it/BloodHound.py.git
WORKDIR /BloodHound.py
RUN python3 setup.py install
WORKDIR /host

ENTRYPOINT ["bloodhound-python"]
