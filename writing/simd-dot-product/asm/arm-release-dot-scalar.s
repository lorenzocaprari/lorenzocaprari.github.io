# release arm64 binary v0.3.0
# DistanceMetrics::DotProduct<float> at 0x155a40 (called from ScoreCorpusRows)
# no DotProductScalar symbol (LTO). NEON 128-bit (v*.4s), 1 scalar accumulator (s31),
# fmul + serial fadd chain (same shape as x86 mulps+addss), fmadd for scalar tail
  155a98:      	b.ls	0x155bec <_ZN5nesso4core4math15DistanceMetrics10DotProductIfEESt8expectedIT_NS0_11EngineErrorEESt4spanIKS5_Lm18446744073709551615EESA_+0x1ac>
  155a9c:      	lsr	x3, x1, #2
  155aa0:      	movi	v31.2s, #0x0
  155aa4:      	mov	x0, #0x0                // =0
  155aa8:      	lsl	x3, x3, #4
  155aac:      	ldr	q1, [x2, x0]
  155ab0:      	ldr	q29, [x4, x0]
  155ab4:      	add	x0, x0, #0x10
  155ab8:      	fmul	v29.4s, v1.4s, v29.4s
  155abc:      	fadd	s31, s31, s29
  155ac0:      	mov	s0, v29.s[1]
  155ac4:      	mov	s30, v29.s[2]
  155ac8:      	mov	s29, v29.s[3]
  155acc:      	fadd	s31, s0, s31
  155ad0:      	fadd	s31, s30, s31
  155ad4:      	fadd	s31, s31, s29
  155ad8:      	cmp	x0, x3
  155adc:      	b.ne	0x155aac <_ZN5nesso4core4math15DistanceMetrics10DotProductIfEESt8expectedIT_NS0_11EngineErrorEESt4spanIKS5_Lm18446744073709551615EESA_+0x6c>
  155ae0:      	and	x3, x1, #0xfffffffffffffffc
  155ae4:      	tst	x1, #0x3
  155ae8:      	b.eq	0x155b34 <_ZN5nesso4core4math15DistanceMetrics10DotProductIfEESt8expectedIT_NS0_11EngineErrorEESt4spanIKS5_Lm18446744073709551615EESA_+0xf4>
  155aec:      	lsl	x0, x3, #2
  155af0:      	add	x5, x3, #0x1
  155af4:      	ldr	s7, [x4, x0]
  155af8:      	ldr	s6, [x2, x0]
  155afc:      	fmadd	s31, s7, s6, s31
  155b00:      	cmp	x1, x5
  155b04:      	b.ls	0x155b34 <_ZN5nesso4core4math15DistanceMetrics10DotProductIfEESt8expectedIT_NS0_11EngineErrorEESt4spanIKS5_Lm18446744073709551615EESA_+0xf4>
  155b08:      	add	x5, x0, #0x4
  155b0c:      	add	x3, x3, #0x2
  155b10:      	ldr	s5, [x2, x5]
  155b14:      	ldr	s4, [x4, x5]
  155b18:      	fmadd	s31, s5, s4, s31
  155b1c:      	cmp	x1, x3
  155b20:      	b.ls	0x155b34 <_ZN5nesso4core4math15DistanceMetrics10DotProductIfEESt8expectedIT_NS0_11EngineErrorEESt4spanIKS5_Lm18446744073709551615EESA_+0xf4>
  155b24:      	add	x0, x0, #0x8
  155b28:      	ldr	s3, [x4, x0]
  155b2c:      	ldr	s2, [x2, x0]
  155b30:      	fmadd	s31, s3, s2, s31
  155b34:      	fmov	x2, d31
  155b38:      	mov	x0, #0x0                // =0
  155b3c:      	mov	x1, #0x1                // =1
  155b40:      	bfxil	x0, x2, #0, #32
  155b44:      	bfi	x0, x1, #32, #8
  155b48:      	adrp	x1, 0x12be000 <_GLOBAL_OFFSET_TABLE_+0x67c0>
  155b4c:      	ldr	x1, [x1, #0x980]
  155b50:      	ldr	x3, [sp, #0x38]
  155b54:      	ldr	x2, [x1]
