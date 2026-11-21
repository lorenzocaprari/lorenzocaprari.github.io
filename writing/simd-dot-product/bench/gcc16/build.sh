#!/bin/bash
# Build the article benchmark inside an Ubuntu container and run its correctness check.
#   build.sh CXX OUTDIR [cxx26]
# Expects /w/nesso to be a nesso v0.3.0 checkout with the benchmark files copied into
# bench/ (see ../README.md). cxx26 adds the C++26 <simd> kernels (g++ 16 only).
set -euo pipefail
CXX=$1; OUT=$2; CXX26=${3:-}
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq >/dev/null
apt-get install -y -qq --no-install-recommends "$CXX" libbenchmark-dev git ca-certificates util-linux >/dev/null
[ -d /tmp/eve ] || git clone -q --depth 1 --branch v2023.02.15 https://github.com/jfalcou/eve.git /tmp/eve
mkdir -p "$OUT/obj"; cd /w/nesso
F="-O3 -march=x86-64-v2 -fvisibility=hidden -DNDEBUG -std=c++26"
AVX2="-DNESSO_EXP_AVX2_BUILD=1 -mavx2 -mfma"
I="-Isrc/core/include -Isrc/platform/include -Ibench -isystem /tmp/eve/include"
o=$OUT/obj
$CXX $F $I -c src/core/distance.cpp -o "$o/distance.o"
$CXX $F $I -c src/core/distance_avx2.cpp -o "$o/distance_avx2.o"
$CXX $F $I -c src/platform/assert.cpp -o "$o/assert.o"
$CXX $F $I -c bench/exp_simd_portable.cpp -o "$o/portable_v2.o"
$CXX $F $I $AVX2 -c bench/exp_simd_portable.cpp -o "$o/portable_avx2.o"
objs="$o/distance.o $o/distance_avx2.o $o/assert.o $o/portable_v2.o $o/portable_avx2.o"
D=""
if [ -n "$CXX26" ]; then
  # Same kernels a third time with GCC's FMA-chain avoidance off, renamed so both link.
  FUSED="--param=avoid-fma-max-bits=0 -DDotCxx26Simd1Avx2=DotCxx26Simd1Avx2Fused -DDotCxx26Simd4Avx2=DotCxx26Simd4Avx2Fused -DCxx26LanesAvx2=Cxx26LanesAvx2Fused"
  $CXX $F -c bench/exp_simd_cxx26.cpp -o "$o/cxx26_v2.o"
  $CXX $F $AVX2 -c bench/exp_simd_cxx26.cpp -o "$o/cxx26_avx2.o"
  $CXX $F $AVX2 $FUSED -c bench/exp_simd_cxx26.cpp -o "$o/cxx26_avx2_fused.o"
  $CXX $F -S bench/exp_simd_cxx26.cpp -o "$OUT/cxx26-baseline.s"
  $CXX $F $AVX2 -S bench/exp_simd_cxx26.cpp -o "$OUT/cxx26-avx2.s"
  $CXX $F $AVX2 $FUSED -S bench/exp_simd_cxx26.cpp -o "$OUT/cxx26-avx2-fused.s"
  objs="$objs $o/cxx26_v2.o $o/cxx26_avx2.o $o/cxx26_avx2_fused.o"; D="-DNESSO_EXP_CXX26=1"
fi
$CXX $F $I $D -c bench/exp_simd_bench.cpp -o "$o/bench.o"
$CXX "$o/bench.o" $objs -o "$OUT/exp_simd_bench" -lbenchmark -lpthread
$CXX --version | head -1 > "$OUT/compiler.txt"
"$OUT/exp_simd_bench" --check
