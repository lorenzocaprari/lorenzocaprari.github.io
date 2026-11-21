# local exp_simd_portable_v2 DotStdSimd4Acc, four accumulators + std::experimental::fma
 3e8:	ldp	q2, q21, [x4, #32]
 3ec:	add	x4, x4, #0x40
 3f0:	ldp	q1, q20, [x3, #32]
 3f4:	add	x3, x3, #0x40
 3f8:	fmla	v25.4s, v5.4s, v0.4s
 3fc:	fmla	v22.4s, v4.4s, v3.4s
 400:	fmla	v23.4s, v2.4s, v1.4s
 404:	fmla	v24.4s, v21.4s, v20.4s
 408:	cmp	x5, x3
 40c:	b.ne	3e0 <nesso::exp::DotStdSimd4AccBaseline(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x34>  // b.any
 410:	and	x6, x6, #0xfffffffffffffff0
 414:	mov	v16.8b, v22.8b
 418:	mov	d27, v22.d[1]
 41c:	add	x3, x6, #0x10
 420:	mov	v28.8b, v23.8b
 424:	mov	v30.8b, v24.8b
 428:	mov	d29, v23.d[1]
 42c:	add	x6, x6, #0x14
 430:	mov	d31, v24.d[1]
 434:	cmp	x1, x6
 438:	b.cc	46c <nesso::exp::DotStdSimd4AccBaseline(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0xc0>  // b.lo, b.ul, b.last
 43c:	mov	x4, x6
 440:	lsl	x5, x3, #2
 444:	mov	x3, x4
 448:	add	x4, x4, #0x4
 44c:	ldr	q19, [x2, x5]
 450:	ldr	q18, [x0, x5]
 454:	fmla	v25.4s, v19.4s, v18.4s
 458:	cmp	x1, x4
 45c:	b.cs	440 <nesso::exp::DotStdSimd4AccBaseline(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x94>  // b.hs, b.nlast
 460:	sub	x3, x1, x6
 464:	and	x3, x3, #0xfffffffffffffffc
 468:	add	x3, x3, x6
 46c:	mov	d17, v25.d[1]
 470:	fadd	v16.2s, v16.2s, v27.2s
 474:	fadd	v28.2s, v28.2s, v29.2s
 478:	fadd	v30.2s, v30.2s, v31.2s
 47c:	fadd	v17.2s, v17.2s, v25.2s
 480:	rev64	v6.2s, v16.2s
 484:	rev64	v5.2s, v28.2s
 488:	rev64	v0.2s, v30.2s
 48c:	rev64	v7.2s, v17.2s
 490:	fadd	v6.2s, v6.2s, v16.2s
 494:	fadd	v5.2s, v5.2s, v28.2s
 498:	fadd	v0.2s, v0.2s, v30.2s
 49c:	fadd	v7.2s, v7.2s, v17.2s
 4a0:	fadd	s6, s6, s7
 4a4:	fadd	s5, s6, s5
 4a8:	fadd	s0, s5, s0
 4ac:	cmp	x1, x3
 4b0:	b.ls	4fc <nesso::exp::DotStdSimd4AccBaseline(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x150>  // b.plast
 4b4:	lsl	x4, x3, #2
 4b8:	add	x5, x3, #0x1
 4bc:	ldr	s4, [x2, x4]
 4c0:	ldr	s3, [x0, x4]
 4c4:	fmadd	s0, s4, s3, s0
 4c8:	cmp	x1, x5
 4cc:	b.ls	4fc <nesso::exp::DotStdSimd4AccBaseline(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x150>  // b.plast
 4d0:	add	x5, x4, #0x4
 4d4:	add	x3, x3, #0x2
 4d8:	ldr	s2, [x2, x5]
 4dc:	ldr	s1, [x0, x5]
 4e0:	fmadd	s0, s2, s1, s0
 4e4:	cmp	x1, x3
 4e8:	b.ls	4fc <nesso::exp::DotStdSimd4AccBaseline(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x150>  // b.plast
 4ec:	add	x4, x4, #0x8
 4f0:	ldr	s21, [x0, x4]
 4f4:	ldr	s26, [x2, x4]
 4f8:	fmadd	s0, s21, s26, s0
 4fc:	ret
 500:	movi	v31.2s, #0x0
 504:	mov	x3, #0x0                   	// #0
