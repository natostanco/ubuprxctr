#!/bin/sh

docker build -t alpprxctr . 

./docker-slim build \
	--continue-after 30 \
	--include-path /entry \
	--http-probe
