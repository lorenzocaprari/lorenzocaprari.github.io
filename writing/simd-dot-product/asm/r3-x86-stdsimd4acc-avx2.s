# build/Release/bench/CMakeFiles/exp_simd_portable_avx2.dir/exp_simd_portable.cpp.o DotStdSimd4Acc(
 2c0:	vmovups (%rax),%ymm5
 2c4:	vmovups 0x20(%rdx),%ymm6
 2c9:	sub    $0xffffffffffffff80,%rax
 2cd:	sub    $0xffffffffffffff80,%rdx
 2d1:	vmovups -0x40(%rdx),%ymm7
 2d6:	vmovups -0x20(%rdx),%ymm4
 2db:	vfmadd231ps -0x80(%rdx),%ymm5,%ymm0
 2e1:	vfmadd231ps -0x60(%rax),%ymm6,%ymm2
 2e7:	vfmadd231ps -0x40(%rax),%ymm7,%ymm1
 2ed:	vfmadd231ps -0x20(%rax),%ymm4,%ymm3
 2f3:	cmp    %rax,%r9
 2f6:	jne    2c0 <nesso::exp::(anonymous namespace)::DotStdSimd4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>) [clone .isra.0]+0x50>
 2f8:	and    $0xffffffffffffffe0,%r8
 2fc:	vextractf128 $0x1,%ymm2,%xmm7
 302:	vextractf128 $0x1,%ymm1,%xmm6
 308:	lea    0x20(%r8),%rax
 30c:	vextractf128 $0x1,%ymm3,%xmm5
 312:	add    $0x28,%r8
 316:	cmp    %r8,%rsi
 319:	jb     344 <nesso::exp::(anonymous namespace)::DotStdSimd4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>) [clone .isra.0]+0xd4>
 31b:	mov    %r8,%rdx
 31e:	xchg   %ax,%ax
 320:	vmovups (%rdi,%rax,4),%ymm4
 325:	vfmadd231ps (%rcx,%rax,4),%ymm4,%ymm0
 32b:	mov    %rdx,%rax
 32e:	lea    0x8(%rdx),%rdx
 332:	cmp    %rdx,%rsi
 335:	jae    320 <nesso::exp::(anonymous namespace)::DotStdSimd4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>) [clone .isra.0]+0xb0>
 337:	mov    %rsi,%rax
 33a:	sub    %r8,%rax
 33d:	and    $0xfffffffffffffff8,%rax
 341:	add    %r8,%rax
 344:	vextractf128 $0x1,%ymm0,%xmm4
 34a:	vaddps %xmm2,%xmm7,%xmm2
 34e:	vaddps %xmm1,%xmm6,%xmm1
 352:	vaddps %xmm0,%xmm4,%xmm4
 356:	vaddps %xmm3,%xmm5,%xmm3
 35a:	vpermilps $0x1b,%xmm4,%xmm0
 360:	vaddps %xmm4,%xmm0,%xmm0
 364:	vpermilps $0x1b,%xmm2,%xmm4
 36a:	vaddps %xmm2,%xmm4,%xmm4
 36e:	vpermilps $0x1b,%xmm1,%xmm2
 374:	vaddps %xmm1,%xmm2,%xmm2
 378:	vpermilps $0x1b,%xmm3,%xmm1
 37e:	vaddps %xmm3,%xmm1,%xmm1
 382:	vpermilpd $0x3,%xmm0,%xmm3
 388:	vaddps %xmm3,%xmm0,%xmm0
 38c:	vpermilpd $0x3,%xmm4,%xmm3
 392:	vaddps %xmm3,%xmm4,%xmm4
 396:	vpermilpd $0x3,%xmm2,%xmm3
 39c:	vaddps %xmm3,%xmm2,%xmm2
 3a0:	vaddss %xmm4,%xmm0,%xmm0
 3a4:	vaddss %xmm2,%xmm0,%xmm0
 3a8:	vpermilpd $0x3,%xmm1,%xmm2
 3ae:	vaddps %xmm2,%xmm1,%xmm1
 3b2:	vaddss %xmm1,%xmm0,%xmm0
 3b6:	cmp    %rsi,%rax
 3b9:	jae    436 <nesso::exp::(anonymous namespace)::DotStdSimd4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>) [clone .isra.0]+0x1c6>
 3bb:	mov    %rsi,%rdx
 3be:	sub    %rax,%rdx
 3c1:	lea    -0x1(%rdx),%r8
 3c5:	cmp    $0x2,%r8
 3c9:	jbe    3ff <nesso::exp::(anonymous namespace)::DotStdSimd4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>) [clone .isra.0]+0x18f>
 3cb:	vmovups (%rdi,%rax,4),%xmm1
 3d0:	vmulps (%rcx,%rax,4),%xmm1,%xmm1
 3d5:	vaddss %xmm1,%xmm0,%xmm0
 3d9:	vshufps $0x55,%xmm1,%xmm1,%xmm2
 3de:	vaddss %xmm0,%xmm2,%xmm2
 3e2:	vunpckhps %xmm1,%xmm1,%xmm0
 3e6:	vshufps $0xff,%xmm1,%xmm1,%xmm1
 3eb:	vaddss %xmm2,%xmm0,%xmm0
 3ef:	vaddss %xmm1,%xmm0,%xmm0
 3f3:	test   $0x3,%dl
 3f6:	je     436 <nesso::exp::(anonymous namespace)::DotStdSimd4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>) [clone .isra.0]+0x1c6>
 3f8:	and    $0xfffffffffffffffc,%rdx
 3fc:	add    %rdx,%rax
 3ff:	lea    0x1(%rax),%rdx
 403:	vmovss (%rdi,%rax,4),%xmm5
 408:	vfmadd231ss (%rcx,%rax,4),%xmm5,%xmm0
 40e:	cmp    %rsi,%rdx
 411:	jae    436 <nesso::exp::(anonymous namespace)::DotStdSimd4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>) [clone .isra.0]+0x1c6>
 413:	lea    0x2(%rax),%rdx
 417:	vmovss 0x4(%rcx,%rax,4),%xmm6
 41d:	vfmadd231ss 0x4(%rdi,%rax,4),%xmm6,%xmm0
 424:	cmp    %rsi,%rdx
 427:	jae    436 <nesso::exp::(anonymous namespace)::DotStdSimd4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>) [clone .isra.0]+0x1c6>
 429:	vmovss 0x8(%rcx,%rax,4),%xmm7
 42f:	vfmadd231ss 0x8(%rdi,%rax,4),%xmm7,%xmm0
 436:	vzeroupper
 439:	ret
 43a:	nopw   0x0(%rax,%rax,1)
 440:	vxorpd %xmm3,%xmm3,%xmm3
 444:	vxorps %xmm0,%xmm0,%xmm0
 448:	mov    $0x8,%r8d
 44e:	xor    %eax,%eax
