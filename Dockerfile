FROM alpine:3.19.0

RUN apk add github-cli

VOLUME /gh
WORKDIR /gh

ENTRYPOINT [ "gh" ]
CMD [ "--help" ]
