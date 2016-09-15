#!/bin/bash

# Only used for generating host names, and not written to be fast
random_char () {
  (
    RAND_NUM=$RANDOM
    CHARS30="0123456789bcdfghjklmnpqrstvwxz"

    for i in $(seq 0 29); do
      j=$((29 - $i))

      if (( $RAND_NUM  > ((32767/30)*$j) )); then
        echo ${CHARS30:$j:1}
        break
      fi
    done
  )
}

HOSTNAME=""

for i in $(seq 1 15); do
  HOSTNAME+=$(random_char)
done

echo $HOSTNAME
