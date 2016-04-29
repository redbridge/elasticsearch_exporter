#!/bin/sh

if [ "$1" = 'elasticsearch_exporter' ]; then
  exec "/elasticsearch_exporter" --es.uri="$ES_URI" --es.all="$ES_ALL"
fi

exec "$@"

