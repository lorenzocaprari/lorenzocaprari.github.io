	.file	"exp_simd_cxx26.cpp"
	.text
	.p2align 4
	.globl	_ZN5nesso3exp17DotCxx26Simd1Avx2ESt4spanIKfLm18446744073709551615EES3_
	.hidden	_ZN5nesso3exp17DotCxx26Simd1Avx2ESt4spanIKfLm18446744073709551615EES3_
	.type	_ZN5nesso3exp17DotCxx26Simd1Avx2ESt4spanIKfLm18446744073709551615EES3_, @function
_ZN5nesso3exp17DotCxx26Simd1Avx2ESt4spanIKfLm18446744073709551615EES3_:
.LFB4179:
	.cfi_startproc
	endbr64
	cmpq	$7, %rsi
	jbe	.L6
	movl	$8, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	.p2align 5
	.p2align 4
	.p2align 3
.L3:
	vmovdqu	-32(%rdi,%rax,4), %ymm0
	vmulps	-32(%rdx,%rax,4), %ymm0, %ymm0
	addq	$8, %rax
	vaddps	%ymm0, %ymm1, %ymm1
	cmpq	%rax, %rsi
	jnb	.L3
	vmovaps	%xmm1, %xmm0
	vextractf128	$0x1, %ymm1, %xmm1
	leaq	-8(%rsi), %rax
	vaddps	%xmm1, %xmm0, %xmm0
	andq	$-8, %rax
	addq	$8, %rax
	vpermilps	$78, %xmm0, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vshufps	$85, %xmm1, %xmm1, %xmm0
	vaddss	%xmm1, %xmm0, %xmm0
	vzeroupper
.L2:
	cmpq	%rsi, %rax
	jnb	.L1
	movq	%rsi, %rcx
	subq	%rax, %rcx
	leaq	-1(%rcx), %r8
	cmpq	$2, %r8
	jbe	.L5
	vmovups	(%rdi,%rax,4), %xmm1
	vmulps	(%rdx,%rax,4), %xmm1, %xmm1
	movq	%rcx, %r8
	andq	$-4, %r8
	andl	$3, %ecx
	vaddss	%xmm0, %xmm1, %xmm0
	vshufps	$85, %xmm1, %xmm1, %xmm2
	vaddss	%xmm0, %xmm2, %xmm2
	vunpckhps	%xmm1, %xmm1, %xmm0
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm1, %xmm0, %xmm0
	je	.L1
	addq	%r8, %rax
.L5:
	leaq	1(%rax), %rcx
	vmovss	(%rdi,%rax,4), %xmm3
	vfmadd231ss	(%rdx,%rax,4), %xmm3, %xmm0
	cmpq	%rsi, %rcx
	jnb	.L1
	leaq	2(%rax), %rcx
	vmovss	4(%rdx,%rax,4), %xmm4
	vfmadd231ss	4(%rdi,%rax,4), %xmm4, %xmm0
	cmpq	%rsi, %rcx
	jnb	.L1
	vmovss	8(%rdx,%rax,4), %xmm5
	vfmadd231ss	8(%rdi,%rax,4), %xmm5, %xmm0
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	jmp	.L2
	.cfi_endproc
.LFE4179:
	.size	_ZN5nesso3exp17DotCxx26Simd1Avx2ESt4spanIKfLm18446744073709551615EES3_, .-_ZN5nesso3exp17DotCxx26Simd1Avx2ESt4spanIKfLm18446744073709551615EES3_
	.p2align 4
	.globl	_ZN5nesso3exp17DotCxx26Simd4Avx2ESt4spanIKfLm18446744073709551615EES3_
	.hidden	_ZN5nesso3exp17DotCxx26Simd4Avx2ESt4spanIKfLm18446744073709551615EES3_
	.type	_ZN5nesso3exp17DotCxx26Simd4Avx2ESt4spanIKfLm18446744073709551615EES3_, @function
_ZN5nesso3exp17DotCxx26Simd4Avx2ESt4spanIKfLm18446744073709551615EES3_:
.LFB4180:
	.cfi_startproc
	endbr64
	movq	%rdi, %r9
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rsi, %rdi
	movq	%rdx, %r8
	cmpq	$31, %rsi
	jbe	.L16
	leaq	-32(%rsi), %rcx
	vmovaps	%ymm0, %ymm3
	vmovaps	%ymm0, %ymm1
	movq	%rdx, %rax
	movq	%rcx, %rsi
	movq	%r9, %rdx
	vmovaps	%ymm0, %ymm2
	shrq	$5, %rsi
	salq	$7, %rsi
	leaq	128(%r8,%rsi), %rsi
	.p2align 6
	.p2align 4
	.p2align 3
.L11:
	vmovups	(%rax), %ymm4
	vmovups	32(%rax), %ymm5
	subq	$-128, %rax
	subq	$-128, %rdx
	vmovups	-64(%rax), %ymm6
	vmovups	-32(%rax), %ymm7
	vfmadd231ps	-128(%rdx), %ymm4, %ymm0
	vfmadd231ps	-96(%rdx), %ymm5, %ymm2
	vfmadd231ps	-64(%rdx), %ymm6, %ymm1
	vfmadd231ps	-32(%rdx), %ymm7, %ymm3
	cmpq	%rsi, %rax
	jne	.L11
	andq	$-32, %rcx
	leaq	32(%rcx), %rax
	leaq	40(%rcx), %rdx
.L10:
	cmpq	%rdx, %rdi
	jb	.L12
	vmovups	(%r9,%rax,4), %ymm4
	vfmadd231ps	(%r8,%rax,4), %ymm4, %ymm0
	leaq	8(%rdx), %rax
	cmpq	%rax, %rdi
	jb	.L13
	leaq	16(%rdx), %rax
	vmovups	(%r9,%rdx,4), %ymm5
	vfmadd231ps	(%r8,%rdx,4), %ymm5, %ymm0
	cmpq	%rax, %rdi
	jb	.L13
	vmovups	32(%r8,%rdx,4), %ymm6
	vfmadd231ps	32(%r9,%rdx,4), %ymm6, %ymm0
.L13:
	movq	%rdi, %rax
	subq	%rdx, %rax
	andq	$-8, %rax
	addq	%rdx, %rax
.L12:
	vaddps	%ymm0, %ymm2, %ymm2
	vaddps	%ymm3, %ymm1, %ymm1
	vaddps	%ymm2, %ymm1, %ymm1
	vmovaps	%xmm1, %xmm0
	vextractf128	$0x1, %ymm1, %xmm1
	vaddps	%xmm1, %xmm0, %xmm0
	vpermilps	$78, %xmm0, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vshufps	$85, %xmm1, %xmm1, %xmm0
	vaddss	%xmm1, %xmm0, %xmm0
	cmpq	%rdi, %rax
	jnb	.L9
	movq	%rdi, %rdx
	subq	%rax, %rdx
	leaq	-1(%rdx), %rcx
	cmpq	$2, %rcx
	jbe	.L15
	vmovups	(%r9,%rax,4), %xmm1
	vmulps	(%r8,%rax,4), %xmm1, %xmm1
	movq	%rdx, %rcx
	andq	$-4, %rcx
	andl	$3, %edx
	vaddss	%xmm1, %xmm0, %xmm0
	vshufps	$85, %xmm1, %xmm1, %xmm2
	vaddss	%xmm0, %xmm2, %xmm2
	vunpckhps	%xmm1, %xmm1, %xmm0
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm1, %xmm0, %xmm0
	je	.L9
	addq	%rcx, %rax
.L15:
	leaq	1(%rax), %rdx
	vmovss	(%r9,%rax,4), %xmm3
	vfmadd231ss	(%r8,%rax,4), %xmm3, %xmm0
	cmpq	%rdi, %rdx
	jnb	.L9
	leaq	2(%rax), %rdx
	vmovss	4(%r8,%rax,4), %xmm3
	vfmadd231ss	4(%r9,%rax,4), %xmm3, %xmm0
	cmpq	%rdi, %rdx
	jnb	.L9
	vmovss	8(%r8,%rax,4), %xmm3
	vfmadd231ss	8(%r9,%rax,4), %xmm3, %xmm0
.L9:
	vzeroupper
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	movl	$8, %edx
	vmovaps	%ymm0, %ymm3
	vmovaps	%ymm0, %ymm1
	xorl	%eax, %eax
	vmovaps	%ymm0, %ymm2
	jmp	.L10
	.cfi_endproc
.LFE4180:
	.size	_ZN5nesso3exp17DotCxx26Simd4Avx2ESt4spanIKfLm18446744073709551615EES3_, .-_ZN5nesso3exp17DotCxx26Simd4Avx2ESt4spanIKfLm18446744073709551615EES3_
	.p2align 4
	.globl	_ZN5nesso3exp14Cxx26LanesAvx2Ev
	.hidden	_ZN5nesso3exp14Cxx26LanesAvx2Ev
	.type	_ZN5nesso3exp14Cxx26LanesAvx2Ev, @function
_ZN5nesso3exp14Cxx26LanesAvx2Ev:
.LFB4181:
	.cfi_startproc
	endbr64
	movl	$8, %eax
	ret
	.cfi_endproc
.LFE4181:
	.size	_ZN5nesso3exp14Cxx26LanesAvx2Ev, .-_ZN5nesso3exp14Cxx26LanesAvx2Ev
	.ident	"GCC: (Ubuntu 16.2.0-3ubuntu1) 16.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
