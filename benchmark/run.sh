#!/usr/bin/env bash

DURATION=10s
OHA_COMMAND="oha -z $DURATION -w --latency-correction --disable-color --disable-keepalive --no-tui --json"

# Make really sure the targets are ready.
sleep 2

for n in 1 2 5 10 20 50 100 200 ; do
  echo "======== Bun, N_CONNECTIONS=$n ========"
  $OHA_COMMAND -c $n http://bun:8080/
  echo "======== Node, N_CONNECTIONS=$n ========"
  $OHA_COMMAND -c $n http://node:8081/
done

echo "======== Done ========"
