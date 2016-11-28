FROM golang:1.7.3-alpine

ENV TRASH_VERSION="0.2.5"
LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name="trash" \
      org.label-schema.description="Minimalistic Go vendored code manager" \
      org.label-schema.url="https://github.com/rancher/trash" \
      org.label-schema.vcs-url="https://github.com/rancher/trash" \
      org.label-schema.version="v${TRASH_VERSION}" \
      org.label-schema.docker.cmd="docker run --rm -v $PWD:/usr/src/code zetaron/trash:${TRASH_VERSION}"

RUN apk add --no-cache \
        wget \
        ca-certificates \
    && wget https://github.com/rancher/trash/releases/download/v${TRASH_VERSION}/trash-linux_amd64.tar.gz \
    && apk del \
       wget \
       ca-certificates \
    && tar xvfz trash-linux_amd64.tar.gz -C /usr/bin \
    && rm trash-linux_amd64.tar.gz

RUN apk add --no-cache \
    git


ENTRYPOINT ["trash"]
CMD ["--keep"]
