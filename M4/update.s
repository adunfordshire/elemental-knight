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
	stmfd	sp!, {r4, lr}
	ldr	r4, .L7
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L2
	ldr	r2, .L7+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L5
.L2:
	tst	r3, #4
	beq	.L1
	ldr	r3, .L7+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L6
.L1:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L6:
	ldr	r3, .L7+8
	mov	lr, pc
	bx	r3
	b	.L1
.L5:
	ldr	r3, .L7+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L2
.L8:
	.align	2
.L7:
	.word	oldButtons
	.word	buttons
	.word	goToInstr
	.word	goToGame
	.size	updateSplash, .-updateSplash
	.align	2
	.global	updateInstr
	.type	updateInstr, %function
updateInstr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L14
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L10
	ldr	r2, .L14+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L12
.L10:
	tst	r3, #2
	beq	.L9
	ldr	r3, .L14+4
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L13
.L9:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L13:
	ldr	r3, .L14+8
	mov	lr, pc
	bx	r3
	b	.L9
.L12:
	ldr	r3, .L14+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L10
.L15:
	.align	2
.L14:
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
	ldr	r3, .L19
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L17
	ldr	r3, .L19+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L18
.L17:
	ldr	r3, .L19+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+16
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L18:
	ldr	r3, .L19+20
	mov	lr, pc
	bx	r3
	b	.L17
.L20:
	.align	2
.L19:
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
	ldr	r2, .L28
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #2
	add	r2, r2, r2, asl #2
	subs	r2, r3, r2, asl #1
	addne	r3, r3, #1
	bne	.L23
	ldr	r3, [r0, #40]
	cmp	r3, #0
	str	r2, [r0, #44]
	bne	.L27
	ldr	r3, [r0, #48]
	cmp	r3, #1
	moveq	r2, #2
	streq	r2, [r0, #40]
	beq	.L23
	cmn	r3, #1
	moveq	r3, #1
	streq	r3, [r0, #40]
	movne	r3, #1
.L23:
	str	r3, [r0, #44]
	bx	lr
.L27:
	ldr	r3, [r0, #48]
	rsb	r3, r3, #0
	str	r3, [r0, #48]
	mov	r3, #1
	str	r2, [r0, #40]
	str	r3, [r0, #44]
	bx	lr
.L29:
	.align	2
.L28:
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
	ldr	r2, [r0, #56]
	cmp	r2, #0
	bne	.L34
	ldr	r1, [r0, #52]
	cmp	r1, #0
	movgt	r2, #3
	strgt	r2, [r0, #40]
	strle	r2, [r0, #40]
	bx	lr
.L34:
	b	playerWalk
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
	beq	.L61
	cmp	r3, #0
	bne	.L38
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	add	r2, r2, #16
.L59:
	sub	r3, r3, #8
	str	r3, [r4, #68]
	mov	r3, #16
	str	r3, [r4, #76]
	mov	r3, #32
	str	r2, [r4, #64]
	str	r3, [r4, #72]
.L37:
	ldr	r5, .L66
	ldr	r2, [r5, #0]
	tst	r2, #1
	beq	.L40
	ldr	r3, .L66+4
	ldr	r3, [r3, #0]
	ands	r3, r3, #1
	bne	.L40
	mov	r2, #11008
	add	r2, r2, #17
	ldr	r0, .L66+8
	mov	r1, #5632
	ldr	ip, .L66+12
	mov	lr, pc
	bx	ip
	mov	r3, #20
	str	r3, [r4, #52]
	mov	r3, #1
	str	r3, [r4, #60]
	ldr	r2, [r5, #0]
.L40:
	tst	r2, #256
	beq	.L41
	ldr	r3, .L66+4
	ldr	r3, [r3, #0]
	ands	r3, r3, #256
	bne	.L41
	ldr	r1, [r4, #84]
	cmp	r1, #2
	addne	r1, r1, #1
	streq	r3, [r4, #84]
	strne	r1, [r4, #84]
.L41:
	tst	r2, #512
	beq	.L43
	ldr	r3, .L66+4
	ldr	r3, [r3, #0]
	tst	r3, #512
	bne	.L43
	ldr	r3, [r4, #84]
	cmp	r3, #0
	moveq	r3, #2
	subne	r3, r3, #1
	streq	r3, [r4, #84]
	strne	r3, [r4, #84]
.L43:
	tst	r2, #4
	beq	.L45
	ldr	r3, .L66+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	moveq	r3, #3
	streq	r3, [r4, #84]
.L45:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L46
	ldr	r3, [r4, #16]
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r4, #32]
	ble	.L47
	ldr	r1, [r4, #20]
	sub	r3, r3, #1
	ldr	r2, .L66+16
	add	r1, r1, r3, asl #8
	mov	r0, r1, asl #1
	ldrh	r0, [r2, r0]
	cmp	r0, #0
	bne	.L62
.L47:
	mov	r3, #1
	str	r3, [r4, #56]
.L46:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L49
	ldr	r2, [r4, #24]
	ldr	r3, [r4, #16]
	rsb	r1, r2, #256
	cmp	r3, r1
	mov	r1, #0
	str	r1, [r4, #32]
	bge	.L50
	ldr	r1, [r4, #28]
	ldr	ip, [r4, #20]
	add	lr, r3, r1
	add	lr, lr, #1
	ldr	r0, .L66+16
	add	lr, ip, lr, asl #8
	mov	lr, lr, asl #1
	ldrh	lr, [r0, lr]
	cmp	lr, #0
	bne	.L63
.L50:
	mov	r3, #1
	str	r3, [r4, #56]
.L49:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L52
	ldr	r3, [r4, #20]
	mov	r2, #3
	cmp	r3, #0
	str	r2, [r4, #32]
	ble	.L53
	ldr	r1, [r4, #16]
	sub	r3, r3, #1
	ldr	r2, .L66+16
	add	r0, r3, r1, asl #8
	mov	r0, r0, asl #1
	ldrh	r0, [r2, r0]
	cmp	r0, #0
	bne	.L64
.L53:
	mov	r3, #1
	str	r3, [r4, #56]
.L52:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L55
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #20]
	rsb	r1, r3, #256
	cmp	r2, r1
	mov	r1, #2
	str	r1, [r4, #32]
	bge	.L56
	ldr	ip, [r4, #16]
	add	r0, r3, r2
	ldr	r1, .L66+16
	add	lr, r0, ip, asl #8
	mov	lr, lr, asl #1
	ldrh	lr, [r1, lr]
	cmp	lr, #0
	beq	.L56
	ldr	lr, [r4, #24]
	add	r5, ip, lr
	sub	r5, r5, #1
	add	r5, r0, r5, asl #8
	mov	r5, r5, asl #1
	ldrh	r5, [r1, r5]
	cmp	r5, #0
	beq	.L56
	add	lr, lr, lr, lsr #31
	add	ip, ip, lr, asr #1
	sub	ip, ip, #1
	add	r0, r0, ip, asl #8
	mov	r0, r0, asl #1
	ldrh	r1, [r1, r0]
	cmp	r1, #0
	beq	.L56
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	ldr	r1, [r4, #12]
	rsb	r3, r3, #120
	cmp	r1, r3
	ble	.L57
	ldr	r3, .L66+20
	ldr	r1, [r3, #0]
	cmp	r1, #15
	addle	r1, r1, #1
	strle	r1, [r3, #0]
.L57:
	ldr	r3, [r4, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	str	r3, [r4, #4]
	str	r2, [r4, #20]
.L56:
	mov	r3, #1
	str	r3, [r4, #56]
.L55:
	mov	r0, r4
	bl	playerAnimate
	ldr	r3, [r4, #52]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #52]
	mov	r3, #0
	str	r3, [r4, #56]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L38:
	cmp	r3, #3
	beq	.L65
	cmp	r3, #2
	bne	.L37
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	sub	r2, r2, #8
	add	r3, r3, #16
.L60:
	str	r3, [r4, #68]
	mov	r3, #32
	str	r3, [r4, #76]
	mov	r3, #16
	str	r2, [r4, #64]
	str	r3, [r4, #72]
	b	.L37
.L61:
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	sub	r2, r2, #16
	b	.L59
.L64:
	ldr	r0, [r4, #24]
	add	ip, r1, r0
	sub	ip, ip, #1
	add	ip, r3, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	beq	.L53
	add	r0, r0, r0, lsr #31
	add	r1, r1, r0, asr #1
	sub	r1, r1, #1
	add	r1, r3, r1, asl #8
	mov	r1, r1, asl #1
	ldrh	r2, [r2, r1]
	cmp	r2, #0
	beq	.L53
	ldr	r2, [r4, #28]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldr	r1, [r4, #12]
	rsb	r2, r2, #119
	cmp	r2, r1
	blt	.L54
	ldr	r2, .L66+20
	ldr	r1, [r2, #0]
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r2, #0]
.L54:
	ldr	r2, [r4, #4]
	sub	r2, r2, #1
	str	r2, [r4, #4]
	str	r3, [r4, #20]
	b	.L53
.L62:
	ldr	r0, [r4, #28]
	add	ip, r1, r0
	add	ip, r2, ip, asl #1
	ldrh	ip, [ip, #-2]
	cmp	ip, #0
	beq	.L47
	add	r0, r0, r0, lsr #31
	add	r1, r1, r0, asr #1
	add	r2, r2, r1, asl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	beq	.L47
	ldr	r2, [r4, #24]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldr	r1, [r4, #8]
	rsb	r2, r2, #79
	cmp	r2, r1
	blt	.L48
	ldr	r2, .L66+24
	ldr	r1, [r2, #0]
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r2, #0]
.L48:
	ldr	r2, [r4, #0]
	sub	r2, r2, #1
	str	r2, [r4, #0]
	str	r3, [r4, #16]
	b	.L47
.L63:
	add	lr, r2, r3
	mov	lr, lr, asl #8
	add	r5, r1, ip
	add	r5, r5, lr
	add	r5, r0, r5, asl #1
	ldrh	r5, [r5, #-2]
	cmp	r5, #0
	beq	.L50
	add	r1, r1, r1, lsr #31
	add	ip, ip, lr
	add	r1, ip, r1, asr #1
	add	r0, r0, r1, asl #1
	ldrh	r1, [r0, #-2]
	cmp	r1, #0
	beq	.L50
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldr	r1, [r4, #8]
	rsb	r2, r2, #80
	cmp	r1, r2
	ble	.L51
	ldr	r2, .L66+24
	ldr	r1, [r2, #0]
	cmp	r1, #95
	addle	r1, r1, #1
	strle	r1, [r2, #0]
.L51:
	ldr	r2, [r4, #0]
	add	r3, r3, #1
	add	r2, r2, #1
	str	r2, [r4, #0]
	str	r3, [r4, #16]
	b	.L50
.L65:
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	sub	r2, r2, #8
	sub	r3, r3, #16
	b	.L60
.L67:
	.align	2
.L66:
	.word	oldButtons
	.word	buttons
	.word	attackZap
	.word	playSoundB
	.word	collisionMapBitmap
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
	ldr	r3, [r1, #36]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #84]
	cmp	r3, #1
	beq	.L75
	cmp	r3, #0
	bne	.L71
	ldr	r2, [r1, #40]
	cmp	r2, #2
	bxne	lr
.L74:
	ldr	r2, .L76
	ldr	r0, [r2, #0]
	sub	r0, r0, #1
	str	r3, [r1, #36]
	str	r0, [r2, #0]
	bx	lr
.L71:
	cmp	r3, #2
	bne	.L72
	ldr	r3, [r1, #40]
	cmp	r3, #1
	bxne	lr
.L73:
	ldr	r3, .L76
	ldr	r2, [r3, #0]
	mov	r0, #0
	sub	r2, r2, #1
	str	r0, [r1, #36]
	str	r2, [r3, #0]
	bx	lr
.L75:
	ldr	r3, [r1, #40]
	cmp	r3, #0
	bxne	lr
	b	.L74
.L72:
	cmp	r3, #3
	beq	.L73
	bx	lr
.L77:
	.align	2
.L76:
	.word	enemiesLeft
	.size	attackCheck, .-attackCheck
	.align	2
	.global	updateEnemy
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	ldr	r2, .L82
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #3
	rsb	r2, r2, r2, asl #4
	subs	r2, r3, r2
	addne	r3, r3, #1
	bne	.L80
	ldr	r3, [r0, #24]
	cmp	r3, #3
	addne	r3, r3, #1
	str	r2, [r0, #28]
	streq	r2, [r0, #24]
	strne	r3, [r0, #24]
	moveq	r3, #1
	movne	r3, #1
.L80:
	str	r3, [r0, #28]
	bx	lr
.L83:
	.align	2
.L82:
	.word	-2004318071
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L88
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L85
	ldr	r2, .L88+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L87
.L85:
	tst	r3, #1
	beq	.L84
	ldr	r3, .L88+4
	ldr	r3, [r3, #0]
	tst	r3, #1
	ldreq	r3, .L88+8
	moveq	lr, pc
	bxeq	r3
.L84:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L87:
	ldr	r3, .L88+12
	ldr	r0, [r3, #0]
	ldr	r3, .L88+16
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L85
.L89:
	.align	2
.L88:
	.word	oldButtons
	.word	buttons
	.word	goToSplash
	.word	currRoom
	.word	goToRoom
	.size	updatePause, .-updatePause
	.align	2
	.global	updateDeath
	.type	updateDeath, %function
updateDeath:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L93
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L90
	ldr	r3, .L93+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L92
.L90:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L92:
	ldr	r3, .L93+8
	mov	lr, pc
	bx	r3
	b	.L90
.L94:
	.align	2
.L93:
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
	ldr	r3, .L98
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L95
	ldr	r3, .L98+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L97
.L95:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L97:
	ldr	r3, .L98+8
	mov	lr, pc
	bx	r3
	b	.L95
.L99:
	.align	2
.L98:
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
	cmp	r3, #15
	bgt	.L100
	ldr	r3, [r0, #20]
	cmp	r3, #111
	ble	.L100
	ldr	r2, [r0, #28]
	add	r3, r3, r2
	cmp	r3, #143
	ble	.L102
.L100:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L102:
	mov	r0, #1
	ldr	r3, .L103
	mov	lr, pc
	bx	r3
	b	.L100
.L104:
	.align	2
.L103:
	.word	goToRoom
	.size	updateRoom0, .-updateRoom0
	.align	2
	.global	updateRoom1
	.type	updateRoom1, %function
updateRoom1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r2, [r0, #24]
	ldr	r3, [r0, #16]
	add	r3, r2, r3
	cmp	r3, #150
	ble	.L105
	ldr	r3, [r0, #20]
	cmp	r3, #111
	ble	.L105
	ldr	r2, [r0, #28]
	add	r3, r3, r2
	cmp	r3, #143
	ble	.L107
.L105:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L107:
	mov	r0, #0
	ldr	r3, .L108
	mov	lr, pc
	bx	r3
	b	.L105
.L109:
	.align	2
.L108:
	.word	goToRoom
	.size	updateRoom1, .-updateRoom1
	.align	2
	.global	updateRoom2
	.type	updateRoom2, %function
updateRoom2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateRoom2, .-updateRoom2
	.align	2
	.global	updateRoom4
	.type	updateRoom4, %function
updateRoom4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateRoom4, .-updateRoom4
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
	bge	.L115
	ldr	ip, [r0, #28]
	add	r2, r2, ip
	cmp	r3, r2
	bge	.L115
	ldr	r3, [r1, #0]
	ldr	r1, [r1, #16]
	ldr	r2, [r0, #16]
	add	r1, r3, r1
	cmp	r2, r1
	bge	.L116
	ldr	r0, [r0, #24]
	add	r0, r2, r0
	cmp	r3, r0
	movge	r0, #0
	movlt	r0, #1
	bx	lr
.L115:
	mov	r0, #0
	bx	lr
.L116:
	mov	r0, #0
	bx	lr
	.size	playerEnemyCollision, .-playerEnemyCollision
	.comm	enemiesLeft,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	currRoom,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
