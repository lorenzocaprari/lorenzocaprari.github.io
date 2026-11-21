#!/bin/bash
# Time both builds in alternating rounds on one pinned CPU (default 2).
#   run.sh [ROUNDS] [CPU]
# Run from the directory that holds nesso/, out15/ and out16/ (see ../README.md).
set -euo pipefail
ROUNDS=${1:-2}; CPU=${2:-2}
for v in 15 16; do
  img=ubuntu:26.04; [ "$v" = 16 ] && img=ubuntu:26.10
  docker rm -f "simd-gcc$v" >/dev/null 2>&1 || true
  docker run -d --name "simd-gcc$v" -v "$PWD":/w "$img" sleep infinity >/dev/null
  docker exec "simd-gcc$v" bash -c 'apt-get update -qq >/dev/null; DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends libbenchmark-dev util-linux >/dev/null'
done
for round in $(seq 1 "$ROUNDS"); do
  for v in 15 16; do
    echo "round $round gcc$v"
    docker exec "simd-gcc$v" taskset -c "$CPU" "/w/out$v/exp_simd_bench" \
      --benchmark_repetitions=10 --benchmark_enable_random_interleaving=true \
      --benchmark_report_aggregates_only=true \
      --benchmark_out="/w/out$v/run$round.json" --benchmark_out_format=json > "out$v/run$round.txt"
  done
done
docker rm -f simd-gcc15 simd-gcc16 >/dev/null
