#!/bin/bash
include=( "/bin/cp" \
          "/usr/bin/tail" \
          "/bin/sleep" \
          "/bin/true" \
          )

for n in ${!include[*]}
do
find ${include[n]} | xargs -I {} ldd {} | awk '{print $3}' | grep '/' | sort -u | xargs -I {} touch {}
sleep 2
echo "$n"
done
proxybroker serve --host 127.0.0.1 --port 8888 --types HTTP HTTPS --lvl High &>/dev/null &
/entry/runppx.sh
