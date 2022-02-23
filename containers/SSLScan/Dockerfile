FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update && apt-get install -y build-essential git zlib1g-dev
RUN sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list && apt-get update
RUN apt-get build-dep openssl -y
RUN git clone https://github.com/rbsec/sslscan.git
WORKDIR /sslscan
RUN make static

ENTRYPOINT ["/sslscan/sslscan"]
