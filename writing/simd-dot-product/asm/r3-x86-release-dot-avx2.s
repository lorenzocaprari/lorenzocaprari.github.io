# release DotProductAvx2Fma
  285200:	vmovups (%rdx),%ymm4
  285204:	vmovups 0x20(%rdx),%ymm5
  285209:	sub    $0xffffffffffffff80,%rax
  28520d:	sub    $0xffffffffffffff80,%rdx
  285211:	vmovups -0x40(%rdx),%ymm6
  285216:	vmovups -0x20(%rdx),%ymm7
  28521b:	vfmadd231ps -0x80(%rax),%ymm4,%ymm0
  285221:	vfmadd231ps -0x60(%rax),%ymm5,%ymm2
  285227:	vfmadd231ps -0x40(%rax),%ymm6,%ymm1
  28522d:	vfmadd231ps -0x20(%rax),%ymm7,%ymm3
  285233:	cmp    %rax,%rcx
  285236:	jne    285200 <nesso::core::math::detail::DotProductAvx2Fma(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x50>
  285238:	and    $0xffffffffffffffe0,%r9
  28523c:	lea    0x20(%r9),%rax
  285240:	add    $0x28,%r9
  285244:	cmp    %r9,%rsi
  285247:	jb     285288 <nesso::core::math::detail::DotProductAvx2Fma(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0xd8>
  285249:	mov    %r9,%rdx
  28524c:	jmp    285263 <nesso::core::math::detail::DotProductAvx2Fma(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0xb3>
  28524e:	data16 cs nopw 0x0(%rax,%rax,1)
  285259:	nopl   0x0(%rax)
  285260:	mov    %rcx,%rdx
  285263:	lea    0x8(%rdx),%rcx
  285267:	vmovups (%r8,%rax,4),%ymm4
  28526d:	vfmadd231ps (%rdi,%rax,4),%ymm4,%ymm0
  285273:	mov    %rdx,%rax
  285276:	cmp    %rcx,%rsi
  285279:	jae    285260 <nesso::core::math::detail::DotProductAvx2Fma(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0xb0>
  28527b:	mov    %rsi,%rax
  28527e:	sub    %r9,%rax
  285281:	and    $0xfffffffffffffff8,%rax
  285285:	add    %r9,%rax
  285288:	vaddps %ymm2,%ymm0,%ymm0
  28528c:	vaddps %ymm3,%ymm1,%ymm1
  285290:	vaddps %ymm0,%ymm1,%ymm1
  285294:	vmovaps %xmm1,%xmm0
  285298:	vextractf128 $0x1,%ymm1,%xmm1
  28529e:	vaddps %xmm1,%xmm0,%xmm0
  2852a2:	vhaddps %xmm0,%xmm0,%xmm0
  2852a6:	vhaddps %xmm0,%xmm0,%xmm0
  2852aa:	cmp    %rsi,%rax
  2852ad:	jae    28532b <nesso::core::math::detail::DotProductAvx2Fma(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x17b>
  2852af:	mov    %rsi,%rdx
  2852b2:	sub    %rax,%rdx
  2852b5:	lea    -0x1(%rdx),%rcx
  2852b9:	cmp    $0x2,%rcx
  2852bd:	jbe    2852f4 <nesso::core::math::detail::DotProductAvx2Fma(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x144>
  2852bf:	vmovups (%r8,%rax,4),%xmm1
  2852c5:	vmulps (%rdi,%rax,4),%xmm1,%xmm1
  2852ca:	vaddss %xmm1,%xmm0,%xmm0
  2852ce:	vshufps $0x55,%xmm1,%xmm1,%xmm2
  2852d3:	vaddss %xmm0,%xmm2,%xmm2
  2852d7:	vunpckhps %xmm1,%xmm1,%xmm0
  2852db:	vshufps $0xff,%xmm1,%xmm1,%xmm1
  2852e0:	vaddss %xmm2,%xmm0,%xmm0
  2852e4:	vaddss %xmm1,%xmm0,%xmm0
  2852e8:	test   $0x3,%dl
  2852eb:	je     28532b <nesso::core::math::detail::DotProductAvx2Fma(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x17b>
  2852ed:	and    $0xfffffffffffffffc,%rdx
  2852f1:	add    %rdx,%rax
  2852f4:	lea    0x1(%rax),%rdx
  2852f8:	vmovss (%rdi,%rax,4),%xmm3
  2852fd:	vfmadd231ss (%r8,%rax,4),%xmm3,%xmm0
  285303:	cmp    %rsi,%rdx
  285306:	jae    28532b <nesso::core::math::detail::DotProductAvx2Fma(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x17b>
  285308:	lea    0x2(%rax),%rdx
  28530c:	vmovss 0x4(%rdi,%rax,4),%xmm3
  285312:	vfmadd231ss 0x4(%r8,%rax,4),%xmm3,%xmm0
  285319:	cmp    %rsi,%rdx
  28531c:	jae    28532b <nesso::core::math::detail::DotProductAvx2Fma(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x17b>
  28531e:	vmovss 0x8(%rdi,%rax,4),%xmm3
  285324:	vfmadd231ss 0x8(%r8,%rax,4),%xmm3,%xmm0
  28532b:	vzeroupper
  28532e:	ret
  28532f:	nop
  285330:	push   %rbp
  285331:	lea    0x10aa160(%rip),%rdx        # 132f498 <nesso::embed::REPLACEMENT+0xf63a8>
  285338:	mov    $0x2f,%esi
  28533d:	lea    0xfc9c58(%rip),%rdi        # 124ef9c <nesso::embed::REPLACEMENT+0x15eac>
