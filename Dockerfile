ARG  GRAFEAS_VERSION=0.1.0
FROM us.gcr.io/grafeas/grafeas-server:${GRAFEAS_VERSION} as grafeas-official

FROM alpine:latest as confd
ARG CONFD_VERSION=0.15.0
ADD https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

FROM alpine:latest
WORKDIR /grafeas
RUN USER=grafeas && \
    UID=1234 && \
    GID=5678 && \
    addgroup -g "$GID" -S "$USER" && \
    adduser --disabled-password \
    -u "$UID" -S "$USER" -G "$USER" && \
    chown -R grafeas:grafeas /grafeas
COPY --chown=grafeas:grafeas --from=confd /usr/local/bin/confd /usr/local/bin/confd
COPY --chown=grafeas:grafeas --from=grafeas-official /grafeas-server .
COPY --chown=grafeas:grafeas build-files /tmp
RUN chmod +x /usr/local/bin/confd && \
    mv /tmp/confd /etc && \
    mv /tmp/entrypoint.sh /grafeas/entrypoint.sh && \
    chmod +x /grafeas/entrypoint.sh
USER grafeas
EXPOSE 8080
ENTRYPOINT ["/grafeas/entrypoint.sh"]
CMD ["-config", "config.yaml"]
