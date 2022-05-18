FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update && apt-get install -y wget

#RUN wget https://github.com/forensicanalysis/elementary/releases/download/v0.3.0-rc.20/elementary_0.3.0-rc.20_Linux_amd64.deb && \
#    dpkg -i elementary_0.3.0-rc.20_Linux_amd64.deb

RUN wget https://github.com/forensicanalysis/elementary/releases/download/v0.3.0-rc.20/elementary_0.3.0-rc.20_Linux_amd64.tar.gz && \
    tar xzvf elementary_0.3.0-rc.20_Linux_amd64.tar.gz && \
    /elementary && \
    /elementary install



#ENTRYPOINT ["elementary"]
ENTRYPOINT ["/elementary"]
#ENTRYPOINT ["/bin/bash"]
