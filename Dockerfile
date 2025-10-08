FROM alpine:3.22.2

RUN apk add --no-cache github-cli

VOLUME /gh
WORKDIR /gh

ENTRYPOINT [ "gh" ]
CMD [ "--help" ]
