FROM python:3.7-alpine AS recon-ng


RUN apk add --no-cache --virtual .build-deps gcc libc-dev libxslt-dev &&\
    apk add --no-cache libxslt git &&\
    apk del .build-deps &&\
    mkdir -p /recon-ng

RUN git clone https://github.com/lanmaster53/recon-ng.git &&\
	pip install --no-cache-dir -r /recon-ng/REQUIREMENTS

WORKDIR /recon-ng


ENTRYPOINT ["./recon-ng"]
