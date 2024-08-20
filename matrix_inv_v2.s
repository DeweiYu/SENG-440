	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"matrix_inv_v2.c"
	.text
	.section	.rodata
	.align	2
.LC2:
	.ascii	"%6.3f \000"
	.text
	.align	2
	.global	printMatrix
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	printMatrix, %function
printMatrix:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L5:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L3
.L4:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vcvt.f64.f32	d7, s15
	vmov	r2, r3, d7
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	printf
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L3:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L4
	mov	r0, #10
	bl	putchar
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #3
	ble	.L5
	mov	r0, #10
	bl	putchar
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	printMatrix, .-printMatrix
	.section	.rodata
	.align	2
.LC3:
	.ascii	"Matrix is singular and cannot be inverted.\000"
	.text
	.align	2
	.global	gaussJordan
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	gaussJordan, %function
gaussJordan:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L7
.L8:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	mov	r2, #1065353216
	str	r2, [r3]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L7:
	ldr	r3, [fp, #-8]
	cmp	r3, #3
	ble	.L8
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L9
.L25:
	ldr	r3, [fp, #-12]
	strh	r3, [fp, #-14]	@ movhi
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vcvt.s32.f32	s15, s15
	vmov	r3, s15	@ int
	cmp	r3, #0
	rsblt	r3, r3, #0
	vmov	s15, r3	@ int
	vcvt.f32.s32	s15, s15
	vstr.32	s15, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	b	.L10
.L13:
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vabs.f32	s15, s15
	vldr.32	s14, [fp, #-20]
	vcmpe.f32	s14, s15
	vmrs	APSR_nzcv, FPSCR
	bpl	.L11
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vcvt.s32.f32	s15, s15
	vmov	r3, s15	@ int
	cmp	r3, #0
	rsblt	r3, r3, #0
	vmov	s15, r3	@ int
	vcvt.f32.s32	s15, s15
	vstr.32	s15, [fp, #-20]
	ldr	r3, [fp, #-24]
	strh	r3, [fp, #-14]	@ movhi
.L11:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L10:
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	ble	.L13
	ldrsh	r3, [fp, #-14]
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	beq	.L14
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L15
.L16:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	str	r3, [fp, #-44]	@ float
	ldrsh	r3, [fp, #-14]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #4
	ldr	r1, [fp, #-48]
	add	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [r3]	@ float
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	add	r3, r1, r3
	str	r2, [r3]	@ float
	ldrsh	r3, [fp, #-14]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [fp, #-44]	@ float
	str	r2, [r3]	@ float
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	str	r3, [fp, #-44]	@ float
	ldrsh	r3, [fp, #-14]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #4
	ldr	r1, [fp, #-52]
	add	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [r3]	@ float
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	add	r3, r1, r3
	str	r2, [r3]	@ float
	ldrsh	r3, [fp, #-14]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [fp, #-44]	@ float
	str	r2, [r3]	@ float
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L15:
	ldr	r3, [fp, #-28]
	cmp	r3, #3
	ble	.L16
.L14:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	str	r3, [fp, #-44]	@ float
	vldr.32	s15, [fp, #-44]
	vcmp.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bne	.L17
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	bl	puts
	mov	r0, #1
	bl	exit
.L17:
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L18
.L19:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vldr.32	s13, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r2, r2, r3
	vldr.32	s14, [fp, #-44]
	vdiv.f32	s15, s13, s14
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vstr.32	s15, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vldr.32	s13, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r2, r2, r3
	vldr.32	s14, [fp, #-44]
	vdiv.f32	s15, s13, s14
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vstr.32	s15, [r3]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L18:
	ldr	r3, [fp, #-32]
	cmp	r3, #3
	ble	.L19
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L20
.L24:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	beq	.L21
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	str	r3, [fp, #-44]	@ float
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L22
.L23:
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vldr.32	s13, [r3]
	vldr.32	s15, [fp, #-44]
	vmul.f32	s15, s13, s15
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r2, r2, r3
	vsub.f32	s15, s14, s15
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vstr.32	s15, [r3]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vldr.32	s13, [r3]
	vldr.32	s15, [fp, #-44]
	vmul.f32	s15, s13, s15
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r2, r2, r3
	vsub.f32	s15, s14, s15
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vstr.32	s15, [r3]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L22:
	ldr	r3, [fp, #-40]
	cmp	r3, #3
	ble	.L23
.L21:
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L20:
	ldr	r3, [fp, #-36]
	cmp	r3, #3
	ble	.L24
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L9:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L25
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	gaussJordan, .-gaussJordan
	.section	.rodata
	.align	2
.LC4:
	.ascii	"Original Matrix:\000"
	.align	2
.LC5:
	.ascii	"Inverse Matrix:\000"
	.align	2
.LC0:
	.word	1082130432
	.word	1088421888
	.word	1073741824
	.word	1077936128
	.word	1077936128
	.word	1086324736
	.word	1073741824
	.word	1065353216
	.word	1073741824
	.word	1082130432
	.word	1077936128
	.word	1084227584
	.word	1065353216
	.word	1073741824
	.word	1065353216
	.word	1077936128
	.align	2
.LC1:
	.word	1065353216
	.word	1082130432
	.word	1090519040
	.word	0
	.word	0
	.word	0
	.word	1091567616
	.word	0
	.word	0
	.word	-1063256064
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1065353216
	.word	1065353216
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 256
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #256
	movw	r3, #:lower16:.LC0
	movt	r3, #:upper16:.LC0
	sub	ip, fp, #68
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	sub	r3, fp, #132
	mov	r2, #64
	mov	r1, #0
	mov	r0, r3
	bl	memset
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	puts
	sub	r3, fp, #68
	mov	r0, r3
	bl	printMatrix
	sub	r2, fp, #132
	sub	r3, fp, #68
	mov	r1, r2
	mov	r0, r3
	bl	gaussJordan
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	puts
	sub	r3, fp, #132
	mov	r0, r3
	bl	printMatrix
	movw	r3, #:lower16:.LC1
	movt	r3, #:upper16:.LC1
	sub	ip, fp, #196
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	sub	r3, fp, #260
	mov	r2, #64
	mov	r1, #0
	mov	r0, r3
	bl	memset
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	puts
	sub	r3, fp, #196
	mov	r0, r3
	bl	printMatrix
	sub	r2, fp, #260
	sub	r3, fp, #196
	mov	r1, r2
	mov	r0, r3
	bl	gaussJordan
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	puts
	sub	r3, fp, #260
	mov	r0, r3
	bl	printMatrix
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
