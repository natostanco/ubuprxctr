#!/bin/bash

DIR=`dirname "$(readlink -f "$0")"`
while true; do
python3.5 -u ${DIR}/mprox.py > ${DIR}/pxies.txt
done
