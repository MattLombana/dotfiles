FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update && apt-get install -y git python3 python3-pip

RUN git clone https://github.com/aboul3la/Sublist3r.git && pip3 install -r /Sublist3r/requirements.txt


ENTRYPOINT ["python3", "/Sublist3r/sublist3r.py"]
