FROM alpine/helm:3.0.0

RUN apk add git
WORKDIR /helm-publisher

COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
