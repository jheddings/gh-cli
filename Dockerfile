FROM alpine:3.20.1

RUN apk add --no-cache github-cli

VOLUME /gh
WORKDIR /gh

ENTRYPOINT [ "gh" ]
CMD [ "--help" ]
