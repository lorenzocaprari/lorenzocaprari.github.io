# release ScoreCorpusRows
  25dd32:	pxor   %xmm0,%xmm0
  25dd36:	shl    $0x4,%rdx
  25dd3a:	nopw   0x0(%rax,%rax,1)
  25dd40:	movups (%r14,%rax,1),%xmm1
  25dd45:	movups 0x0(%r13,%rax,1),%xmm5
  25dd4b:	add    $0x10,%rax
  25dd4f:	mulps  %xmm5,%xmm1
  25dd52:	movaps %xmm1,%xmm2
  25dd55:	movaps %xmm1,%xmm3
  25dd58:	movaps %xmm1,%xmm4
  25dd5b:	addss  %xmm0,%xmm2
  25dd5f:	shufps $0x55,%xmm1,%xmm3
  25dd63:	unpckhps %xmm1,%xmm4
  25dd66:	shufps $0xff,%xmm1,%xmm1
  25dd6a:	movaps %xmm4,%xmm0
  25dd6d:	addss  %xmm3,%xmm2
  25dd71:	addss  %xmm2,%xmm0
  25dd75:	addss  %xmm1,%xmm0
  25dd79:	cmp    %rdx,%rax
  25dd7c:	jne    25dd40 <nesso::ScoreCorpusRows(void*, unsigned long, unsigned long)+0xa0>
  25dd7e:	test   $0x3,%r15b
  25dd82:	je     25ddd2 <nesso::ScoreCorpusRows(void*, unsigned long, unsigned long)+0x132>
  25dd84:	mov    %r15,%rax
  25dd87:	and    $0xfffffffffffffffc,%rax
  25dd8b:	movss  0x0(%r13,%rax,4),%xmm1
  25dd92:	mulss  (%r14,%rax,4),%xmm1
  25dd98:	lea    0x1(%rax),%rdx
  25dd9c:	addss  %xmm1,%xmm0
  25dda0:	cmp    %r15,%rdx
  25dda3:	jae    25ddd2 <nesso::ScoreCorpusRows(void*, unsigned long, unsigned long)+0x132>
  25dda5:	movss  0x4(%r14,%rax,4),%xmm1
  25ddac:	mulss  0x4(%r13,%rax,4),%xmm1
  25ddb3:	lea    0x2(%rax),%rdx
  25ddb7:	addss  %xmm1,%xmm0
  25ddbb:	cmp    %r15,%rdx
  25ddbe:	jae    25ddd2 <nesso::ScoreCorpusRows(void*, unsigned long, unsigned long)+0x132>
  25ddc0:	movss  0x8(%r14,%rax,4),%xmm1
  25ddc7:	mulss  0x8(%r13,%rax,4),%xmm1
  25ddce:	addss  %xmm1,%xmm0
  25ddd2:	movd   %xmm0,%eax
  25ddd6:	movss  0xfc1906(%rip),%xmm6        # 121f6e4 <_IO_stdin_used+0x24>
  25ddde:	movaps %xmm0,%xmm1
  25dde1:	movabs $0xffffffff00000000,%rcx
  25ddeb:	and    %rcx,%rbp
  25ddee:	andps  0x10d361b(%rip),%xmm1        # 1331410 <digits.1+0x1050>
  25ddf5:	or     %rax,%rbp
