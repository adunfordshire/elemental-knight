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
	.file	"update.c"
	.text
	.align	2
	.global	updateSplash
	.type	updateSplash, %function
updateSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r4, .L11
	ldr	r3, [r4, #0]
	cmp	r3, #0
	bne	.L2
	ldr	r0, .L11+4
	ldr	r3, .L11+8
	mov	lr, pc
	bx	r3
	mov	r3, #-2147483648
	ldr	r5, .L11+12
	mov	r0, #3
	ldr	r1, .L11+16
	mov	r2, #100663296
	add	r3, r3, #4608
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r3, #-2147483648
	add	r3, r3, #1024
	mov	r0, #3
	ldr	r1, .L11+20
	add	r2, r2, #61440
	mov	lr, pc
	bx	r5
	ldr	r5, .L11+24
	ldr	r3, [r5, #0]
	tst	r3, #1
	beq	.L3
	ldr	r2, .L11+28
	ldr	r2, [r2, #0]
	tst	r2, #1
	bne	.L3
.L4:
	ldr	r3, .L11+32
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #0]
.L5:
	tst	r3, #64
	beq	.L8
	ldr	r2, .L11+28
	ldr	r2, [r2, #0]
	ands	r2, r2, #64
	streq	r2, [r4, #0]
.L8:
	tst	r3, #128
	beq	.L1
	ldr	r3, .L11+28
	ldr	r3, [r3, #0]
	tst	r3, #128
	moveq	r3, #1
	streq	r3, [r4, #0]
.L1:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L2:
	ldr	r0, .L11+36
	ldr	r3, .L11+8
	mov	lr, pc
	bx	r3
	mov	r3, #4544
	ldr	r5, .L11+12
	mov	r0, #3
	ldr	r1, .L11+40
	mov	r2, #100663296
	add	r3, r3, #-2147483600
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r3, #-2147483648
	add	r3, r3, #1024
	mov	r0, #3
	ldr	r1, .L11+44
	add	r2, r2, #61440
	mov	lr, pc
	bx	r5
	ldr	r5, .L11+24
	ldr	r3, [r5, #0]
	tst	r3, #1
	beq	.L6
	ldr	r2, .L11+28
	ldr	r2, [r2, #0]
	tst	r2, #1
	bne	.L6
.L7:
	ldr	r3, .L11+48
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #0]
	b	.L5
.L6:
	tst	r3, #8
	beq	.L5
	ldr	r2, .L11+28
	ldr	r2, [r2, #0]
	tst	r2, #8
	bne	.L5
	b	.L7
.L3:
	tst	r3, #8
	beq	.L5
	ldr	r2, .L11+28
	ldr	r2, [r2, #0]
	tst	r2, #8
	bne	.L5
	b	.L4
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	.word	splash2BGPal
	.word	loadPalette
	.word	DMANow
	.word	splash2BGTiles
	.word	splash2BGMap
	.word	oldButtons
	.word	buttons
	.word	goToGame
	.word	splash3BGPal
	.word	splash3BGTiles
	.word	splash3BGMap
	.word	goToInstr
	.size	updateSplash, .-updateSplash
	.align	2
	.global	updateInstr
	.type	updateInstr, %function
updateInstr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L18
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L14
	ldr	r2, .L18+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L16
.L14:
	tst	r3, #2
	beq	.L13
	ldr	r3, .L18+4
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L17
.L13:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L17:
	ldr	r3, .L18+8
	mov	lr, pc
	bx	r3
	b	.L13
.L16:
	ldr	r3, .L18+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L14
.L19:
	.align	2
.L18:
	.word	oldButtons
	.word	buttons
	.word	goToSplash
	.word	goToGame
	.size	updateInstr, .-updateInstr
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L23
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L21
	ldr	r3, .L23+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L22
.L21:
	ldr	r3, .L23+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+16
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L22:
	ldr	r3, .L23+20
	mov	lr, pc
	bx	r3
	b	.L21
.L24:
	.align	2
.L23:
	.word	oldButtons
	.word	buttons
	.word	update
	.word	draw
	.word	waitForVblank
	.word	goToPause
	.size	updateGame, .-updateGame
	.align	2
	.global	playerWalk
	.type	playerWalk, %function
playerWalk:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #44]
	ldr	r2, .L32
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #2
	add	r2, r2, r2, asl #2
	subs	r2, r3, r2, asl #1
	addne	r3, r3, #1
	bne	.L27
	ldr	r3, [r0, #40]
	cmp	r3, #0
	str	r2, [r0, #44]
	bne	.L31
	ldr	r3, [r0, #48]
	cmp	r3, #1
	moveq	r2, #2
	streq	r2, [r0, #40]
	beq	.L27
	cmn	r3, #1
	moveq	r3, #1
	streq	r3, [r0, #40]
	movne	r3, #1
.L27:
	str	r3, [r0, #44]
	bx	lr
.L31:
	ldr	r3, [r0, #48]
	rsb	r3, r3, #0
	str	r3, [r0, #48]
	mov	r3, #1
	str	r2, [r0, #40]
	str	r3, [r0, #44]
	bx	lr
.L33:
	.align	2
.L32:
	.word	1717986919
	.size	playerWalk, .-playerWalk
	.align	2
	.global	playerAnimate
	.type	playerAnimate, %function
playerAnimate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #52]
	cmp	r2, #0
	mov	r3, r0
	ble	.L35
	cmp	r2, #15
	movgt	r2, #3
	movle	r2, #4
	strgt	r2, [r0, #40]
	strle	r2, [r0, #40]
	bx	lr
.L35:
	ldr	r2, [r0, #56]
	cmp	r2, #0
	bne	.L41
	ldr	r1, [r0, #88]
	cmp	r1, #0
	strle	r2, [r0, #40]
	bxle	lr
	ldr	r2, .L42
	smull	r0, r2, r1, r2
	mov	r0, r1, asr #31
	rsb	r2, r0, r2, asr #1
	add	r2, r2, r2, asl #2
	cmp	r1, r2
	moveq	r2, #5
	movne	r2, #6
	streq	r2, [r3, #40]
	strne	r2, [r3, #40]
	bx	lr
.L41:
	b	playerWalk
.L43:
	.align	2
.L42:
	.word	1717986919
	.size	playerAnimate, .-playerAnimate
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #1
	mov	r4, r0
	beq	.L72
	cmp	r3, #0
	bne	.L47
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	add	r2, r2, #16
.L70:
	sub	r3, r3, #8
	str	r3, [r4, #68]
	mov	r3, #16
	str	r3, [r4, #76]
	mov	r3, #32
	str	r2, [r4, #64]
	str	r3, [r4, #72]
.L46:
	ldr	r5, .L77
	ldr	r2, [r5, #0]
	tst	r2, #1
	beq	.L49
	ldr	r3, .L77+4
	ldr	r3, [r3, #0]
	ands	r3, r3, #1
	bne	.L49
	mov	r1, #12352
	mov	r2, #11008
	add	r2, r2, #17
	ldr	r0, .L77+8
	add	r1, r1, #29
	ldr	ip, .L77+12
	mov	lr, pc
	bx	ip
	mov	r3, #20
	str	r3, [r4, #52]
	mov	r3, #1
	str	r3, [r4, #60]
	ldr	r2, [r5, #0]
.L49:
	tst	r2, #256
	beq	.L50
	ldr	r3, .L77+4
	ldr	r3, [r3, #0]
	ands	r3, r3, #256
	bne	.L50
	ldr	r1, [r4, #92]
	cmp	r1, #2
	addne	r1, r1, #1
	streq	r3, [r4, #92]
	strne	r1, [r4, #92]
.L50:
	tst	r2, #512
	beq	.L52
	ldr	r3, .L77+4
	ldr	r3, [r3, #0]
	tst	r3, #512
	bne	.L52
	ldr	r3, [r4, #92]
	cmp	r3, #0
	moveq	r3, #2
	subne	r3, r3, #1
	streq	r3, [r4, #92]
	strne	r3, [r4, #92]
.L52:
	tst	r2, #4
	beq	.L54
	ldr	r3, .L77+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	moveq	r3, #3
	streq	r3, [r4, #92]
.L54:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L55
	ldr	r3, [r4, #16]
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r4, #32]
	ble	.L56
	sub	r3, r3, #1
	ldr	r0, [r4, #20]
	ldr	r2, .L77+16
	mov	r1, r3, asl #8
	ldr	r2, [r2, #0]
	add	ip, r1, r0
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	bne	.L73
.L56:
	mov	r3, #1
	str	r3, [r4, #56]
.L55:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L58
	ldr	r2, [r4, #24]
	ldr	r3, [r4, #16]
	rsb	r1, r2, #256
	cmp	r3, r1
	mov	r1, #0
	str	r1, [r4, #32]
	bge	.L59
	ldr	r1, [r4, #28]
	ldr	ip, [r4, #20]
	add	lr, r3, r1
	ldr	r0, .L77+16
	add	lr, lr, #1
	ldr	r0, [r0, #0]
	add	lr, ip, lr, asl #8
	mov	lr, lr, asl #1
	ldrh	lr, [r0, lr]
	cmp	lr, #0
	bne	.L74
.L59:
	mov	r3, #1
	str	r3, [r4, #56]
.L58:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L61
	ldr	r3, [r4, #20]
	mov	r2, #3
	cmp	r3, #0
	str	r2, [r4, #32]
	ble	.L62
	ldr	r1, [r4, #16]
	ldr	r2, .L77+16
	sub	r3, r3, #1
	ldr	r2, [r2, #0]
	add	r0, r3, r1, asl #8
	mov	r0, r0, asl #1
	ldrh	r0, [r2, r0]
	cmp	r0, #0
	bne	.L75
.L62:
	mov	r3, #1
	str	r3, [r4, #56]
.L61:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L64
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #20]
	rsb	r1, r3, #256
	cmp	r2, r1
	mov	r1, #2
	str	r1, [r4, #32]
	bge	.L65
	ldr	ip, [r4, #16]
	ldr	r1, .L77+16
	add	r0, r3, r2
	ldr	r1, [r1, #0]
	add	lr, r0, ip, asl #8
	mov	lr, lr, asl #1
	ldrh	lr, [r1, lr]
	cmp	lr, #0
	beq	.L65
	ldr	lr, [r4, #24]
	add	r5, ip, lr
	sub	r5, r5, #1
	add	r5, r0, r5, asl #8
	mov	r5, r5, asl #1
	ldrh	r5, [r1, r5]
	cmp	r5, #0
	beq	.L65
	sub	ip, ip, #1
	add	lr, lr, lr, lsr #31
	add	ip, ip, lr, asr #1
	add	r0, r0, ip, asl #8
	mov	r0, r0, asl #1
	ldrh	r1, [r1, r0]
	cmp	r1, #0
	beq	.L65
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	ldr	r1, [r4, #12]
	rsb	r3, r3, #120
	cmp	r1, r3
	ble	.L66
	ldr	r3, .L77+20
	ldr	r1, [r3, #0]
	cmp	r1, #15
	addle	r1, r1, #1
	strle	r1, [r3, #0]
.L66:
	ldr	r3, [r4, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	str	r3, [r4, #4]
	str	r2, [r4, #20]
.L65:
	mov	r3, #1
	str	r3, [r4, #56]
.L64:
	mov	r0, r4
	bl	playerAnimate
	ldr	r3, [r4, #52]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #52]
	ldr	r3, [r4, #88]
	cmp	r3, #0
	subgt	r3, r3, #1
	movle	r3, #0
	strgt	r3, [r4, #88]
	strle	r3, [r4, #84]
	mov	r3, #0
	str	r3, [r4, #56]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L47:
	cmp	r3, #3
	beq	.L76
	cmp	r3, #2
	bne	.L46
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	sub	r2, r2, #8
	add	r3, r3, #16
.L71:
	str	r3, [r4, #68]
	mov	r3, #32
	str	r3, [r4, #76]
	mov	r3, #16
	str	r2, [r4, #64]
	str	r3, [r4, #72]
	b	.L46
.L72:
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	sub	r2, r2, #16
	b	.L70
.L75:
	ldr	r0, [r4, #24]
	add	ip, r1, r0
	sub	ip, ip, #1
	add	ip, r3, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	beq	.L62
	sub	r1, r1, #1
	add	r0, r0, r0, lsr #31
	add	r1, r1, r0, asr #1
	add	r1, r3, r1, asl #8
	mov	r1, r1, asl #1
	ldrh	r2, [r2, r1]
	cmp	r2, #0
	beq	.L62
	ldr	r2, [r4, #28]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldr	r1, [r4, #12]
	rsb	r2, r2, #119
	cmp	r2, r1
	blt	.L63
	ldr	r2, .L77+20
	ldr	r1, [r2, #0]
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r2, #0]
.L63:
	ldr	r2, [r4, #4]
	sub	r2, r2, #1
	str	r2, [r4, #4]
	str	r3, [r4, #20]
	b	.L62
.L73:
	ldr	ip, [r4, #28]
	add	lr, r0, ip
	sub	lr, lr, #1
	add	lr, lr, r1
	mov	lr, lr, asl #1
	ldrh	lr, [r2, lr]
	cmp	lr, #0
	beq	.L56
	sub	r0, r0, #1
	add	ip, ip, ip, lsr #31
	add	r0, r0, ip, asr #1
	add	r1, r0, r1
	mov	r1, r1, asl #1
	ldrh	r2, [r2, r1]
	cmp	r2, #0
	beq	.L56
	ldr	r2, [r4, #24]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldr	r1, [r4, #8]
	rsb	r2, r2, #79
	cmp	r2, r1
	blt	.L57
	ldr	r2, .L77+24
	ldr	r1, [r2, #0]
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r2, #0]
.L57:
	ldr	r2, [r4, #0]
	sub	r2, r2, #1
	str	r2, [r4, #0]
	str	r3, [r4, #16]
	b	.L56
.L74:
	add	lr, r2, r3
	add	r5, r1, ip
	mov	lr, lr, asl #8
	sub	r5, r5, #1
	add	r5, r5, lr
	mov	r5, r5, asl #1
	ldrh	r5, [r0, r5]
	cmp	r5, #0
	beq	.L59
	sub	ip, ip, #1
	add	r1, r1, r1, lsr #31
	add	r1, ip, r1, asr #1
	add	lr, r1, lr
	mov	lr, lr, asl #1
	ldrh	r1, [r0, lr]
	cmp	r1, #0
	beq	.L59
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldr	r1, [r4, #8]
	rsb	r2, r2, #80
	cmp	r1, r2
	ble	.L60
	ldr	r2, .L77+24
	ldr	r1, [r2, #0]
	cmp	r1, #95
	addle	r1, r1, #1
	strle	r1, [r2, #0]
.L60:
	ldr	r2, [r4, #0]
	add	r3, r3, #1
	add	r2, r2, #1
	str	r2, [r4, #0]
	str	r3, [r4, #16]
	b	.L59
.L76:
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	sub	r2, r2, #8
	sub	r3, r3, #16
	b	.L71
.L78:
	.align	2
.L77:
	.word	oldButtons
	.word	buttons
	.word	attackZap
	.word	playSoundB
	.word	currCollisionMap
	.word	hOff
	.word	vOff
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	attackCheck
	.type	attackCheck, %function
attackCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #20]
	ldr	r2, [r0, #68]
	add	ip, r3, ip
	cmp	r2, ip
	bxgt	lr
	ldr	ip, [r0, #72]
	add	r2, r2, ip
	cmp	r3, r2
	bxgt	lr
	ldr	r3, [r0, #64]
	ldr	ip, [r0, #76]
	ldr	r2, [r1, #0]
	add	ip, r3, ip
	cmp	ip, r2
	bxlt	lr
	ldr	ip, [r1, #16]
	add	r2, r2, ip
	cmp	r3, r2
	bxgt	lr
	ldr	r3, [r1, #40]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #92]
	cmp	r3, #1
	beq	.L88
	cmp	r3, #0
	bne	.L82
	ldr	r3, [r1, #44]
	cmp	r3, #0
	bxne	lr
	ldr	r2, [r1, #36]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r1, #36]
	mov	r2, #10
	str	r2, [r1, #52]
	bxgt	lr
.L85:
	str	r3, [r1, #40]
	bx	lr
.L82:
	cmp	r3, #2
	bne	.L83
	ldr	r3, [r1, #44]
	cmp	r3, #2
	bxne	lr
.L87:
	ldr	r3, [r1, #36]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r1, #36]
	mov	r3, #10
	str	r3, [r1, #52]
	bxgt	lr
	mov	r3, #0
	b	.L85
.L88:
	ldr	r3, [r1, #44]
	cmp	r3, #1
	bxne	lr
	ldr	r3, [r1, #36]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r1, #36]
	mov	r3, #10
	str	r3, [r1, #52]
	movle	r3, #0
	strle	r3, [r1, #40]
	bx	lr
.L83:
	cmp	r3, #3
	beq	.L87
	bx	lr
	.size	attackCheck, .-attackCheck
	.align	2
	.global	updateEnemy
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #52]
	cmp	r3, #0
	ble	.L90
	sub	r3, r3, #1
	mov	r2, #4
	str	r2, [r0, #24]
	str	r3, [r0, #52]
	bx	lr
.L90:
	ldr	r3, [r0, #28]
	ldr	r2, .L96
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #3
	rsb	r2, r2, r2, asl #4
	subs	r2, r3, r2
	addne	r3, r3, #1
	beq	.L95
	str	r3, [r0, #28]
	bx	lr
.L95:
	ldr	r3, [r0, #24]
	cmp	r3, #2
	addle	r3, r3, #1
	movgt	r3, #1
	strle	r3, [r0, #24]
	movle	r3, #1
	str	r2, [r0, #28]
	strgt	r2, [r0, #24]
	str	r3, [r0, #28]
	bx	lr
.L97:
	.align	2
.L96:
	.word	-2004318071
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	moveBoss
	.type	moveBoss, %function
moveBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L117
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bne	.L99
	ldr	r1, [r0, #4]
	ldr	ip, [r0, #20]
	add	ip, r1, ip
	cmp	ip, #221
	addle	r1, r1, #1
	strle	r1, [r0, #4]
	bxle	lr
	ldr	r1, [r0, #44]
	cmp	r1, #2
	mov	ip, #1
	addne	r1, r1, #1
	str	ip, [r3, #4]
	strne	r1, [r0, #44]
	streq	r2, [r0, #44]
	bx	lr
.L99:
	ldr	r2, [r3, #4]
	cmp	r2, #1
	beq	.L114
	ldr	r2, [r3, #4]
	cmp	r2, #2
	beq	.L115
	ldr	r2, [r3, #4]
	cmp	r2, #3
	bxne	lr
	ldr	r2, [r0, #0]
	cmp	r2, #24
	subgt	r2, r2, #1
	strgt	r2, [r0, #0]
	bxgt	lr
	ldr	r2, [r0, #44]
	mov	r1, #0
	cmp	r2, #2
	str	r1, [r3, #4]
	streq	r1, [r0, #44]
	bxeq	lr
.L110:
	add	r2, r2, #1
.L116:
	str	r2, [r0, #44]
	bx	lr
.L114:
	ldr	r2, [r0, #0]
	ldr	r1, [r0, #16]
	add	r1, r2, r1
	cmp	r1, #139
	addle	r2, r2, #1
	strle	r2, [r0, #0]
	bxle	lr
	ldr	r2, [r0, #44]
	mov	r1, #2
	cmp	r2, #2
	str	r1, [r3, #4]
	bne	.L110
.L112:
	mov	r3, #0
	str	r3, [r0, #44]
	bx	lr
.L115:
	ldr	r2, [r0, #4]
	cmp	r2, #16
	subgt	r2, r2, #1
	strgt	r2, [r0, #4]
	bxgt	lr
	ldr	r2, [r0, #44]
	mov	r1, #3
	cmp	r2, #2
	str	r1, [r3, #4]
	beq	.L112
	add	r2, r2, #1
	b	.L116
.L118:
	.align	2
.L117:
	.word	.LANCHOR0
	.size	moveBoss, .-moveBoss
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L123
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L120
	ldr	r2, .L123+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L122
.L120:
	tst	r3, #1
	beq	.L119
	ldr	r3, .L123+4
	ldr	r3, [r3, #0]
	tst	r3, #1
	ldreq	r3, .L123+8
	moveq	lr, pc
	bxeq	r3
.L119:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L122:
	ldr	r3, .L123+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L120
.L124:
	.align	2
.L123:
	.word	oldButtons
	.word	buttons
	.word	goToSplash
	.word	goToGame
	.size	updatePause, .-updatePause
	.align	2
	.global	updateDeath
	.type	updateDeath, %function
updateDeath:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L128
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L125
	ldr	r3, .L128+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L127
.L125:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L127:
	ldr	r3, .L128+8
	mov	lr, pc
	bx	r3
	b	.L125
.L129:
	.align	2
.L128:
	.word	oldButtons
	.word	buttons
	.word	goToSplash
	.size	updateDeath, .-updateDeath
	.align	2
	.global	updateWin
	.type	updateWin, %function
updateWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L133
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L130
	ldr	r3, .L133+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L132
.L130:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L132:
	ldr	r3, .L133+8
	mov	lr, pc
	bx	r3
	b	.L130
.L134:
	.align	2
.L133:
	.word	oldButtons
	.word	buttons
	.word	goToSplash
	.size	updateWin, .-updateWin
	.align	2
	.global	updateRoom0
	.type	updateRoom0, %function
updateRoom0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, [r0, #16]
	cmp	r3, #4
	bgt	.L135
	ldr	r3, [r0, #20]
	cmp	r3, #103
	ble	.L135
	ldr	r2, [r0, #28]
	add	r3, r3, r2
	cmp	r3, #137
	ble	.L137
.L135:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L137:
	mov	r3, #0
	str	r3, [r0, #96]
	mov	r0, #1
	ldr	r3, .L138
	mov	lr, pc
	bx	r3
	b	.L135
.L139:
	.align	2
.L138:
	.word	goToRoom
	.size	updateRoom0, .-updateRoom0
	.align	2
	.global	updateRoom1
	.type	updateRoom1, %function
updateRoom1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #24]
	add	r2, r3, r2
	cmp	r2, #149
	mov	r4, r0
	ble	.L141
	ldr	r2, [r0, #20]
	cmp	r2, #103
	bgt	.L146
.L141:
	cmp	r3, #63
	ble	.L142
	ldr	r2, [r4, #24]
	add	r1, r3, r2
	cmp	r1, #95
	bgt	.L143
	ldr	r1, [r4, #20]
	cmp	r1, #3
	ble	.L147
.L143:
	add	r3, r3, r2
	cmp	r3, #95
	bgt	.L140
.L149:
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #20]
	add	r3, r2, r3
	cmp	r3, #237
	bgt	.L148
.L140:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L147:
	mov	r3, #3
	str	r3, [r4, #96]
	mov	r0, #2
	ldr	r3, .L150
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #16]
.L142:
	cmp	r3, #4
	bgt	.L144
	ldr	r3, [r4, #20]
	cmp	r3, #103
	ble	.L140
	ldr	r2, [r4, #28]
	add	r3, r3, r2
	cmp	r3, #137
	bgt	.L140
	mov	r3, #0
	str	r3, [r4, #96]
	mov	r0, #3
	ldr	r3, .L150
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #16]
.L144:
	cmp	r3, #63
	ble	.L140
	ldr	r2, [r4, #24]
	add	r3, r3, r2
	cmp	r3, #95
	ble	.L149
	b	.L140
.L146:
	ldr	r1, [r0, #28]
	add	r2, r2, r1
	cmp	r2, #138
	bgt	.L141
	mov	r3, #1
	str	r3, [r0, #96]
	ldr	r3, .L150
	mov	r0, #0
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #16]
	b	.L141
.L148:
	mov	r3, #2
	str	r3, [r4, #96]
	mov	r0, #4
	ldr	r3, .L150
	mov	lr, pc
	bx	r3
	b	.L140
.L151:
	.align	2
.L150:
	.word	goToRoom
	.size	updateRoom1, .-updateRoom1
	.align	2
	.global	updateRoom2
	.type	updateRoom2, %function
updateRoom2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, [r0, #16]
	cmp	r3, #63
	mov	r4, r0
	ble	.L153
	ldr	r2, [r0, #24]
	add	r3, r3, r2
	cmp	r3, #95
	bgt	.L152
	ldr	r2, [r0, #28]
	ldr	r3, [r0, #20]
	add	r3, r2, r3
	cmp	r3, #237
	bgt	.L155
.L152:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L155:
	mov	r3, #2
	str	r3, [r0, #96]
	ldr	r3, .L156
	mov	r0, #1
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #16]
.L153:
	cmp	r3, #4
	bgt	.L152
	ldr	r3, [r4, #20]
	cmp	r3, #103
	ble	.L152
	ldr	r2, [r4, #28]
	add	r3, r3, r2
	cmp	r3, #137
	bgt	.L152
	mov	r3, #0
	str	r3, [r4, #96]
	mov	r0, #5
	ldr	r3, .L156
	mov	lr, pc
	bx	r3
	b	.L152
.L157:
	.align	2
.L156:
	.word	goToRoom
	.size	updateRoom2, .-updateRoom2
	.align	2
	.global	updateRoom3
	.type	updateRoom3, %function
updateRoom3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r2, [r0, #24]
	ldr	r3, [r0, #16]
	add	r3, r2, r3
	cmp	r3, #149
	ble	.L158
	ldr	r3, [r0, #20]
	cmp	r3, #103
	ble	.L158
	ldr	r2, [r0, #28]
	add	r3, r3, r2
	cmp	r3, #138
	ble	.L160
.L158:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L160:
	mov	r3, #1
	str	r3, [r0, #96]
	mov	r0, r3
	ldr	r3, .L161
	mov	lr, pc
	bx	r3
	b	.L158
.L162:
	.align	2
.L161:
	.word	goToRoom
	.size	updateRoom3, .-updateRoom3
	.align	2
	.global	updateRoom4
	.type	updateRoom4, %function
updateRoom4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, [r0, #16]
	cmp	r3, #63
	ble	.L163
	ldr	r2, [r0, #24]
	add	r3, r3, r2
	cmp	r3, #95
	bgt	.L163
	ldr	r3, [r0, #20]
	cmp	r3, #3
	ble	.L165
.L163:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L165:
	mov	r3, #3
	str	r3, [r0, #96]
	mov	r0, #1
	ldr	r3, .L166
	mov	lr, pc
	bx	r3
	b	.L163
.L167:
	.align	2
.L166:
	.word	goToRoom
	.size	updateRoom4, .-updateRoom4
	.align	2
	.global	updateRoom5
	.type	updateRoom5, %function
updateRoom5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r2, [r0, #24]
	ldr	r3, [r0, #16]
	add	r3, r2, r3
	cmp	r3, #149
	ble	.L168
	ldr	r3, [r0, #20]
	cmp	r3, #103
	ble	.L168
	ldr	r2, [r0, #28]
	add	r3, r3, r2
	cmp	r3, #138
	ble	.L170
.L168:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L170:
	mov	r3, #1
	str	r3, [r0, #96]
	mov	r0, #2
	ldr	r3, .L171
	mov	lr, pc
	bx	r3
	b	.L168
.L172:
	.align	2
.L171:
	.word	goToRoom
	.size	updateRoom5, .-updateRoom5
	.align	2
	.global	playerEnemyCollision
	.type	playerEnemyCollision, %function
playerEnemyCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #20]
	ldr	r2, [r0, #20]
	add	ip, r3, ip
	cmp	r2, ip
	bge	.L176
	ldr	ip, [r0, #28]
	add	r2, r2, ip
	cmp	r3, r2
	bge	.L176
	ldr	r3, [r1, #0]
	ldr	r1, [r1, #16]
	ldr	r2, [r0, #16]
	add	r1, r3, r1
	cmp	r2, r1
	bge	.L177
	ldr	r0, [r0, #24]
	add	r0, r2, r0
	cmp	r3, r0
	movge	r0, #0
	movlt	r0, #1
	bx	lr
.L176:
	mov	r0, #0
	bx	lr
.L177:
	mov	r0, #0
	bx	lr
	.size	playerEnemyCollision, .-playerEnemyCollision
	.align	2
	.global	enemyHit
	.type	enemyHit, %function
enemyHit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #36]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r1, #36]
	mov	r3, #10
	str	r3, [r1, #52]
	movle	r3, #0
	strle	r3, [r1, #40]
	bx	lr
	.size	enemyHit, .-enemyHit
	.align	2
	.global	playerHit
	.type	playerHit, %function
playerHit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #84]
	cmp	r3, #0
	bxne	lr
	ldr	r2, [r0, #80]
	add	ip, r2, r2, asl #2
	add	r1, r1, ip, asl #2
	str	r3, [r1, #16]
	mov	r3, #1
	sub	r2, r2, #1
	str	r3, [r0, #84]
	mov	r3, #30
	str	r2, [r0, #80]
	str	r3, [r0, #88]
	bx	lr
	.size	playerHit, .-playerHit
	.global	select
	.global	dir
	.comm	enemiesLeft,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	currRoom,4,4
	.comm	currCollisionMap,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	select, %object
	.size	select, 4
select:
	.space	4
	.type	dir, %object
	.size	dir, 4
dir:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
