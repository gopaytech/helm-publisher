FROM alpine/helm:2.14.0

RUN apk add git
WORKDIR /helm-publisher

COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
