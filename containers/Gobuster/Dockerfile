FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

WORKDIR /
RUN apt-get update && apt-get install -y wget p7zip
RUN wget https://github.com/OJ/gobuster/releases/download/v3.1.0/gobuster-linux-amd64.7z && \
p7zip -d gobuster-linux-amd64.7z && \
mv gobuster-linux-amd64/gobuster /gobuster && \
chmod +x /gobuster && \
wget https://raw.githubusercontent.com/digination/dirbuster-ng/master/wordlists/common.txt && \
wget https://raw.githubusercontent.com/digination/dirbuster-ng/master/wordlists/big.txt

ENTRYPOINT ["/gobuster"]
