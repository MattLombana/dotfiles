FROM golang:1.10

WORKDIR $GOPATH/src/

RUN git clone https://github.com/daniel-infosec/subsaas.git

WORKDIR $GOPATH/src/subsaas

RUN go get -d -v ./...
RUN go install -v ./...
ENTRYPOINT ["/go/bin/subsaas"]
#ENTRYPOINT ["/bin/bash"]
