FROM golang:1.10.3
COPY . /go/src/github.com/grafeas/grafeas/
WORKDIR /go/src/github.com/grafeas/grafeas/samples/server/go-server/api/server/main
RUN CGO_ENABLED=0 go build -o grafeas-server .

FROM alpine:latest
WORKDIR /
ADD https://github.com/kelseyhightower/confd/releases/download/v0.15.0/confd-0.15.0-linux-amd64 /usr/local/bin/confd
COPY build-files /tmp
RUN chmod +x /usr/local/bin/confd && \
    mv /tmp/confd /etc && \
    mv /tmp/entrypoint.sh /entrypoint.sh && \
    chmod +x /entrypoint.sh
COPY --from=0 /go/src/github.com/grafeas/grafeas/samples/server/go-server/api/server/main/grafeas-server /grafeas-server
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
CMD ["-config", "config.yaml"]