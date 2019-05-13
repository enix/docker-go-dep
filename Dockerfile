FROM golang:1.12-alpine3.9

LABEL Author="Arthur Chaloin from Enix <arthur.chaloin@enix.fr>"

RUN apk update \
 && apk upgrade \
 && apk add --no-cache ca-certificates git mercurial subversion bzr openssh \
 && update-ca-certificates \
 && apk add --no-cache --virtual .build-deps curl \
 && curl -fL -o /usr/local/bin/dep https://github.com/golang/dep/releases/download/v0.5.0/dep-linux-amd64 \
 && chmod +x /usr/local/bin/dep \
 && mkdir -p /usr/local/share/doc/dep \
 && curl -fL -o /usr/local/share/doc/dep/LICENSE https://raw.githubusercontent.com/golang/dep/v0.5.0/LICENSE \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* /tmp/*

ENTRYPOINT ["/usr/local/bin/dep"]

CMD ["--help"]
