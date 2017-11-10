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
	tst	r3, #1
	beq	.L10
	ldr	r2, .L14+4
	ldr	r2, [r2, #0]
	tst	r2, #1
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
.L12:
	ldr	r3, .L14+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L10
.L13:
	ldr	r3, .L14+12
	mov	lr, pc
	bx	r3
	b	.L9
.L15:
	.align	2
.L14:
	.word	oldButtons
	.word	buttons
	.word	goToGame
	.word	goToSplash
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
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L50
	ldr	r3, [r3, #0]
	tst	r3, #1
	beq	.L22
	ldr	r2, .L50+4
	ldr	r2, [r2, #0]
	tst	r2, #1
	moveq	r2, #1
	streq	r2, [r0, #44]
.L22:
	tst	r3, #256
	beq	.L23
	ldr	r2, .L50+4
	ldr	r2, [r2, #0]
	ands	r2, r2, #256
	beq	.L46
.L23:
	tst	r3, #512
	beq	.L25
	ldr	r3, .L50+4
	ldr	r3, [r3, #0]
	tst	r3, #512
	beq	.L47
.L25:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L27
	ldr	r3, [r0, #0]
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r0, #24]
	ble	.L28
	ldr	r2, [r0, #16]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldr	r1, [r0, #8]
	rsb	r2, r2, #79
	cmp	r2, r1
	blt	.L29
	ldr	r2, .L50+8
	ldr	r1, [r2, #0]
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r2, #0]
.L29:
	sub	r3, r3, #1
	str	r3, [r0, #0]
.L28:
	mov	r3, #1
	str	r3, [r0, #40]
.L27:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L30
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #0]
	rsb	r1, r3, #256
	cmp	r2, r1
	mov	r1, #0
	str	r1, [r0, #24]
	blt	.L48
.L31:
	mov	r3, #1
	str	r3, [r0, #40]
.L30:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L33
	ldr	r3, [r0, #4]
	mov	r2, #3
	cmp	r3, #0
	str	r2, [r0, #24]
	ble	.L34
	ldr	r2, [r0, #20]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	ldr	r1, [r0, #12]
	rsb	r2, r2, #119
	cmp	r2, r1
	blt	.L35
	ldr	r2, .L50+12
	ldr	r1, [r2, #0]
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r2, #0]
.L35:
	sub	r3, r3, #1
	str	r3, [r0, #4]
.L34:
	mov	r3, #1
	str	r3, [r0, #40]
.L33:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L36
	ldr	r3, [r0, #20]
	ldr	r2, [r0, #4]
	rsb	r1, r3, #256
	cmp	r2, r1
	mov	r1, #2
	str	r1, [r0, #24]
	blt	.L49
.L37:
	mov	r3, #1
	str	r3, [r0, #40]
.L39:
	ldr	r3, [r0, #36]
	ldr	r2, .L50+16
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #3
	add	r2, r2, r2, asl #2
	subs	r2, r3, r2, asl #2
	addne	r3, r3, #1
	bne	.L42
	ldr	r3, [r0, #32]
	cmp	r3, #2
	addne	r3, r3, #1
	str	r2, [r0, #36]
	streq	r2, [r0, #32]
	strne	r3, [r0, #32]
	moveq	r3, #1
	movne	r3, #1
.L42:
	str	r3, [r0, #36]
	mov	r3, #0
	str	r3, [r0, #40]
	bx	lr
.L36:
	ldr	r3, [r0, #40]
	cmp	r3, #0
	streq	r3, [r0, #32]
	bne	.L39
	mov	r3, #0
	str	r3, [r0, #40]
	bx	lr
.L48:
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	ldr	r1, [r0, #8]
	rsb	r3, r3, #80
	cmp	r1, r3
	ble	.L32
	ldr	r3, .L50+8
	ldr	r1, [r3, #0]
	cmp	r1, #95
	addle	r1, r1, #1
	strle	r1, [r3, #0]
.L32:
	add	r2, r2, #1
	str	r2, [r0, #0]
	b	.L31
.L47:
	ldr	r3, [r0, #52]
	cmp	r3, #0
	moveq	r3, #2
	subne	r3, r3, #1
	streq	r3, [r0, #52]
	strne	r3, [r0, #52]
	b	.L25
.L49:
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	ldr	r1, [r0, #12]
	rsb	r3, r3, #120
	cmp	r1, r3
	ble	.L38
	ldr	r3, .L50+12
	ldr	r1, [r3, #0]
	cmp	r1, #15
	addle	r1, r1, #1
	strle	r1, [r3, #0]
.L38:
	add	r2, r2, #1
	str	r2, [r0, #4]
	b	.L37
.L46:
	ldr	r1, [r0, #52]
	cmp	r1, #2
	addne	r1, r1, #1
	streq	r2, [r0, #52]
	strne	r1, [r0, #52]
	b	.L23
.L51:
	.align	2
.L50:
	.word	oldButtons
	.word	buttons
	.word	vOff
	.word	hOff
	.word	1717986919
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	playerWalk
	.type	playerWalk, %function
playerWalk:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	ldr	r2, .L56
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #3
	add	r2, r2, r2, asl #2
	subs	r2, r3, r2, asl #2
	addne	r3, r3, #1
	bne	.L54
	ldr	r3, [r0, #32]
	cmp	r3, #2
	addne	r3, r3, #1
	str	r2, [r0, #36]
	streq	r2, [r0, #32]
	strne	r3, [r0, #32]
	moveq	r3, #1
	movne	r3, #1
.L54:
	str	r3, [r0, #36]
	bx	lr
.L57:
	.align	2
.L56:
	.word	1717986919
	.size	playerWalk, .-playerWalk
	.align	2
	.global	playerAttack
	.type	playerAttack, %function
playerAttack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1
	str	r3, [r0, #44]
	bx	lr
	.size	playerAttack, .-playerAttack
	.align	2
	.global	attackCheck
	.type	attackCheck, %function
attackCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #36]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #52]
	cmp	r3, #1
	beq	.L64
	cmp	r3, #0
	bne	.L62
	ldr	r2, [r1, #40]
	cmp	r2, #2
	bxne	lr
.L63:
	ldr	r2, .L65
	ldr	r0, [r2, #0]
	sub	r0, r0, #1
	str	r3, [r1, #36]
	str	r0, [r2, #0]
	bx	lr
.L62:
	cmp	r3, #2
	bxne	lr
	ldr	r3, [r1, #40]
	cmp	r3, #1
	bxne	lr
	ldr	r3, .L65
	ldr	r2, [r3, #0]
	mov	r0, #0
	sub	r2, r2, #1
	str	r0, [r1, #36]
	str	r2, [r3, #0]
	bx	lr
.L64:
	ldr	r3, [r1, #40]
	cmp	r3, #0
	bxne	lr
	b	.L63
.L66:
	.align	2
.L65:
	.word	enemiesLeft
	.size	attackCheck, .-attackCheck
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L71
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L68
	ldr	r2, .L71+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L70
.L68:
	tst	r3, #1
	beq	.L67
	ldr	r3, .L71+4
	ldr	r3, [r3, #0]
	tst	r3, #1
	ldreq	r3, .L71+8
	moveq	lr, pc
	bxeq	r3
.L67:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L70:
	ldr	r3, .L71+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L68
.L72:
	.align	2
.L71:
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
	ldr	r3, .L76
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L73
	ldr	r3, .L76+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L75
.L73:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L75:
	ldr	r3, .L76+8
	mov	lr, pc
	bx	r3
	b	.L73
.L77:
	.align	2
.L76:
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
	ldr	r3, .L81
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L78
	ldr	r3, .L81+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L80
.L78:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L80:
	ldr	r3, .L81+8
	mov	lr, pc
	bx	r3
	b	.L78
.L82:
	.align	2
.L81:
	.word	oldButtons
	.word	buttons
	.word	goToSplash
	.size	updateWin, .-updateWin
	.comm	enemiesLeft,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
