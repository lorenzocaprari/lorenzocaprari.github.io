	.file	"exp_simd_cxx26.cpp"
	.text
	.p2align 4
	.globl	_ZN5nesso3exp21DotCxx26Simd1BaselineESt4spanIKfLm18446744073709551615EES3_
	.hidden	_ZN5nesso3exp21DotCxx26Simd1BaselineESt4spanIKfLm18446744073709551615EES3_
	.type	_ZN5nesso3exp21DotCxx26Simd1BaselineESt4spanIKfLm18446744073709551615EES3_, @function
_ZN5nesso3exp21DotCxx26Simd1BaselineESt4spanIKfLm18446744073709551615EES3_:
.LFB4168:
	.cfi_startproc
	endbr64
	cmpq	$3, %rsi
	jbe	.L5
	movl	$4, %eax
	pxor	%xmm1, %xmm1
	.p2align 5
	.p2align 4
	.p2align 3
.L3:
	movups	-16(%rdx,%rax,4), %xmm0
	movups	-16(%rdi,%rax,4), %xmm2
	addq	$4, %rax
	mulps	%xmm2, %xmm0
	addps	%xmm0, %xmm1
	cmpq	%rax, %rsi
	jnb	.L3
	movaps	%xmm1, %xmm0
	leaq	-4(%rsi), %rax
	palignr	$8, %xmm0, %xmm0
	andq	$-4, %rax
	addps	%xmm0, %xmm1
	addq	$4, %rax
	movaps	%xmm1, %xmm3
	shufps	$85, %xmm1, %xmm3
	movaps	%xmm3, %xmm0
	addss	%xmm1, %xmm0
.L2:
	cmpq	%rsi, %rax
	jnb	.L1
	movss	(%rdx,%rax,4), %xmm1
	mulss	(%rdi,%rax,4), %xmm1
	leaq	1(%rax), %rcx
	addss	%xmm1, %xmm0
	cmpq	%rsi, %rcx
	jnb	.L1
	movss	4(%rdx,%rax,4), %xmm1
	mulss	4(%rdi,%rax,4), %xmm1
	leaq	2(%rax), %rcx
	addss	%xmm1, %xmm0
	cmpq	%rsi, %rcx
	jnb	.L1
	movss	8(%rdi,%rax,4), %xmm1
	mulss	8(%rdx,%rax,4), %xmm1
	addss	%xmm1, %xmm0
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	jmp	.L2
	.cfi_endproc
.LFE4168:
	.size	_ZN5nesso3exp21DotCxx26Simd1BaselineESt4spanIKfLm18446744073709551615EES3_, .-_ZN5nesso3exp21DotCxx26Simd1BaselineESt4spanIKfLm18446744073709551615EES3_
	.p2align 4
	.globl	_ZN5nesso3exp21DotCxx26Simd4BaselineESt4spanIKfLm18446744073709551615EES3_
	.hidden	_ZN5nesso3exp21DotCxx26Simd4BaselineESt4spanIKfLm18446744073709551615EES3_
	.type	_ZN5nesso3exp21DotCxx26Simd4BaselineESt4spanIKfLm18446744073709551615EES3_, @function
_ZN5nesso3exp21DotCxx26Simd4BaselineESt4spanIKfLm18446744073709551615EES3_:
.LFB4169:
	.cfi_startproc
	endbr64
	movq	%rdi, %r9
	pxor	%xmm1, %xmm1
	movq	%rsi, %rdi
	movq	%rdx, %r8
	cmpq	$15, %rsi
	jbe	.L14
	leaq	-16(%rsi), %rcx
	movaps	%xmm1, %xmm4
	movaps	%xmm1, %xmm2
	movq	%rdx, %rax
	movq	%rcx, %rsi
	movq	%r9, %rdx
	movaps	%xmm1, %xmm3
	shrq	$4, %rsi
	salq	$6, %rsi
	leaq	64(%r8,%rsi), %rsi
	.p2align 4
	.p2align 3
.L10:
	movups	(%rdx), %xmm6
	movups	(%rax), %xmm0
	addq	$64, %rax
	addq	$64, %rdx
	movups	-48(%rdx), %xmm7
	movups	-32(%rdx), %xmm5
	mulps	%xmm6, %xmm0
	movups	-16(%rdx), %xmm6
	addps	%xmm0, %xmm1
	movups	-48(%rax), %xmm0
	mulps	%xmm7, %xmm0
	addps	%xmm0, %xmm3
	movups	-32(%rax), %xmm0
	mulps	%xmm5, %xmm0
	addps	%xmm0, %xmm2
	movups	-16(%rax), %xmm0
	mulps	%xmm6, %xmm0
	addps	%xmm0, %xmm4
	cmpq	%rsi, %rax
	jne	.L10
	movq	%rcx, %rax
	andq	$-16, %rax
	leaq	16(%rax), %rdx
	addq	$20, %rax
.L9:
	cmpq	%rax, %rdi
	jb	.L11
	movups	(%r9,%rdx,4), %xmm0
	movups	(%r8,%rdx,4), %xmm5
	leaq	4(%rax), %rdx
	mulps	%xmm5, %xmm0
	addps	%xmm0, %xmm1
	cmpq	%rdx, %rdi
	jb	.L12
	movups	(%r9,%rax,4), %xmm0
	movups	(%r8,%rax,4), %xmm7
	leaq	8(%rax), %rdx
	mulps	%xmm7, %xmm0
	addps	%xmm0, %xmm1
	cmpq	%rdx, %rdi
	jb	.L12
	movups	16(%r8,%rax,4), %xmm0
	movups	16(%r9,%rax,4), %xmm7
	mulps	%xmm7, %xmm0
	addps	%xmm0, %xmm1
.L12:
	movq	%rdi, %rdx
	subq	%rax, %rdx
	andq	$-4, %rdx
	addq	%rax, %rdx
.L11:
	addps	%xmm4, %xmm2
	addps	%xmm1, %xmm3
	addps	%xmm3, %xmm2
	movaps	%xmm2, %xmm1
	palignr	$8, %xmm1, %xmm1
	addps	%xmm2, %xmm1
	movaps	%xmm1, %xmm4
	shufps	$85, %xmm1, %xmm4
	movaps	%xmm4, %xmm0
	addss	%xmm1, %xmm0
	cmpq	%rdi, %rdx
	jnb	.L8
	movss	(%r8,%rdx,4), %xmm1
	mulss	(%r9,%rdx,4), %xmm1
	leaq	1(%rdx), %rax
	addss	%xmm1, %xmm0
	cmpq	%rdi, %rax
	jnb	.L8
	movss	4(%r8,%rdx,4), %xmm1
	mulss	4(%r9,%rdx,4), %xmm1
	leaq	2(%rdx), %rax
	addss	%xmm1, %xmm0
	cmpq	%rdi, %rax
	jnb	.L8
	movss	8(%r9,%rdx,4), %xmm1
	mulss	8(%r8,%rdx,4), %xmm1
	addss	%xmm1, %xmm0
.L8:
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	movl	$4, %eax
	movaps	%xmm1, %xmm4
	movaps	%xmm1, %xmm2
	xorl	%edx, %edx
	movaps	%xmm1, %xmm3
	jmp	.L9
	.cfi_endproc
.LFE4169:
	.size	_ZN5nesso3exp21DotCxx26Simd4BaselineESt4spanIKfLm18446744073709551615EES3_, .-_ZN5nesso3exp21DotCxx26Simd4BaselineESt4spanIKfLm18446744073709551615EES3_
	.p2align 4
	.globl	_ZN5nesso3exp18Cxx26LanesBaselineEv
	.hidden	_ZN5nesso3exp18Cxx26LanesBaselineEv
	.type	_ZN5nesso3exp18Cxx26LanesBaselineEv, @function
_ZN5nesso3exp18Cxx26LanesBaselineEv:
.LFB4170:
	.cfi_startproc
	endbr64
	movl	$4, %eax
	ret
	.cfi_endproc
.LFE4170:
	.size	_ZN5nesso3exp18Cxx26LanesBaselineEv, .-_ZN5nesso3exp18Cxx26LanesBaselineEv
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
