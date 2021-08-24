FROM golang:1.17-stretch

RUN apt-get update
RUN apt-get install -y zip
ADD . /go/src/github.com/compassion-technology/goad
WORKDIR /go/src/github.com/compassion-technology/goad
RUN make linux64
RUN go build -o /go/bin/goad-api webapi/webapi.go

CMD ["/go/bin/goad-api", "-addr", ":8080"]
EXPOSE 8080
