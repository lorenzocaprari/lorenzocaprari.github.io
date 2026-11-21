// Copyright (c) 2026 Lorenzo Caprari
// SPDX-License-Identifier: Apache-2.0
// Build: gcc -O2 -o clk clk.c   Run: taskset -c 2 ./clk
// Effective clock from a chain of dependent integer adds (1 cycle latency each on Zen 5).
#include <stdio.h>
#include <stdint.h>
#include <time.h>
static double now(void){struct timespec t;clock_gettime(CLOCK_MONOTONIC,&t);return t.tv_sec+t.tv_nsec*1e-9;}
int main(void){
  const uint64_t iters=50000000; // 20 adds per iteration -> 1e9 dependent adds
  double best=0;
  for(int rep=0;rep<7;rep++){
    uint64_t x=0, n=iters; double t0=now();
    __asm__ volatile(
      "1:\n\t"
      ".rept 20\n\t add $1, %0\n\t .endr\n\t"
      "dec %1\n\t jnz 1b"
      : "+r"(x), "+r"(n));
    double dt=now()-t0, ghz=(iters*20.0)/dt/1e9;
    if(ghz>best)best=ghz;
    printf("%.3f ", ghz);
  }
  printf("| best %.3f GHz\n", best);
  return 0;
}
