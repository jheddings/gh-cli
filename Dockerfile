FROM alpine:3.19.1

RUN apk add --no-cache github-cli

VOLUME /gh
WORKDIR /gh

ENTRYPOINT [ "gh" ]
CMD [ "--help" ]
