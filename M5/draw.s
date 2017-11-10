	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"draw.c"
	.text
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #32]
	cmp	r3, #1
	beq	.L9
	cmp	r3, #0
	beq	.L10
	cmp	r3, #3
	beq	.L11
	cmp	r3, #2
	beq	.L12
.L3:
	ldr	r2, [r1, #92]
	ldr	r1, [r1, #40]
	mov	r2, r2, asl #12
	orr	r2, r2, #2048
	add	r3, r3, r1, asl #5
	orr	r3, r2, r3, asl #2
	strh	r3, [r0, #4]	@ movhi
	bx	lr
.L10:
	ldr	r2, [r1, #12]
	ldr	ip, [r1, #8]
	mov	r2, r2, asl #23
	add	ip, ip, #8
.L6:
	mvn	r2, r2, lsr #6
	and	ip, ip, #255
	mvn	r2, r2, lsr #17
	strh	ip, [r0, #0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	b	.L3
.L9:
	ldr	r2, [r1, #12]
	ldr	ip, [r1, #8]
	mov	r2, r2, asl #23
	sub	ip, ip, #8
	b	.L6
.L12:
	ldr	r2, [r1, #12]
	add	r2, r2, #8
.L7:
	mov	r2, r2, asl #23
	ldrb	ip, [r1, #8]	@ zero_extendqisi2
	mvn	r2, r2, lsr #6
	mvn	r2, r2, lsr #17
	strh	ip, [r0, #0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	b	.L3
.L11:
	ldr	r2, [r1, #12]
	sub	r2, r2, #8
	b	.L7
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawEnemy
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	stmfd	sp!, {r4, r5, r6}
	ble	.L13
	mov	r3, #1
	b	.L18
.L20:
	ldr	r6, [r1, #44]
	ldr	r4, [r1, #24]
	ldrb	r5, [r1, #12]	@ zero_extendqisi2
	mov	r6, r6, asl #12
	mov	r4, r4, asl #6
	orr	r6, r6, #2048
	add	r4, r4, #16
	orr	r5, r5, #16384
	orr	r4, r6, r4
	strh	r5, [r0, #10]	@ movhi
	strh	r4, [r0, #12]	@ movhi
.L17:
	cmp	r2, ip
	add	r1, r1, #56
	add	r3, r3, #1
	add	r0, r0, #8
	ble	.L13
.L18:
	ldr	ip, [r1, #40]
	cmp	ip, #0
	moveq	r4, #512	@ movhi
	moveq	ip, r3
	streqh	r4, [r0, #8]	@ movhi
	beq	.L17
	ldr	ip, [r1, #48]
	ldrb	r4, [r1, #8]	@ zero_extendqisi2
	cmp	ip, #0
	strh	r4, [r0, #8]	@ movhi
	mov	ip, r3
	beq	.L20
	ldr	r6, [r1, #44]
	ldr	r4, [r1, #24]
	ldrb	r5, [r1, #12]	@ zero_extendqisi2
	mov	r6, r6, asl #12
	mov	r4, r4, asl #7
	mvn	r5, r5, asl #17
	orr	r6, r6, #2048
	add	r4, r4, #18
	mvn	r5, r5, lsr #17
	orr	r4, r6, r4
	cmp	r2, ip
	strh	r5, [r0, #10]	@ movhi
	strh	r4, [r0, #12]	@ movhi
	add	r1, r1, #56
	add	r3, r3, #1
	add	r0, r0, #8
	bgt	.L18
.L13:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	drawLife
	.type	drawLife, %function
drawLife:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	mov	r3, #12608
	add	ip, r1, #80
	add	r3, r3, #16
.L24:
	ldr	r2, [r1, #16]
	cmp	r2, #0
	ldrneb	r2, [r1, #4]	@ zero_extendqisi2
	ldrneb	r4, [r1, #0]	@ zero_extendqisi2
	orrne	r2, r2, #16384
	moveq	r2, #512	@ movhi
	add	r1, r1, #20
	strneh	r4, [r0, #32]	@ movhi
	strneh	r2, [r0, #34]	@ movhi
	strneh	r3, [r0, #36]	@ movhi
	streqh	r2, [r0, #32]	@ movhi
	cmp	r1, ip
	add	r0, r0, #8
	bne	.L24
	ldmfd	sp!, {r4}
	bx	lr
	.size	drawLife, .-drawLife
	.comm	enemiesLeft,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	currRoom,4,4
	.comm	currCollisionMap,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
