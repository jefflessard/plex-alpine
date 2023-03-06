#!/bin/bash
tag=${1:?No tag provided.}
image=linuxserver/plex

docker pull $image:$tag --quiet &> /dev/null

docker history $image:$tag \
       --quiet \
       --format '{{ .CreatedBy }}' \
       --no-trunc | \
       grep -o "^RUN[^/]*PLEX_RELEASE[^/]*" | \
       tr ' ' '\n' | \
       grep '='
