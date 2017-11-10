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
	str	r4, [sp, #-4]!
	ldr	r3, [r1, #52]
	ldr	r2, [r1, #32]
	ldr	r4, [r1, #12]
	ldr	ip, [r1, #24]
	add	r3, r3, r3, asl #1
	add	r3, r3, r2
	mov	r4, r4, asl #23
	ldrb	r2, [r1, #8]	@ zero_extendqisi2
	add	r3, ip, r3, asl #5
	mov	r1, r4, lsr #23
	orr	r1, r1, #16384
	mov	r3, r3, asl #1
	strh	r2, [r0, #0]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
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
	ble	.L2
	mov	r3, #1
.L6:
	ldr	ip, [r1, #36]
	cmp	ip, #0
	moveq	r4, #512	@ movhi
	moveq	ip, r3
	streqh	r4, [r0, #8]	@ movhi
	beq	.L5
	ldr	r4, [r1, #40]
	ldrb	r5, [r1, #12]	@ zero_extendqisi2
	ldrb	r6, [r1, #8]	@ zero_extendqisi2
	add	r4, r4, #4
	orr	r5, r5, #16384
	mov	r4, r4, asl #1
	strh	r6, [r0, #8]	@ movhi
	strh	r5, [r0, #10]	@ movhi
	strh	r4, [r0, #12]	@ movhi
	mov	ip, r3
.L5:
	cmp	r2, ip
	add	r1, r1, #44
	add	r3, r3, #1
	add	r0, r0, #8
	bgt	.L6
.L2:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
	.size	drawEnemy, .-drawEnemy
	.comm	enemiesLeft,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
