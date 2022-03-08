FROM perl:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

WORKDIR /
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/CiscoCXSecurity/rdp-sec-check.git && \
    cpan Encoding::BER


ENTRYPOINT ["perl", "/rdp-sec-check/rdp-sec-check.pl"]
