#!/usr/bin/env bash

DURATION=10s

for n in 1 2 10 50 100 200 ; do
  echo "======== Bun, N_CONNECTIONS=$n ========"
  oha -z $DURATION -c $n -w --latency-correction --disable-keepalive --no-tui http://bun:8080/
  echo "======== Node, N_CONNECTIONS=$n ========"
  oha -z $DURATION -c $n -w --latency-correction --disable-keepalive --no-tui http://node:8081/
done
