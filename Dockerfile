FROM alpine:3.18.4

ARG GH_VERSION=2.29.0

RUN apk add "github-cli~=${GH_VERSION}"

VOLUME /gh
WORKDIR /gh

ENTRYPOINT [ "gh" ]
CMD [ "--help" ]
