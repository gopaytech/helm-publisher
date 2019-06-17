FROM gcr.io/cloud-builders/kubectl

ENV HELM_VERSION="v2.14.1"

RUN curl -Lo /tmp/helm-linux-amd64.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && tar -xvf /tmp/helm-linux-amd64.tar.gz -C /tmp/ \
    && chmod +x /tmp/linux-amd64/helm \
    && mv /tmp/linux-amd64/helm /usr/local/bin/

WORKDIR /helm-publisher

COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
