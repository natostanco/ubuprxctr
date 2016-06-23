#!/bin/bash
include=( "/bin/cp" \
          "/usr/bin/tail" \
          "/bin/sleep" \
          ""/bin/true"
          )

for n in ${!include[*]}
do
find ${include[n]} | xargs -I {} ldd {} | awk '{print $3}' | grep '/' | sort -u | xargs -I {} touch {}
sleep 2
echo "$n"
done
/entry/entry.sh
