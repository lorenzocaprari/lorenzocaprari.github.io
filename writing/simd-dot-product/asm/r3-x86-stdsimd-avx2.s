# build/Release/bench/CMakeFiles/exp_simd_portable_avx2.dir/exp_simd_portable.cpp.o DotStdSimdAvx2
 484:	cmp    $0x7,%rsi
 488:	jbe    570 <nesso::exp::DotStdSimdAvx2(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0xf0>
 48e:	mov    $0x8,%eax
 493:	vxorps %xmm1,%xmm1,%xmm1
 497:	nopw   0x0(%rax,%rax,1)
 4a0:	vmovdqu -0x20(%rdx,%rax,4),%ymm0
 4a6:	vmulps -0x20(%rdi,%rax,4),%ymm0,%ymm0
 4ac:	add    $0x8,%rax
 4b0:	vaddps %ymm0,%ymm1,%ymm1
 4b4:	cmp    %rax,%rsi
 4b7:	jae    4a0 <nesso::exp::DotStdSimdAvx2(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x20>
 4b9:	lea    -0x8(%rsi),%rax
 4bd:	vextractf128 $0x1,%ymm1,%xmm0
 4c3:	and    $0xfffffffffffffff8,%rax
 4c7:	add    $0x8,%rax
 4cb:	vzeroupper
 4ce:	vaddps %xmm1,%xmm0,%xmm1
 4d2:	vpermilps $0x1b,%xmm1,%xmm0
 4d8:	vaddps %xmm1,%xmm0,%xmm0
 4dc:	vpermilpd $0x3,%xmm0,%xmm1
 4e2:	vaddps %xmm1,%xmm0,%xmm0
 4e6:	cmp    %rsi,%rax
 4e9:	jae    566 <nesso::exp::DotStdSimdAvx2(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0xe6>
 4eb:	mov    %rsi,%rcx
 4ee:	sub    %rax,%rcx
 4f1:	lea    -0x1(%rcx),%r8
 4f5:	cmp    $0x2,%r8
 4f9:	jbe    52f <nesso::exp::DotStdSimdAvx2(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0xaf>
 4fb:	vmovups (%rdi,%rax,4),%xmm1
 500:	vmulps (%rdx,%rax,4),%xmm1,%xmm1
 505:	vaddss %xmm1,%xmm0,%xmm0
 509:	vshufps $0x55,%xmm1,%xmm1,%xmm2
 50e:	vaddss %xmm0,%xmm2,%xmm2
 512:	vunpckhps %xmm1,%xmm1,%xmm0
 516:	vshufps $0xff,%xmm1,%xmm1,%xmm1
 51b:	vaddss %xmm2,%xmm0,%xmm0
 51f:	vaddss %xmm1,%xmm0,%xmm0
 523:	test   $0x3,%cl
 526:	je     566 <nesso::exp::DotStdSimdAvx2(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0xe6>
 528:	and    $0xfffffffffffffffc,%rcx
 52c:	add    %rcx,%rax
 52f:	lea    0x1(%rax),%rcx
 533:	vmovss (%rdi,%rax,4),%xmm3
 538:	vfmadd231ss (%rdx,%rax,4),%xmm3,%xmm0
 53e:	cmp    %rsi,%rcx
 541:	jae    566 <nesso::exp::DotStdSimdAvx2(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0xe6>
 543:	lea    0x2(%rax),%rcx
 547:	vmovss 0x4(%rdx,%rax,4),%xmm4
 54d:	vfmadd231ss 0x4(%rdi,%rax,4),%xmm4,%xmm0
 554:	cmp    %rsi,%rcx
 557:	jae    566 <nesso::exp::DotStdSimdAvx2(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0xe6>
 559:	vmovss 0x8(%rdx,%rax,4),%xmm5
 55f:	vfmadd231ss 0x8(%rdi,%rax,4),%xmm5,%xmm0
 566:	ret
 567:	nopw   0x0(%rax,%rax,1)
 570:	vxorpd %xmm1,%xmm1,%xmm1
 574:	xor    %eax,%eax
 576:	vmovapd %xmm1,%xmm0
 57a:	jmp    4ce <nesso::exp::DotStdSimdAvx2(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x4e>
 57f:	nop
