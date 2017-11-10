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
	ldr	ip, [r1, #40]
	ldr	r2, [r1, #80]
	add	r3, r3, ip, asl #5
	mov	r2, r2, asl #12
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
.L17:
	ldr	ip, [r1, #36]
	cmp	ip, #0
	moveq	r4, #512	@ movhi
	moveq	ip, r3
	streqh	r4, [r0, #8]	@ movhi
	beq	.L16
	ldr	r4, [r1, #24]
	ldr	ip, [r1, #40]
	ldrb	r5, [r1, #12]	@ zero_extendqisi2
	mov	r4, r4, asl #6
	ldrb	r6, [r1, #8]	@ zero_extendqisi2
	add	r4, r4, #16
	orr	r4, r4, ip, asl #12
	orr	r5, r5, #16384
	strh	r6, [r0, #8]	@ movhi
	strh	r5, [r0, #10]	@ movhi
	strh	r4, [r0, #12]	@ movhi
	mov	ip, r3
.L16:
	cmp	r2, ip
	add	r1, r1, #44
	add	r3, r3, #1
	add	r0, r0, #8
	bgt	.L17
.L13:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
	.size	drawEnemy, .-drawEnemy
	.comm	enemiesLeft,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
