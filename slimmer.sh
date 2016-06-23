#!/bin/sh

DIR=`dirname "$(readlink -f "$0")"`

docker build -t ubuprxctr . 

./docker-slim build \
        --continue-after 30 \
        --http-probe \
        --include-path /entry \
        --mount ${DIR}/test:/test \
        --entrypoint /test/libinclude.sh \
        ubuprxctr
