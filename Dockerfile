FROM alpine:3.5

# Maintainer Information
LABEL maintainer="88plug"
LABEL maintainer_website="https://88plug.com"

ENV DOCTL_VERSION=1.8.2

RUN apk add --no-cache curl

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

WORKDIR /app

RUN curl -L https://github.com/digitalocean/doctl/releases/download/v${DOCTL_VERSION}/doctl-${DOCTL_VERSION}-linux-amd64.tar.gz  | tar xz

ENTRYPOINT ["./doctl"]