# local exp_simd_portable_v2 DotStdSimdBaseline, <experimental/simd>
 318:	nop
 31c:	nop
 320:	ldr	q16, [x3], #16
 324:	ldr	q7, [x4], #16
 328:	fmla	v31.4s, v16.4s, v7.4s
 32c:	cmp	x5, x3
 330:	b.ne	320 <nesso::exp::DotStdSimdBaseline(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x30>  // b.any
 334:	mov	d6, v31.d[1]
 338:	and	x3, x6, #0xfffffffffffffffc
 33c:	add	x3, x3, #0x4
 340:	fadd	v6.2s, v6.2s, v31.2s
 344:	rev64	v5.2s, v6.2s
 348:	fadd	v0.2s, v5.2s, v6.2s
 34c:	cmp	x3, x1
 350:	b.cs	39c <nesso::exp::DotStdSimdBaseline(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0xac>  // b.hs, b.nlast
 354:	lsl	x4, x3, #2
 358:	add	x5, x3, #0x1
 35c:	ldr	s4, [x2, x4]
 360:	ldr	s3, [x0, x4]
 364:	fmadd	s0, s4, s3, s0
 368:	cmp	x1, x5
 36c:	b.ls	39c <nesso::exp::DotStdSimdBaseline(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0xac>  // b.plast
 370:	add	x5, x4, #0x4
 374:	add	x3, x3, #0x2
 378:	ldr	s2, [x2, x5]
 37c:	ldr	s1, [x0, x5]
 380:	fmadd	s0, s2, s1, s0
 384:	cmp	x1, x3
 388:	b.ls	39c <nesso::exp::DotStdSimdBaseline(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0xac>  // b.plast
 38c:	add	x4, x4, #0x8
 390:	ldr	s30, [x0, x4]
 394:	ldr	s29, [x2, x4]
 398:	fmadd	s0, s30, s29, s0
 39c:	ret
 3a0:	movi	v0.2s, #0x0
 3a4:	mov	x3, #0x0                   	// #0
