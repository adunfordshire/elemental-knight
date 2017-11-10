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
	.file	"main.c"
	.text
	.align	2
	.global	init
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L5
	mov	r1, #96
	stmfd	sp!, {r3, r4, r5, lr}
	str	r1, [r2, #0]
	ldr	r2, .L5+4
	mov	r1, #8
	str	r1, [r2, #0]
	ldr	r2, .L5+8
	mov	r5, #3
	str	r5, [r2, #0]
	mov	r3, #67108864
	mov	r1, #256	@ movhi
	mov	r2, #7680	@ movhi
	strh	r1, [r3, #0]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r0, .L5+12
	ldr	r3, .L5+16
	mov	lr, pc
	bx	r3
	mov	r3, #-2147483648
	ldr	r4, .L5+20
	mov	r0, r5
	ldr	r1, .L5+24
	mov	r2, #100663296
	add	r3, r3, #736
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r3, #-2147483648
	mov	r0, r5
	ldr	r1, .L5+28
	add	r2, r2, #61440
	add	r3, r3, #1024
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r3, #-2147483648
	mov	r0, r5
	ldr	r1, .L5+32
	add	r2, r2, #65536
	add	r3, r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, r5
	ldr	r1, .L5+36
	mov	lr, pc
	bx	r4
	ldr	r2, .L5+40
	mov	r3, #0
.L2:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L2
	mov	r0, #3
	ldr	r1, .L5+40
	mov	r2, #117440512
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	vOff
	.word	hOff
	.word	enemiesLeft
	.word	splashBGPal
	.word	loadPalette
	.word	DMANow
	.word	splashBGTiles
	.word	splashBGMap
	.word	spritesTiles
	.word	spritesPal
	.word	shadowOAM
	.size	init, .-init
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L8
	ldr	r1, .L8+4
	mov	r0, r4
	ldr	r3, .L8+8
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r1, .L8+12
	mov	r2, #3
	ldr	r3, .L8+16
	mov	lr, pc
	bx	r3
	mov	r0, #3
	mov	r1, r4
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L8+20
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	shadowOAM
	.word	player
	.word	drawPlayer
	.word	enemy
	.word	drawEnemy
	.word	DMANow
	.size	draw, .-draw
	.align	2
	.global	goToSplash
	.type	goToSplash, %function
goToSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	init
	ldr	r2, .L11
	ldr	r3, [r2, #16]
	add	r7, r3, r3, lsr #31
	mov	r7, r7, asr #1
	ldr	r3, .L11+4
	mov	r1, #0
	mov	r6, #67108864
	mov	r4, #112
	mov	r5, #16
	rsb	r7, r7, #240
	strh	r1, [r6, #16]	@ movhi
	str	r7, [r2, #0]
	strh	r1, [r6, #18]	@ movhi
	str	r4, [r2, #4]
	str	r5, [r2, #20]
	str	r5, [r2, #16]
	str	r1, [r2, #52]
	mov	r2, #30
	str	r2, [r3, #0]
	mov	r2, #200
	str	r2, [r3, #48]
	mov	r2, #50
	mov	r0, #1
	mov	ip, #60
	str	r2, [r3, #92]
	mov	r2, #2
	str	r4, [r3, #4]
	str	r1, [r3, #40]
	str	r0, [r3, #36]
	str	ip, [r3, #44]
	str	r0, [r3, #84]
	str	r0, [r3, #80]
	str	ip, [r3, #88]
	str	r2, [r3, #128]
	str	r0, [r3, #124]
	ldr	r3, .L11+8
	str	r1, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	player
	.word	enemy
	.word	state
	.size	goToSplash, .-goToSplash
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bl	goToSplash
	ldr	r4, .L26
	ldr	r7, .L26+4
	ldr	r6, .L26+8
	ldr	fp, .L26+12
	ldr	r9, .L26+16
	ldr	sl, .L26+20
	ldr	r8, .L26+24
	mov	r5, #67108864
.L25:
	ldr	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L15:
	str	r3, [r6, #0]
	ldr	r3, [r5, #304]
	str	r3, [r4, #0]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L15
.L22:
	.word	.L16
	.word	.L17
	.word	.L18
	.word	.L19
	.word	.L20
	.word	.L21
.L21:
	mov	lr, pc
	bx	r8
	b	.L25
.L20:
	mov	lr, pc
	bx	sl
	b	.L25
.L19:
	mov	lr, pc
	bx	r9
	b	.L25
.L18:
	mov	lr, pc
	bx	fp
	b	.L25
.L17:
	ldr	r3, .L26+28
	mov	lr, pc
	bx	r3
	b	.L25
.L16:
	ldr	r3, .L26+32
	mov	lr, pc
	bx	r3
	b	.L25
.L27:
	.align	2
.L26:
	.word	buttons
	.word	state
	.word	oldButtons
	.word	updateGame
	.word	updatePause
	.word	updateDeath
	.word	updateWin
	.word	updateInstr
	.word	updateSplash
	.size	main, .-main
	.align	2
	.global	goToInstr
	.type	goToInstr, %function
goToInstr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L29
	mov	r2, #1
	str	r2, [r3, #0]
	bx	lr
.L30:
	.align	2
.L29:
	.word	state
	.size	goToInstr, .-goToInstr
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #4352	@ movhi
	mov	r3, #67108864
	strh	r2, [r3, #0]	@ movhi
	mov	r2, #7680	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r0, .L32
	mov	r5, #-2147483648
	ldr	r3, .L32+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L32+8
	mov	r0, #3
	ldr	r1, .L32+12
	mov	r2, #100663296
	add	r3, r5, #96
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	add	r3, r5, #1024
	mov	r0, #3
	ldr	r1, .L32+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L32+20
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	gameBGPal
	.word	loadPalette
	.word	DMANow
	.word	gameBGTiles
	.word	gameBGMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r3, #256	@ movhi
	mov	r4, #67108864
	strh	r3, [r4, #0]	@ movhi
	mov	r3, #7680	@ movhi
	ldr	r0, .L35
	mov	r6, #-2147483648
	strh	r3, [r4, #8]	@ movhi
	ldr	r3, .L35+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L35+8
	mov	r0, #3
	ldr	r1, .L35+12
	mov	r2, #100663296
	add	r3, r6, #1392
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	ldr	r1, .L35+16
	add	r2, r2, #61440
	add	r3, r6, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L35+20
	mov	r3, #0
	mov	r1, #3
	strh	r3, [r4, #16]	@ movhi
	str	r1, [r2, #0]
	strh	r3, [r4, #18]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	pauseBGPal
	.word	loadPalette
	.word	DMANow
	.word	pauseBGTiles
	.word	pauseBGMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToDeath
	.type	goToDeath, %function
goToDeath:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L38
	mov	r2, #4
	str	r2, [r3, #0]
	bx	lr
.L39:
	.align	2
.L38:
	.word	state
	.size	goToDeath, .-goToDeath
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r3, #256	@ movhi
	mov	r4, #67108864
	strh	r3, [r4, #0]	@ movhi
	mov	r3, #7680	@ movhi
	ldr	r0, .L41
	mov	r6, #-2147483648
	strh	r3, [r4, #8]	@ movhi
	ldr	r3, .L41+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L41+8
	mov	r0, #3
	ldr	r1, .L41+12
	mov	r2, #100663296
	add	r3, r6, #1280
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	ldr	r1, .L41+16
	add	r2, r2, #61440
	add	r3, r6, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L41+20
	mov	r3, #0
	mov	r1, #5
	strh	r3, [r4, #16]	@ movhi
	str	r1, [r2, #0]
	strh	r3, [r4, #18]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	winBGPal
	.word	loadPalette
	.word	DMANow
	.word	winBGTiles
	.word	winBGMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	updateLocations
	.type	updateLocations, %function
updateLocations:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L46
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r2, [r3, #0]
	ldr	r3, .L46+4
	ldr	r0, .L46+8
	ldr	r1, [r3, #0]
	ldr	r6, [r0, #0]
	ldr	r4, [r0, #4]
	mov	r7, r2, asl #16
	mov	r5, r1, asl #16
	ldr	r3, .L46+12
	mov	ip, #67108864
	rsb	r4, r2, r4
	mov	r7, r7, lsr #16
	mov	r5, r5, lsr #16
	rsb	r6, r1, r6
	strh	r7, [ip, #16]	@ movhi
	str	r6, [r0, #8]
	strh	r5, [ip, #18]	@ movhi
	str	r4, [r0, #12]
	add	r4, r3, #132
.L44:
	ldr	ip, [r3, #0]
	ldr	r0, [r3, #4]
	rsb	ip, r1, ip
	rsb	r0, r2, r0
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	add	r3, r3, #44
	cmp	r3, r4
	bne	.L44
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L47:
	.align	2
.L46:
	.word	hOff
	.word	vOff
	.word	player
	.word	enemy
	.size	updateLocations, .-updateLocations
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L51
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L50
.L49:
	ldr	r4, .L51+4
	ldr	r3, .L51+8
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldr	r5, .L51+12
	bl	updateLocations
	mov	r0, r4
	ldr	r1, .L51+16
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r1, .L51+20
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r1, .L51+24
	mov	lr, pc
	bx	r5
	mov	r3, #0
	str	r3, [r4, #44]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L50:
	bl	goToWin
	b	.L49
.L52:
	.align	2
.L51:
	.word	enemiesLeft
	.word	player
	.word	updatePlayer
	.word	attackCheck
	.word	enemy
	.word	enemy+44
	.word	enemy+88
	.size	update, .-update
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L56
	mov	r3, #0
.L54:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L54
	bx	lr
.L57:
	.align	2
.L56:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	enemiesLeft,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.comm	player,56,4
	.comm	enemy,132,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
