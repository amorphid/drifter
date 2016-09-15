#!/bin/bash

# Only used for generating host names, and not written to be fast
random_char () {
  (
    RAND_NUM=$RANDOM
    CHARS="0123456789bcdfghjklmnpqrstvwxz"

    for i in $(seq 30 0); do
      if (( $RAND_NUM  > ((32767/30)*$i) )); then
        echo ${CHARS:$i:1}
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

