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
	.file	"improvised_v2.c"
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	mov	r5, #0
	b	.L2
.L5:
	mov	r4, #0
	b	.L3
.L4:
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3, r4, lsl #2]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L6
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vmov	r2, r3, d7
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	printf
	add	r4, r4, #1
.L3:
	cmp	r4, #3
	ble	.L4
	mov	r0, #10
	bl	putchar
	add	r5, r5, #1
.L2:
	cmp	r5, #3
	ble	.L5
	mov	r0, #10
	bl	putchar
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
.L7:
	.align	2
.L6:
	.word	1132462080
	.size	printMatrix, .-printMatrix
	.section	.rodata
	.align	2
.LC3:
	.ascii	"Matrix is singular and cannot be inverted.\000"
	.global	__aeabi_idiv
	.text
	.align	2
	.global	gaussJordan
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	gaussJordan, %function
gaussJordan:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #36
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	mov	r4, #0
	b	.L9
.L10:
	mov	r3, r4
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	mov	r2, #256
	str	r2, [r3, r4, lsl #2]
	add	r4, r4, #1
.L9:
	cmp	r4, #3
	ble	.L10
	mov	r5, #0
	b	.L11
.L26:
	mov	r6, r5
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r3, [r3, r5, lsl #2]
	cmp	r3, #0
	rsblt	r3, r3, #0
	str	r3, [fp, #-24]
	add	r4, r5, #1
	b	.L12
.L14:
	mov	r3, r4
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r3, [r3, r5, lsl #2]
	cmp	r3, #0
	rsblt	r3, r3, #0
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	ble	.L13
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-24]
	mov	r6, r4
.L13:
	add	r4, r4, #1
.L12:
	cmp	r4, #3
	ble	.L14
	cmp	r6, r5
	beq	.L15
	mov	r4, #0
	b	.L16
.L17:
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r3, [r3, r4, lsl #2]
	str	r3, [fp, #-32]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r2, r2, r3
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r1, [fp, #-48]
	add	r3, r1, r3
	ldr	r2, [r2, r4, lsl #2]
	str	r2, [r3, r4, lsl #2]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r2, [fp, #-32]
	str	r2, [r3, r4, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r3, [r3, r4, lsl #2]
	str	r3, [fp, #-32]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r2, r2, r3
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r1, [fp, #-52]
	add	r3, r1, r3
	ldr	r2, [r2, r4, lsl #2]
	str	r2, [r3, r4, lsl #2]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r2, [fp, #-32]
	str	r2, [r3, r4, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #1
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-32]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r1, r2, r3
	add	r0, r4, #1
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #1
	ldr	r1, [r1, r0, lsl #2]
	str	r1, [r3, r2, lsl #2]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #1
	ldr	r1, [fp, #-32]
	str	r1, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #1
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-32]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r1, r2, r3
	add	r0, r4, #1
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #1
	ldr	r1, [r1, r0, lsl #2]
	str	r1, [r3, r2, lsl #2]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #1
	ldr	r1, [fp, #-32]
	str	r1, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #2
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-32]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r1, r2, r3
	add	r0, r4, #2
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #2
	ldr	r1, [r1, r0, lsl #2]
	str	r1, [r3, r2, lsl #2]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #2
	ldr	r1, [fp, #-32]
	str	r1, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #2
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-32]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r1, r2, r3
	add	r0, r4, #2
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #2
	ldr	r1, [r1, r0, lsl #2]
	str	r1, [r3, r2, lsl #2]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #2
	ldr	r1, [fp, #-32]
	str	r1, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #3
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-32]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r1, r2, r3
	add	r0, r4, #3
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #3
	ldr	r1, [r1, r0, lsl #2]
	str	r1, [r3, r2, lsl #2]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #3
	ldr	r1, [fp, #-32]
	str	r1, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #3
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-32]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r1, r2, r3
	add	r0, r4, #3
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #3
	ldr	r1, [r1, r0, lsl #2]
	str	r1, [r3, r2, lsl #2]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #3
	ldr	r1, [fp, #-32]
	str	r1, [r3, r2, lsl #2]
	add	r4, r4, #4
.L16:
	cmp	r4, #3
	ble	.L17
.L15:
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r3, [r3, r5, lsl #2]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L18
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	bl	puts
	mov	r0, #1
	bl	exit
.L18:
	ldr	r1, [fp, #-32]
	mov	r0, #65536
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-36]
	mov	r4, #0
	b	.L19
.L20:
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r3, [r3, r4, lsl #2]
	ldr	r2, [fp, #-36]
	mul	r2, r2, r3
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r1, [fp, #-48]
	add	r3, r1, r3
	asr	r2, r2, #8
	str	r2, [r3, r4, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r3, [r3, r4, lsl #2]
	ldr	r2, [fp, #-36]
	mul	r2, r2, r3
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r1, [fp, #-52]
	add	r3, r1, r3
	asr	r2, r2, #8
	str	r2, [r3, r4, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #1
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-36]
	mul	r1, r2, r3
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #1
	asr	r1, r1, #8
	str	r1, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #1
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-36]
	mul	r1, r2, r3
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #1
	asr	r1, r1, #8
	str	r1, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #2
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-36]
	mul	r1, r2, r3
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #2
	asr	r1, r1, #8
	str	r1, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #2
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-36]
	mul	r1, r2, r3
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #2
	asr	r1, r1, #8
	str	r1, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #3
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-36]
	mul	r1, r2, r3
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #3
	asr	r1, r1, #8
	str	r1, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #3
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-36]
	mul	r1, r2, r3
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #3
	asr	r1, r1, #8
	str	r1, [r3, r2, lsl #2]
	add	r4, r4, #4
.L19:
	cmp	r4, #3
	ble	.L20
	mov	r6, #0
	b	.L21
.L25:
	cmp	r6, r5
	beq	.L22
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r3, [r3, r5, lsl #2]
	str	r3, [fp, #-40]
	mov	r4, #0
	b	.L23
.L24:
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r1, [r3, r4, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r3, [r3, r4, lsl #2]
	ldr	r2, [fp, #-40]
	mul	r3, r2, r3
	asr	r2, r3, #8
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r0, [fp, #-48]
	add	r3, r0, r3
	sub	r2, r1, r2
	str	r2, [r3, r4, lsl #2]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r1, [r3, r4, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r3, [r3, r4, lsl #2]
	ldr	r2, [fp, #-40]
	mul	r3, r2, r3
	asr	r2, r3, #8
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r0, [fp, #-52]
	add	r3, r0, r3
	sub	r2, r1, r2
	str	r2, [r3, r4, lsl #2]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #1
	ldr	r0, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #1
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-40]
	mul	r3, r2, r3
	asr	r1, r3, #8
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #1
	sub	r1, r0, r1
	str	r1, [r3, r2, lsl #2]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #1
	ldr	r0, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #1
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-40]
	mul	r3, r2, r3
	asr	r1, r3, #8
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #1
	sub	r1, r0, r1
	str	r1, [r3, r2, lsl #2]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #2
	ldr	r0, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #2
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-40]
	mul	r3, r2, r3
	asr	r1, r3, #8
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #2
	sub	r1, r0, r1
	str	r1, [r3, r2, lsl #2]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #2
	ldr	r0, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #2
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-40]
	mul	r3, r2, r3
	asr	r1, r3, #8
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #2
	sub	r1, r0, r1
	str	r1, [r3, r2, lsl #2]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #3
	ldr	r0, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #3
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-40]
	mul	r3, r2, r3
	asr	r1, r3, #8
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	add	r2, r4, #3
	sub	r1, r0, r1
	str	r1, [r3, r2, lsl #2]
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #3
	ldr	r0, [r3, r2, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #3
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-40]
	mul	r3, r2, r3
	asr	r1, r3, #8
	mov	r3, r6
	lsl	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	add	r2, r4, #3
	sub	r1, r0, r1
	str	r1, [r3, r2, lsl #2]
	add	r4, r4, #4
.L23:
	cmp	r4, #3
	ble	.L24
.L22:
	add	r6, r6, #1
.L21:
	cmp	r6, #3
	ble	.L25
	add	r5, r5, #1
.L11:
	cmp	r5, #3
	ble	.L26
	nop
	sub	sp, fp, #16
	@ sp needed
	pop	{r4, r5, r6, fp, pc}
	.size	gaussJordan, .-gaussJordan
	.section	.rodata
	.align	2
.LC4:
	.ascii	"Original Matrix 1:\000"
	.align	2
.LC5:
	.ascii	"Inverse Matrix 1:\000"
	.align	2
.LC6:
	.ascii	"Original Matrix 2:\000"
	.align	2
.LC7:
	.ascii	"Inverse Matrix 2:\000"
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
	@ args = 0, pretend = 0, frame = 400
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #400
	movw	r3, #:lower16:.LC0
	movt	r3, #:upper16:.LC0
	sub	ip, fp, #84
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	movw	r3, #:lower16:.LC1
	movt	r3, #:upper16:.LC1
	sub	ip, fp, #148
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	sub	r3, fp, #340
	mov	r2, #64
	mov	r1, #0
	mov	r0, r3
	bl	memset
	sub	r3, fp, #404
	mov	r2, #64
	mov	r1, #0
	mov	r0, r3
	bl	memset
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L28
.L31:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L29
.L30:
	ldr	r3, [fp, #-8]
	lsl	r2, r3, #2
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	sub	r3, r3, #80
	vldr.32	s15, [r3]
	vldr.32	s14, .L37
	vmul.f32	s15, s15, s14
	vcvt.s32.f32	s15, s15
	vmov	r1, s15	@ int
	ldr	r3, [fp, #-8]
	lsl	r2, r3, #2
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	str	r1, [r3, #-208]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L29:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L30
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L28:
	ldr	r3, [fp, #-8]
	cmp	r3, #3
	ble	.L31
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L32
.L35:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L33
.L34:
	ldr	r3, [fp, #-16]
	lsl	r2, r3, #2
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	sub	r3, r3, #144
	vldr.32	s15, [r3]
	vldr.32	s14, .L37
	vmul.f32	s15, s15, s14
	vcvt.s32.f32	s15, s15
	vmov	r1, s15	@ int
	ldr	r3, [fp, #-16]
	lsl	r2, r3, #2
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	str	r1, [r3, #-272]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L33:
	ldr	r3, [fp, #-20]
	cmp	r3, #3
	ble	.L34
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L32:
	ldr	r3, [fp, #-16]
	cmp	r3, #3
	ble	.L35
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	puts
	sub	r3, fp, #212
	mov	r0, r3
	bl	printMatrix
	sub	r2, fp, #340
	sub	r3, fp, #212
	mov	r1, r2
	mov	r0, r3
	bl	gaussJordan
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	puts
	sub	r3, fp, #340
	mov	r0, r3
	bl	printMatrix
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	bl	puts
	sub	r3, fp, #276
	mov	r0, r3
	bl	printMatrix
	sub	r2, fp, #404
	sub	r3, fp, #276
	mov	r1, r2
	mov	r0, r3
	bl	gaussJordan
	movw	r0, #:lower16:.LC7
	movt	r0, #:upper16:.LC7
	bl	puts
	sub	r3, fp, #404
	mov	r0, r3
	bl	printMatrix
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L38:
	.align	2
.L37:
	.word	1132462080
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
