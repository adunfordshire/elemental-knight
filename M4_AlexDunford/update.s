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
	.global	playerAttack
	.type	playerAttack, %function
playerAttack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #11008
	stmfd	sp!, {r4, lr}
	mov	r3, #0
	mov	r4, r0
	mov	r1, #5632
	ldr	r0, .L31
	add	r2, r2, #17
	ldr	ip, .L31+4
	mov	lr, pc
	bx	ip
	mov	r3, #1
	str	r3, [r4, #56]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	attackZap
	.word	playSoundB
	.size	playerAttack, .-playerAttack
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #1
	mov	r4, r0
	beq	.L61
	cmp	r3, #0
	bne	.L36
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	add	r2, r2, #16
.L59:
	sub	r3, r3, #8
	str	r3, [r4, #64]
	mov	r3, #16
	str	r3, [r4, #72]
	mov	r3, #32
	str	r2, [r4, #60]
	str	r3, [r4, #68]
.L35:
	ldr	r5, .L67
	ldr	r3, [r5, #0]
	tst	r3, #1
	beq	.L38
	ldr	r2, .L67+4
	ldr	r2, [r2, #0]
	tst	r2, #1
	bne	.L38
	mov	r0, r4
	bl	playerAttack
	ldr	r3, [r5, #0]
.L38:
	tst	r3, #256
	beq	.L39
	ldr	r2, .L67+4
	ldr	r2, [r2, #0]
	ands	r2, r2, #256
	bne	.L39
	ldr	r1, [r4, #80]
	cmp	r1, #2
	addne	r1, r1, #1
	streq	r2, [r4, #80]
	strne	r1, [r4, #80]
.L39:
	tst	r3, #512
	beq	.L41
	ldr	r2, .L67+4
	ldr	r2, [r2, #0]
	tst	r2, #512
	bne	.L41
	ldr	r2, [r4, #80]
	cmp	r2, #0
	moveq	r2, #2
	subne	r2, r2, #1
	streq	r2, [r4, #80]
	strne	r2, [r4, #80]
.L41:
	tst	r3, #4
	beq	.L43
	ldr	r3, .L67+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	moveq	r3, #3
	streq	r3, [r4, #80]
.L43:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L44
	ldr	r3, [r4, #16]
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r4, #32]
	ble	.L45
	ldr	r1, [r4, #20]
	sub	r3, r3, #1
	ldr	r2, .L67+8
	add	r1, r1, r3, asl #8
	mov	r0, r1, asl #1
	ldrh	r0, [r2, r0]
	cmp	r0, #0
	bne	.L62
.L45:
	mov	r3, #1
	str	r3, [r4, #52]
.L44:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L47
	ldr	r2, [r4, #24]
	ldr	r3, [r4, #16]
	rsb	r1, r2, #256
	cmp	r3, r1
	mov	r1, #0
	str	r1, [r4, #32]
	bge	.L48
	ldr	r1, [r4, #28]
	ldr	ip, [r4, #20]
	add	r5, r3, r1
	add	r5, r5, #1
	ldr	r0, .L67+8
	add	r5, ip, r5, asl #8
	mov	r5, r5, asl #1
	ldrh	r5, [r0, r5]
	cmp	r5, #0
	bne	.L63
.L48:
	mov	r3, #1
	str	r3, [r4, #52]
.L47:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L50
	ldr	r3, [r4, #20]
	mov	r2, #3
	cmp	r3, #0
	str	r2, [r4, #32]
	ble	.L51
	ldr	r1, [r4, #16]
	sub	r3, r3, #1
	ldr	r2, .L67+8
	add	r0, r3, r1, asl #8
	mov	r0, r0, asl #1
	ldrh	r0, [r2, r0]
	cmp	r0, #0
	bne	.L64
.L51:
	mov	r3, #1
	str	r3, [r4, #52]
.L50:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L53
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #20]
	rsb	r1, r3, #256
	cmp	r2, r1
	mov	r1, #2
	str	r1, [r4, #32]
	bge	.L54
	ldr	ip, [r4, #16]
	add	r0, r3, r2
	ldr	r1, .L67+8
	add	lr, r0, ip, asl #8
	mov	lr, lr, asl #1
	ldrh	lr, [r1, lr]
	cmp	lr, #0
	bne	.L65
.L54:
	mov	r3, #1
	str	r3, [r4, #52]
.L56:
	mov	r0, r4
	bl	playerWalk
.L58:
	mov	r3, #0
	str	r3, [r4, #52]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L36:
	cmp	r3, #3
	beq	.L66
	cmp	r3, #2
	bne	.L35
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	sub	r2, r2, #8
	add	r3, r3, #16
.L60:
	str	r3, [r4, #64]
	mov	r3, #32
	str	r3, [r4, #72]
	mov	r3, #16
	str	r2, [r4, #60]
	str	r3, [r4, #68]
	b	.L35
.L53:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	streq	r3, [r4, #40]
	beq	.L58
	b	.L56
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
	beq	.L51
	add	r0, r0, r0, lsr #31
	add	r1, r1, r0, asr #1
	sub	r1, r1, #1
	add	r1, r3, r1, asl #8
	mov	r1, r1, asl #1
	ldrh	r2, [r2, r1]
	cmp	r2, #0
	beq	.L51
	ldr	r2, [r4, #28]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldr	r1, [r4, #12]
	rsb	r2, r2, #119
	cmp	r2, r1
	blt	.L52
	ldr	r2, .L67+12
	ldr	r1, [r2, #0]
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r2, #0]
.L52:
	ldr	r2, [r4, #4]
	sub	r2, r2, #1
	str	r2, [r4, #4]
	str	r3, [r4, #20]
	b	.L51
.L62:
	ldr	r0, [r4, #28]
	add	ip, r1, r0
	add	ip, r2, ip, asl #1
	ldrh	ip, [ip, #-2]
	cmp	ip, #0
	beq	.L45
	add	r0, r0, r0, lsr #31
	add	r1, r1, r0, asr #1
	add	r2, r2, r1, asl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	beq	.L45
	ldr	r2, [r4, #24]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldr	r1, [r4, #8]
	rsb	r2, r2, #79
	cmp	r2, r1
	blt	.L46
	ldr	r2, .L67+16
	ldr	r1, [r2, #0]
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r2, #0]
.L46:
	ldr	r2, [r4, #0]
	sub	r2, r2, #1
	str	r2, [r4, #0]
	str	r3, [r4, #16]
	b	.L45
.L63:
	add	r5, r2, r3
	mov	r5, r5, asl #8
	add	r6, r1, ip
	add	r6, r6, r5
	add	r6, r0, r6, asl #1
	ldrh	r6, [r6, #-2]
	cmp	r6, #0
	beq	.L48
	add	r1, r1, r1, lsr #31
	add	ip, ip, r5
	add	r1, ip, r1, asr #1
	add	r0, r0, r1, asl #1
	ldrh	r1, [r0, #-2]
	cmp	r1, #0
	beq	.L48
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldr	r1, [r4, #8]
	rsb	r2, r2, #80
	cmp	r1, r2
	ble	.L49
	ldr	r2, .L67+16
	ldr	r1, [r2, #0]
	cmp	r1, #95
	addle	r1, r1, #1
	strle	r1, [r2, #0]
.L49:
	ldr	r2, [r4, #0]
	add	r3, r3, #1
	add	r2, r2, #1
	str	r2, [r4, #0]
	str	r3, [r4, #16]
	b	.L48
.L65:
	ldr	lr, [r4, #24]
	add	r5, ip, lr
	sub	r5, r5, #1
	add	r5, r0, r5, asl #8
	mov	r5, r5, asl #1
	ldrh	r5, [r1, r5]
	cmp	r5, #0
	beq	.L54
	add	lr, lr, lr, lsr #31
	add	ip, ip, lr, asr #1
	sub	ip, ip, #1
	add	r0, r0, ip, asl #8
	mov	r0, r0, asl #1
	ldrh	r1, [r1, r0]
	cmp	r1, #0
	beq	.L54
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	ldr	r1, [r4, #12]
	rsb	r3, r3, #120
	cmp	r1, r3
	ble	.L55
	ldr	r3, .L67+12
	ldr	r1, [r3, #0]
	cmp	r1, #15
	addle	r1, r1, #1
	strle	r1, [r3, #0]
.L55:
	ldr	r3, [r4, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	str	r3, [r4, #4]
	str	r2, [r4, #20]
	b	.L54
.L66:
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	sub	r2, r2, #8
	sub	r3, r3, #16
	b	.L60
.L68:
	.align	2
.L67:
	.word	oldButtons
	.word	buttons
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
	ldr	r2, [r0, #64]
	add	ip, r3, ip
	cmp	r2, ip
	bxgt	lr
	ldr	ip, [r0, #68]
	add	r2, r2, ip
	cmp	r3, r2
	bxgt	lr
	ldr	r3, [r0, #60]
	ldr	ip, [r0, #72]
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
	ldr	r3, [r0, #80]
	cmp	r3, #1
	beq	.L76
	cmp	r3, #0
	bne	.L72
	ldr	r2, [r1, #40]
	cmp	r2, #2
	bxne	lr
.L75:
	ldr	r2, .L77
	ldr	r0, [r2, #0]
	sub	r0, r0, #1
	str	r3, [r1, #36]
	str	r0, [r2, #0]
	bx	lr
.L72:
	cmp	r3, #2
	bne	.L73
	ldr	r3, [r1, #40]
	cmp	r3, #1
	bxne	lr
.L74:
	ldr	r3, .L77
	ldr	r2, [r3, #0]
	mov	r0, #0
	sub	r2, r2, #1
	str	r0, [r1, #36]
	str	r2, [r3, #0]
	bx	lr
.L76:
	ldr	r3, [r1, #40]
	cmp	r3, #0
	bxne	lr
	b	.L75
.L73:
	cmp	r3, #3
	beq	.L74
	bx	lr
.L78:
	.align	2
.L77:
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
	ldr	r2, .L83
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #3
	rsb	r2, r2, r2, asl #4
	subs	r2, r3, r2
	addne	r3, r3, #1
	bne	.L81
	ldr	r3, [r0, #24]
	cmp	r3, #3
	addne	r3, r3, #1
	str	r2, [r0, #28]
	streq	r2, [r0, #24]
	strne	r3, [r0, #24]
	moveq	r3, #1
	movne	r3, #1
.L81:
	str	r3, [r0, #28]
	bx	lr
.L84:
	.align	2
.L83:
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
	ldr	r4, .L89
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L86
	ldr	r2, .L89+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L88
.L86:
	tst	r3, #1
	beq	.L85
	ldr	r3, .L89+4
	ldr	r3, [r3, #0]
	tst	r3, #1
	ldreq	r3, .L89+8
	moveq	lr, pc
	bxeq	r3
.L85:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L88:
	ldr	r3, .L89+12
	ldr	r0, [r3, #0]
	ldr	r3, .L89+16
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L86
.L90:
	.align	2
.L89:
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
	ldr	r3, .L94
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L91
	ldr	r3, .L94+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L93
.L91:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L93:
	ldr	r3, .L94+8
	mov	lr, pc
	bx	r3
	b	.L91
.L95:
	.align	2
.L94:
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
	ldr	r3, .L99
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L96
	ldr	r3, .L99+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L98
.L96:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L98:
	ldr	r3, .L99+8
	mov	lr, pc
	bx	r3
	b	.L96
.L100:
	.align	2
.L99:
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
	bgt	.L101
	ldr	r3, [r0, #20]
	cmp	r3, #111
	ble	.L101
	ldr	r2, [r0, #28]
	add	r3, r3, r2
	cmp	r3, #143
	ble	.L103
.L101:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L103:
	mov	r0, #1
	ldr	r3, .L104
	mov	lr, pc
	bx	r3
	b	.L101
.L105:
	.align	2
.L104:
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
	ble	.L106
	ldr	r3, [r0, #20]
	cmp	r3, #111
	ble	.L106
	ldr	r2, [r0, #28]
	add	r3, r3, r2
	cmp	r3, #143
	ble	.L108
.L106:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L108:
	mov	r0, #0
	ldr	r3, .L109
	mov	lr, pc
	bx	r3
	b	.L106
.L110:
	.align	2
.L109:
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
	bge	.L116
	ldr	ip, [r0, #28]
	add	r2, r2, ip
	cmp	r3, r2
	bge	.L116
	ldr	r3, [r1, #0]
	ldr	r1, [r1, #16]
	ldr	r2, [r0, #16]
	add	r1, r3, r1
	cmp	r2, r1
	bge	.L117
	ldr	r0, [r0, #24]
	add	r0, r2, r0
	cmp	r3, r0
	movge	r0, #0
	movlt	r0, #1
	bx	lr
.L116:
	mov	r0, #0
	bx	lr
.L117:
	mov	r0, #0
	bx	lr
	.size	playerEnemyCollision, .-playerEnemyCollision
	.comm	enemiesLeft,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	currRoom,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
