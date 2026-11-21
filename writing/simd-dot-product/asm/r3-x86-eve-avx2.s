# build/Release/bench/CMakeFiles/exp_simd_portable_avx2.dir/exp_simd_portable.cpp.o DotEve(
  60:	vxorps %xmm2,%xmm2,%xmm2
  64:	sub    %rdi,%rdx
  67:	vpcmpgtd %ymm4,%ymm1,%ymm1
  6b:	add    %r9,%rdx
  6e:	vpxor  %ymm0,%ymm1,%ymm1
  72:	vmaskmovps (%rdx),%ymm1,%ymm0
  77:	vfmadd132ps -0x20(%r10),%ymm2,%ymm0
  7d:	vpsrad $0x1f,%ymm1,%ymm1
  82:	vandps %ymm1,%ymm0,%ymm0
  86:	cmp    %r10,%rsi
  89:	je     240 <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x240>
  8f:	vmovaps %ymm2,%ymm6
  93:	vmovaps %ymm2,%ymm3
  97:	vmovaps %ymm2,%ymm5
  9b:	add    $0x20,%rdx
  9f:	lea    0x20(%r10),%rcx
  a3:	vmovaps (%r10),%ymm7
  a8:	vfmadd231ps (%rdx),%ymm7,%ymm0
  ad:	cmp    %rcx,%rsi
  b0:	je     190 <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x190>
  b6:	lea    0x40(%r10),%rcx
  ba:	vmovaps 0x20(%r10),%ymm7
  c0:	vfmadd231ps 0x20(%rdx),%ymm7,%ymm5
  c6:	cmp    %rcx,%rsi
  c9:	je     190 <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x190>
  cf:	lea    0x60(%r10),%rcx
  d3:	vmovaps 0x40(%r10),%ymm7
  d9:	vfmadd231ps 0x40(%rdx),%ymm7,%ymm3
  df:	cmp    %rcx,%rsi
  e2:	je     190 <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x190>
  e8:	lea    0x80(%r10),%r11
  ef:	mov    %rsi,%rcx
  f2:	vmovaps 0x60(%r10),%ymm7
  f8:	lea    0x80(%rdx),%rbx
  ff:	sub    %r11,%rcx
 102:	vfmadd231ps 0x60(%rdx),%ymm7,%ymm6
 108:	sar    $0x2,%rcx
 10c:	lea    0x1f(%rcx),%rdi
 110:	cmovns %rcx,%rdi
 114:	sar    $0x5,%rdi
 118:	je     25d <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x25d>
 11e:	shl    $0x7,%rdi
 122:	mov    %rbx,%rcx
 125:	lea    (%r10,%rdi,1),%rdx
 129:	nop
 12a:	data16 cs nopw 0x0(%rax,%rax,1)
 135:	data16 cs nopw 0x0(%rax,%rax,1)
 140:	vmovaps 0x80(%r10),%ymm7
 149:	sub    $0xffffffffffffff80,%r10
 14d:	vfmadd231ps (%rcx),%ymm7,%ymm0
 152:	sub    $0xffffffffffffff80,%rcx
 156:	vmovaps 0x20(%r10),%ymm7
 15c:	vfmadd231ps -0x60(%rcx),%ymm7,%ymm5
 162:	vmovaps 0x40(%r10),%ymm7
 168:	vfmadd231ps -0x40(%rcx),%ymm7,%ymm3
 16e:	vmovaps 0x60(%r10),%ymm7
 174:	vfmadd231ps -0x20(%rcx),%ymm7,%ymm6
 17a:	cmp    %rdx,%r10
 17d:	jne    140 <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x140>
 17f:	lea    (%rbx,%rdi,1),%rdx
 183:	lea    (%r11,%rdi,1),%r10
 187:	cmp    %r10,%rsi
 18a:	jne    9f <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x9f>
 190:	cmp    %rax,%rsi
 193:	je     20a <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x20a>
 195:	xor    %edx,%edx
 197:	jmp    1b8 <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x1b8>
 199:	nopl   0x0(%rax)
 1a0:	vxorps %xmm6,%xmm6,%xmm6
 1a4:	vmovdqa 0x0(%rip),%ymm4        # 1ac <nesso::exp::(anonymous namespace)::DotEve(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x1ac>
 1ac:	vmovaps %ymm6,%ymm3
 1b0:	vmovaps %ymm6,%ymm5
 1b4:	vmovaps %ymm6,%ymm0
 1b8:	lea    0x20(%rsi),%rdi
 1bc:	mov    $0x8,%ecx
 1c1:	vmovd  %edx,%xmm1
 1c5:	mov    %rax,%rdx
 1c8:	sub    %rax,%rdi
 1cb:	vpbroadcastd %xmm1,%ymm1
 1d0:	sub    %rsi,%rdx
 1d3:	shl    $0x3e,%rax
 1d7:	sar    $0x2,%rdi
 1db:	vpcmpgtd %ymm4,%ymm1,%ymm1
 1df:	sub    %rdx,%rax
 1e2:	sub    %rdi,%rcx
 1e5:	add    %r8,%rax
 1e8:	vmovd  %ecx,%xmm2
 1ec:	vpbroadcastd %xmm2,%ymm2
 1f1:	vpcmpgtd %ymm4,%ymm2,%ymm2
 1f5:	vpandn %ymm2,%ymm1,%ymm1
 1f9:	vmaskmovps (%r9,%rax,1),%ymm1,%ymm2
 1ff:	vfmadd132ps (%rsi),%ymm0,%ymm2
 204:	vblendvps %ymm1,%ymm2,%ymm0,%ymm0
 20a:	vaddps %ymm5,%ymm0,%ymm0
 20e:	vaddps %ymm6,%ymm3,%ymm3
 212:	vaddps %ymm3,%ymm0,%ymm0
 216:	vmovaps %xmm0,%xmm1
 21a:	vextractf128 $0x1,%ymm0,%xmm0
 220:	vaddps %xmm0,%xmm1,%xmm0
 224:	vmovshdup %xmm0,%xmm1
 228:	vaddps %xmm1,%xmm0,%xmm0
 22c:	vmovhlps %xmm0,%xmm1,%xmm1
 230:	vaddss %xmm1,%xmm0,%xmm0
 234:	vzeroupper
 237:	mov    -0x8(%rbp),%rbx
 23b:	leave
 23c:	ret
 23d:	nopl   (%rax)
 240:	vxorps %xmm6,%xmm6,%xmm6
 244:	vmovaps %ymm6,%ymm3
