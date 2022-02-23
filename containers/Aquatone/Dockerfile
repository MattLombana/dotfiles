FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y wget unzip
RUN wget https://download-chromium.appspot.com/dl/Linux_x64?type=snapshots
RUN unzip Linux_x64?type=snapshots
RUN wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
RUN unzip aquatone_linux_amd64_1.7.0.zip
ENTRYPOINT ["/aquatone", "-chrome-path", "/chrome-linux/chrome"]


