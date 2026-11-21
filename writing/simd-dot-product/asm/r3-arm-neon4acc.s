# local exp_simd_portable_v2 DotNeon4Acc, float32x4_t x4 vfmaq_f32
 568:	ldp	q21, q27, [x3, #32]
 56c:	add	x3, x3, #0x40
 570:	ldp	q20, q26, [x4, #32]
 574:	add	x4, x4, #0x40
 578:	fmla	v28.4s, v25.4s, v24.4s
 57c:	fmla	v29.4s, v23.4s, v22.4s
 580:	fmla	v19.4s, v21.4s, v20.4s
 584:	fmla	v18.4s, v27.4s, v26.4s
 588:	cmp	x3, x5
 58c:	b.ne	560 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x30>  // b.any
 590:	faddp	v28.4s, v28.4s, v28.4s
 594:	and	x3, x6, #0xfffffffffffffff0
 598:	faddp	v29.4s, v29.4s, v29.4s
 59c:	add	x3, x3, #0x10
 5a0:	faddp	v19.4s, v19.4s, v19.4s
 5a4:	faddp	v18.4s, v18.4s, v18.4s
 5a8:	faddp	v28.4s, v28.4s, v28.4s
 5ac:	faddp	v29.4s, v29.4s, v29.4s
 5b0:	faddp	v19.4s, v19.4s, v19.4s
 5b4:	faddp	v18.4s, v18.4s, v18.4s
 5b8:	fadd	s29, s29, s28
 5bc:	fadd	s19, s29, s19
 5c0:	fadd	s0, s19, s18
 5c4:	cmp	x1, x3
 5c8:	b.ls	764 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x234>  // b.plast
 5cc:	lsl	x4, x3, #2
 5d0:	add	x5, x3, #0x1
 5d4:	ldr	s17, [x2, x4]
 5d8:	ldr	s16, [x0, x4]
 5dc:	fmadd	s0, s17, s16, s0
 5e0:	cmp	x1, x5
 5e4:	b.ls	764 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x234>  // b.plast
 5e8:	add	x5, x4, #0x4
 5ec:	ldr	s7, [x2, x5]
 5f0:	ldr	s6, [x0, x5]
 5f4:	add	x5, x3, #0x2
 5f8:	fmadd	s0, s7, s6, s0
 5fc:	cmp	x1, x5
 600:	b.ls	764 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x234>  // b.plast
 604:	add	x5, x4, #0x8
 608:	ldr	s5, [x2, x5]
 60c:	ldr	s4, [x0, x5]
 610:	add	x5, x3, #0x3
 614:	fmadd	s0, s5, s4, s0
 618:	cmp	x1, x5
 61c:	b.ls	764 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x234>  // b.plast
 620:	add	x5, x4, #0xc
 624:	ldr	s3, [x2, x5]
 628:	ldr	s2, [x0, x5]
 62c:	add	x5, x3, #0x4
 630:	fmadd	s0, s3, s2, s0
 634:	cmp	x5, x1
 638:	b.cs	764 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x234>  // b.hs, b.nlast
 63c:	add	x5, x4, #0x10
 640:	ldr	s1, [x2, x5]
 644:	ldr	s31, [x0, x5]
 648:	add	x5, x3, #0x5
 64c:	fmadd	s0, s1, s31, s0
 650:	cmp	x5, x1
 654:	b.cs	764 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x234>  // b.hs, b.nlast
 658:	add	x5, x4, #0x14
 65c:	ldr	s30, [x0, x5]
 660:	ldr	s25, [x2, x5]
 664:	add	x5, x3, #0x6
 668:	fmadd	s0, s30, s25, s0
 66c:	cmp	x1, x5
 670:	b.ls	764 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x234>  // b.plast
 674:	add	x5, x4, #0x18
 678:	ldr	s24, [x0, x5]
 67c:	ldr	s23, [x2, x5]
 680:	add	x5, x3, #0x7
 684:	fmadd	s0, s24, s23, s0
 688:	cmp	x1, x5
 68c:	b.ls	764 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x234>  // b.plast
 690:	add	x5, x4, #0x1c
 694:	ldr	s22, [x0, x5]
 698:	ldr	s21, [x2, x5]
 69c:	add	x5, x3, #0x8
 6a0:	fmadd	s0, s22, s21, s0
 6a4:	cmp	x1, x5
 6a8:	b.ls	764 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x234>  // b.plast
 6ac:	add	x5, x4, #0x20
 6b0:	ldr	s20, [x0, x5]
 6b4:	ldr	s19, [x2, x5]
 6b8:	add	x5, x3, #0x9
 6bc:	fmadd	s0, s20, s19, s0
 6c0:	cmp	x1, x5
 6c4:	b.ls	764 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x234>  // b.plast
 6c8:	add	x5, x4, #0x24
 6cc:	ldr	s18, [x0, x5]
 6d0:	ldr	s17, [x2, x5]
 6d4:	add	x5, x3, #0xa
 6d8:	fmadd	s0, s18, s17, s0
 6dc:	cmp	x1, x5
 6e0:	b.ls	764 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x234>  // b.plast
 6e4:	add	x5, x4, #0x28
 6e8:	ldr	s16, [x0, x5]
 6ec:	ldr	s7, [x2, x5]
 6f0:	add	x5, x3, #0xb
 6f4:	fmadd	s0, s16, s7, s0
 6f8:	cmp	x1, x5
 6fc:	b.ls	764 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x234>  // b.plast
 700:	add	x5, x4, #0x2c
 704:	ldr	s6, [x0, x5]
 708:	ldr	s5, [x2, x5]
 70c:	add	x5, x3, #0xc
 710:	fmadd	s0, s6, s5, s0
 714:	cmp	x1, x5
 718:	b.ls	764 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x234>  // b.plast
 71c:	add	x5, x4, #0x30
 720:	ldr	s4, [x0, x5]
 724:	ldr	s3, [x2, x5]
 728:	add	x5, x3, #0xd
 72c:	fmadd	s0, s4, s3, s0
 730:	cmp	x1, x5
 734:	b.ls	764 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x234>  // b.plast
 738:	add	x5, x4, #0x34
 73c:	add	x3, x3, #0xe
 740:	ldr	s2, [x0, x5]
 744:	ldr	s1, [x2, x5]
 748:	fmadd	s0, s2, s1, s0
 74c:	cmp	x1, x3
 750:	b.ls	764 <nesso::exp::DotNeon4Acc(std::span<float const, 18446744073709551615ul>, std::span<float const, 18446744073709551615ul>)+0x234>  // b.plast
 754:	add	x1, x4, #0x38
 758:	ldr	s30, [x0, x1]
 75c:	ldr	s31, [x2, x1]
 760:	fmadd	s0, s30, s31, s0
 764:	ret
 768:	movi	v0.2s, #0x0
 76c:	mov	x3, #0x0                   	// #0
