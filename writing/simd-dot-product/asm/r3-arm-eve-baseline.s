# local exp_simd_portable_v2 DotEve, -O3 -march=armv8-a
  cc:	ldr	q29, [x0]
  d0:	mov	v30.16b, v28.16b
  d4:	ldp	x12, x4, [sp, #80]
  d8:	cmge	v31.4s, v29.4s, v31.4s
  dc:	fmla	v30.4s, v26.4s, v27.4s
  e0:	ldr	x6, [sp, #16]
  e4:	ldr	x10, [sp, #32]
  e8:	ldr	x8, [sp, #64]
  ec:	ldr	x7, [sp, #96]
  f0:	and	v31.16b, v31.16b, v30.16b
  f4:	cmp	x4, x6
  f8:	b.eq	2c8 <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x2c8>  // b.none
  fc:	ldr	x9, [sp, #104]
 100:	mov	v27.16b, v28.16b
 104:	mov	v0.16b, v28.16b
 108:	add	x9, x9, #0x10
 10c:	mov	x0, x6
 110:	ldr	q29, [x9]
 114:	ldr	q30, [x0], #16
 118:	fmla	v31.4s, v29.4s, v30.4s
 11c:	cmp	x4, x0
 120:	b.eq	1d0 <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x1d0>  // b.none
 124:	ldr	q30, [x6, #16]
 128:	add	x0, x6, #0x20
 12c:	ldr	q29, [x9, #16]
 130:	fmla	v0.4s, v29.4s, v30.4s
 134:	cmp	x4, x0
 138:	b.eq	1d0 <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x1d0>  // b.none
 13c:	ldr	q30, [x6, #32]
 140:	add	x0, x6, #0x30
 144:	ldr	q29, [x9, #32]
 148:	fmla	v27.4s, v29.4s, v30.4s
 14c:	cmp	x4, x0
 150:	b.eq	1d0 <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x1d0>  // b.none
 154:	add	x3, x6, #0x40
 158:	add	x5, x9, #0x40
 15c:	sub	x0, x4, x3
 160:	ldr	q30, [x6, #48]
 164:	asr	x0, x0, #2
 168:	ldr	q29, [x9, #48]
 16c:	cmp	x0, #0x0
 170:	add	x1, x0, #0xf
 174:	csel	x1, x1, x0, lt	// lt = tstop
 178:	fmla	v28.4s, v29.4s, v30.4s
 17c:	asr	x1, x1, #4
 180:	cbz	x1, 2dc <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x2dc>
 184:	lsl	x1, x1, #6
 188:	mov	x0, x5
 18c:	add	x2, x6, x1
 190:	ldp	q20, q22, [x0]
 194:	ldp	q24, q29, [x0, #32]
 198:	add	x0, x0, #0x40
 19c:	ldp	q21, q23, [x6, #64]
 1a0:	ldp	q25, q30, [x6, #96]
 1a4:	add	x6, x6, #0x40
 1a8:	fmla	v31.4s, v20.4s, v21.4s
 1ac:	fmla	v0.4s, v22.4s, v23.4s
 1b0:	fmla	v27.4s, v24.4s, v25.4s
 1b4:	fmla	v28.4s, v29.4s, v30.4s
 1b8:	cmp	x6, x2
 1bc:	b.ne	190 <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x190>  // b.any
 1c0:	add	x9, x5, x1
 1c4:	add	x6, x3, x1
 1c8:	cmp	x4, x6
 1cc:	b.ne	10c <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x10c>  // b.any
 1d0:	cmp	x8, x4
 1d4:	b.eq	28c <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x28c>  // b.none
 1d8:	movi	v29.2d, #0x0
 1dc:	mov	x0, x12
 1e0:	mov	x3, #0x10                  	// #16
 1e4:	mov	x11, #0x0                   	// #0
 1e8:	b	218 <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x218>
 1ec:	movi	v28.4s, #0x0
 1f0:	cmp	x5, #0x10
 1f4:	add	x0, sp, #0x70
 1f8:	mov	x3, #0x10                  	// #16
 1fc:	csel	x3, x5, x3, cs	// cs = hs, nlast
 200:	add	x7, x7, x5
 204:	sub	x3, x3, x5
 208:	add	x0, x0, x5
 20c:	mov	v27.16b, v28.16b
 210:	mov	v0.16b, v28.16b
 214:	mov	v31.16b, v28.16b
 218:	ldr	q24, [x4], #16
 21c:	mov	x2, #0x4                   	// #4
 220:	add	x1, x10, x7
 224:	stp	q0, q27, [sp, #32]
 228:	sub	x4, x4, x8
 22c:	stp	q24, q31, [sp]
 230:	sub	x4, x2, x4, asr #2
 234:	str	q28, [sp, #64]
 238:	sub	x2, x4, x11
 23c:	str	x4, [sp, #80]
 240:	lsl	x2, x2, #2
 244:	str	s29, [sp, #88]
 248:	bl	0 <__memcpy_chk>
 24c:	ldr	x4, [sp, #80]
 250:	adrp	x0, 0 <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)>
 254:	ldr	s29, [sp, #88]
 258:	ldr	q25, [x0]
 25c:	dup	v30.4s, w4
 260:	ldp	q24, q31, [sp]
 264:	dup	v29.4s, v29.s[0]
 268:	ldr	q23, [sp, #112]
 26c:	cmgt	v30.4s, v30.4s, v25.4s
 270:	cmge	v29.4s, v25.4s, v29.4s
 274:	mov	v25.16b, v31.16b
 278:	ldr	q28, [sp, #64]
 27c:	and	v30.16b, v29.16b, v30.16b
 280:	fmla	v25.4s, v23.4s, v24.4s
 284:	ldp	q0, q27, [sp, #32]
 288:	bit	v31.16b, v25.16b, v30.16b
 28c:	fadd	v0.4s, v31.4s, v0.4s
 290:	fadd	v27.4s, v27.4s, v28.4s
 294:	fadd	v0.4s, v0.4s, v27.4s
 298:	faddp	v0.4s, v0.4s, v0.4s
 29c:	faddp	v0.4s, v0.4s, v0.4s
 2a0:	adrp	x0, 0 <__stack_chk_guard>
 2a4:	ldr	x0, [x0]
 2a8:	ldr	x2, [sp, #136]
