FROM golang:1.12-stretch

LABEL Author="Arthur Chaloin from Enix <arthur.chaloin@enix.fr>"

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends --no-install-suggests ca-certificates git mercurial subversion bzr \
 && update-ca-certificates \
 && curl -fL -o /usr/local/bin/dep https://github.com/golang/dep/releases/download/v0.5.0/dep-linux-amd64 \
 && chmod +x /usr/local/bin/dep \
 && mkdir -p /usr/local/share/doc/dep \
 && curl -fL -o /usr/local/share/doc/dep/LICENSE https://raw.githubusercontent.com/golang/dep/v0.5.0/LICENSE \
 && rm -rf /var/lib/apt/lists/* /tmp/*

ENTRYPOINT ["/usr/local/bin/dep"]

CMD ["--help"]
