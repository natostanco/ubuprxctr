#!/bin/sh

docker build -t alpprxctr . 

./docker-slim build \
	--continue-after 30 \
	--http-probe \
	--include-path /entry \
	--include-path /bin/tail \
	--include-path /bin/sleep \
	--include-path /bin/cp \
	alpprxctr
