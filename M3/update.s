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
	beq	.L60
	cmp	r3, #0
	bne	.L36
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	add	r2, r2, #16
.L58:
	sub	r3, r3, #8
	str	r3, [r4, #64]
	mov	r3, #16
	str	r3, [r4, #72]
	mov	r3, #32
	str	r2, [r4, #60]
	str	r3, [r4, #68]
.L35:
	ldr	r5, .L66
	ldr	r3, [r5, #0]
	tst	r3, #1
	beq	.L38
	ldr	r2, .L66+4
	ldr	r2, [r2, #0]
	tst	r2, #1
	bne	.L38
	mov	r0, r4
	bl	playerAttack
	ldr	r3, [r5, #0]
.L38:
	tst	r3, #256
	beq	.L39
	ldr	r2, .L66+4
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
	ldr	r3, .L66+4
	ldr	r3, [r3, #0]
	tst	r3, #512
	bne	.L41
	ldr	r3, [r4, #80]
	cmp	r3, #0
	moveq	r3, #2
	subne	r3, r3, #1
	streq	r3, [r4, #80]
	strne	r3, [r4, #80]
.L41:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L43
	ldr	r3, [r4, #16]
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r4, #32]
	ble	.L44
	ldr	r1, [r4, #20]
	sub	r3, r3, #1
	ldr	r2, .L66+8
	add	r1, r1, r3, asl #8
	mov	r0, r1, asl #1
	ldrh	r0, [r2, r0]
	cmp	r0, #0
	bne	.L61
.L44:
	mov	r3, #1
	str	r3, [r4, #52]
.L43:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L46
	ldr	r2, [r4, #24]
	ldr	r3, [r4, #16]
	rsb	r1, r2, #256
	cmp	r3, r1
	mov	r1, #0
	str	r1, [r4, #32]
	bge	.L47
	ldr	r1, [r4, #28]
	ldr	ip, [r4, #20]
	add	r5, r3, r1
	add	r5, r5, #1
	ldr	r0, .L66+8
	add	r5, ip, r5, asl #8
	mov	r5, r5, asl #1
	ldrh	r5, [r0, r5]
	cmp	r5, #0
	bne	.L62
.L47:
	mov	r3, #1
	str	r3, [r4, #52]
.L46:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L49
	ldr	r3, [r4, #20]
	mov	r2, #3
	cmp	r3, #0
	str	r2, [r4, #32]
	ble	.L50
	ldr	r1, [r4, #16]
	sub	r3, r3, #1
	ldr	r2, .L66+8
	add	r0, r3, r1, asl #8
	mov	r0, r0, asl #1
	ldrh	r0, [r2, r0]
	cmp	r0, #0
	bne	.L63
.L50:
	mov	r3, #1
	str	r3, [r4, #52]
.L49:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L52
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #20]
	rsb	r1, r3, #256
	cmp	r2, r1
	mov	r1, #2
	str	r1, [r4, #32]
	bge	.L53
	ldr	ip, [r4, #16]
	add	r0, r3, r2
	ldr	r1, .L66+8
	add	lr, r0, ip, asl #8
	mov	lr, lr, asl #1
	ldrh	lr, [r1, lr]
	cmp	lr, #0
	bne	.L64
.L53:
	mov	r3, #1
	str	r3, [r4, #52]
.L55:
	mov	r0, r4
	bl	playerWalk
.L57:
	mov	r3, #0
	str	r3, [r4, #52]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L36:
	cmp	r3, #3
	beq	.L65
	cmp	r3, #2
	bne	.L35
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	sub	r2, r2, #8
	add	r3, r3, #16
.L59:
	str	r3, [r4, #64]
	mov	r3, #32
	str	r3, [r4, #72]
	mov	r3, #16
	str	r2, [r4, #60]
	str	r3, [r4, #68]
	b	.L35
.L52:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	streq	r3, [r4, #40]
	beq	.L57
	b	.L55
.L60:
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	sub	r2, r2, #16
	b	.L58
.L63:
	ldr	r0, [r4, #24]
	add	ip, r1, r0
	sub	ip, ip, #1
	add	ip, r3, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	beq	.L50
	add	r0, r0, r0, lsr #31
	add	r1, r1, r0, asr #1
	sub	r1, r1, #1
	add	r1, r3, r1, asl #8
	mov	r1, r1, asl #1
	ldrh	r2, [r2, r1]
	cmp	r2, #0
	beq	.L50
	ldr	r2, [r4, #28]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldr	r1, [r4, #12]
	rsb	r2, r2, #119
	cmp	r2, r1
	blt	.L51
	ldr	r2, .L66+12
	ldr	r1, [r2, #0]
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r2, #0]
.L51:
	ldr	r2, [r4, #4]
	sub	r2, r2, #1
	str	r2, [r4, #4]
	str	r3, [r4, #20]
	b	.L50
.L61:
	ldr	r0, [r4, #28]
	add	ip, r1, r0
	add	ip, r2, ip, asl #1
	ldrh	ip, [ip, #-2]
	cmp	ip, #0
	beq	.L44
	add	r0, r0, r0, lsr #31
	add	r1, r1, r0, asr #1
	add	r2, r2, r1, asl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	beq	.L44
	ldr	r2, [r4, #24]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldr	r1, [r4, #8]
	rsb	r2, r2, #79
	cmp	r2, r1
	blt	.L45
	ldr	r2, .L66+16
	ldr	r1, [r2, #0]
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r2, #0]
.L45:
	ldr	r2, [r4, #0]
	sub	r2, r2, #1
	str	r2, [r4, #0]
	str	r3, [r4, #16]
	b	.L44
.L62:
	add	r5, r2, r3
	mov	r5, r5, asl #8
	add	r6, r1, ip
	add	r6, r6, r5
	add	r6, r0, r6, asl #1
	ldrh	r6, [r6, #-2]
	cmp	r6, #0
	beq	.L47
	add	r1, r1, r1, lsr #31
	add	ip, ip, r5
	add	r1, ip, r1, asr #1
	add	r0, r0, r1, asl #1
	ldrh	r1, [r0, #-2]
	cmp	r1, #0
	beq	.L47
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldr	r1, [r4, #8]
	rsb	r2, r2, #80
	cmp	r1, r2
	ble	.L48
	ldr	r2, .L66+16
	ldr	r1, [r2, #0]
	cmp	r1, #95
	addle	r1, r1, #1
	strle	r1, [r2, #0]
.L48:
	ldr	r2, [r4, #0]
	add	r3, r3, #1
	add	r2, r2, #1
	str	r2, [r4, #0]
	str	r3, [r4, #16]
	b	.L47
.L64:
	ldr	lr, [r4, #24]
	add	r5, ip, lr
	sub	r5, r5, #1
	add	r5, r0, r5, asl #8
	mov	r5, r5, asl #1
	ldrh	r5, [r1, r5]
	cmp	r5, #0
	beq	.L53
	add	lr, lr, lr, lsr #31
	add	ip, ip, lr, asr #1
	sub	ip, ip, #1
	add	r0, r0, ip, asl #8
	mov	r0, r0, asl #1
	ldrh	r1, [r1, r0]
	cmp	r1, #0
	beq	.L53
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	ldr	r1, [r4, #12]
	rsb	r3, r3, #120
	cmp	r1, r3
	ble	.L54
	ldr	r3, .L66+12
	ldr	r1, [r3, #0]
	cmp	r1, #15
	addle	r1, r1, #1
	strle	r1, [r3, #0]
.L54:
	ldr	r3, [r4, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	str	r3, [r4, #4]
	str	r2, [r4, #20]
	b	.L53
.L65:
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	sub	r2, r2, #8
	sub	r3, r3, #16
	b	.L59
.L67:
	.align	2
.L66:
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
	beq	.L73
	cmp	r3, #0
	bne	.L71
	ldr	r2, [r1, #40]
	cmp	r2, #2
	bxne	lr
.L72:
	ldr	r2, .L74
	ldr	r0, [r2, #0]
	sub	r0, r0, #1
	str	r3, [r1, #36]
	str	r0, [r2, #0]
	bx	lr
.L71:
	cmp	r3, #2
	bxne	lr
	ldr	r3, [r1, #40]
	cmp	r3, #1
	bxne	lr
	ldr	r3, .L74
	ldr	r2, [r3, #0]
	mov	r0, #0
	sub	r2, r2, #1
	str	r0, [r1, #36]
	str	r2, [r3, #0]
	bx	lr
.L73:
	ldr	r3, [r1, #40]
	cmp	r3, #0
	bxne	lr
	b	.L72
.L75:
	.align	2
.L74:
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
	ldr	r2, .L80
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #3
	rsb	r2, r2, r2, asl #4
	subs	r2, r3, r2
	addne	r3, r3, #1
	bne	.L78
	ldr	r3, [r0, #24]
	cmp	r3, #3
	addne	r3, r3, #1
	str	r2, [r0, #28]
	streq	r2, [r0, #24]
	strne	r3, [r0, #24]
	moveq	r3, #1
	movne	r3, #1
.L78:
	str	r3, [r0, #28]
	bx	lr
.L81:
	.align	2
.L80:
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
	ldr	r4, .L86
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L83
	ldr	r2, .L86+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L85
.L83:
	tst	r3, #1
	beq	.L82
	ldr	r3, .L86+4
	ldr	r3, [r3, #0]
	tst	r3, #1
	ldreq	r3, .L86+8
	moveq	lr, pc
	bxeq	r3
.L82:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L85:
	ldr	r3, .L86+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L83
.L87:
	.align	2
.L86:
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
	ldr	r3, .L91
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L88
	ldr	r3, .L91+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L90
.L88:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L90:
	ldr	r3, .L91+8
	mov	lr, pc
	bx	r3
	b	.L88
.L92:
	.align	2
.L91:
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
	ldr	r3, .L96
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L93
	ldr	r3, .L96+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L95
.L93:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L95:
	ldr	r3, .L96+8
	mov	lr, pc
	bx	r3
	b	.L93
.L97:
	.align	2
.L96:
	.word	oldButtons
	.word	buttons
	.word	goToSplash
	.size	updateWin, .-updateWin
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
	bge	.L101
	ldr	ip, [r0, #28]
	add	r2, r2, ip
	cmp	r3, r2
	bge	.L101
	ldr	r3, [r1, #0]
	ldr	r1, [r1, #16]
	ldr	r2, [r0, #16]
	add	r1, r3, r1
	cmp	r2, r1
	bge	.L102
	ldr	r0, [r0, #24]
	add	r0, r2, r0
	cmp	r3, r0
	movge	r0, #0
	movlt	r0, #1
	bx	lr
.L101:
	mov	r0, #0
	bx	lr
.L102:
	mov	r0, #0
	bx	lr
	.size	playerEnemyCollision, .-playerEnemyCollision
	.comm	enemiesLeft,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
