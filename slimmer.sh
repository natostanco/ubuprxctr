#!/bin/sh

docker build -t ubuprxctr . 

./docker-slim build \
	--continue-after 30 \
	--http-probe \
	--include-path /entry \
	--include-path /bin/tail \
	--include-path /bin/sleep \
	--include-path /bin/cp \
	--mount ./test:/test \
	--entrypoint /test/libinclude.sh \
	ubuprxctr
