FROM alpine:3.10

LABEL source="https://github.com/nickshine/dot"

RUN apk add --update --no-cache graphviz ttf-dejavu \
  && addgroup -g 1000 dot \
  && adduser -u 1000 -G dot -s /bin/sh -D dot

USER 1000

WORKDIR /dot

CMD ["dot", "-Tpng"]
