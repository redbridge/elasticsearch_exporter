FROM alpine:latest

ENV GOPATH /go
ENV APPPATH $GOPATH/src/github.com/flecno/elasticsearch_exporter

COPY . $APPPATH

RUN apk add --update -t build-deps go git mercurial libc-dev gcc libgcc \
    && cd $APPPATH && go get -d && go build -o /elasticsearch_exporter \
    && apk del --purge build-deps && rm -rf /var/cache/apk/* && rm -rf $GOPATH

EXPOSE 9108

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch_exporter"]
