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
	mov	r1, #67108864
	add	r1, r1, #512
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldrh	r2, [r1, #0]
	ldr	r0, .L5
	mov	r3, #50331648
	add	r3, r3, #28672
	orr	r2, r2, #1
	str	r0, [r3, #4092]
	strh	r2, [r1, #0]	@ movhi
	mov	ip, #67108864
	ldrh	r0, [ip, #4]
	mov	r4, #1	@ movhi
	orr	r0, r0, #8
	mov	r6, #128	@ movhi
	strh	r0, [ip, #4]	@ movhi
	strh	r4, [r1, #8]	@ movhi
	strh	r6, [ip, #132]	@ movhi
	ldr	r6, .L5+4
	mov	r7, #96
	str	r7, [r6, #0]
	ldr	r6, .L5+8
	mov	r7, #8
	str	r7, [r6, #0]
	mvn	lr, #1264
	ldr	r6, .L5+12
	mov	r5, #3
	sub	lr, lr, #1
	str	r5, [r6, #0]
	mov	r2, #100663296
	strh	lr, [ip, #130]	@ movhi
	mov	r3, #-2147483648
	mov	lr, #0	@ movhi
	mov	r0, r5
	ldr	r1, .L5+16
	add	r2, r2, #65536
	add	r3, r3, #16384
	ldr	r4, .L5+20
	strh	lr, [ip, #128]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, r5
	ldr	r1, .L5+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L5+28
	mov	r3, #0
.L2:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L2
	mov	r0, #3
	ldr	r1, .L5+28
	mov	r2, #117440512
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	interruptHandler
	.word	vOff
	.word	hOff
	.word	enemiesLeft
	.word	spritesTiles
	.word	DMANow
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
	stmfd	sp!, {r4, r5, r6, lr}
	bl	init
	mov	r4, #67108864
	mov	r3, #256	@ movhi
	strh	r3, [r4, #0]	@ movhi
	mov	r3, #7680	@ movhi
	mov	r6, #-2147483648
	strh	r3, [r4, #8]	@ movhi
	ldr	r0, .L11
	ldr	r3, .L11+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L11+8
	add	r3, r6, #1840
	mov	r0, #3
	ldr	r1, .L11+12
	mov	r2, #100663296
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	add	r3, r6, #1024
	mov	r0, #3
	ldr	r1, .L11+16
	add	r2, r2, #61440
	mov	lr, pc
	bx	r5
	ldr	r2, .L11+20
	mov	r1, #16
	mov	ip, #0
	strh	ip, [r4, #16]	@ movhi
	str	r1, [r2, #28]
	strh	ip, [r4, #18]	@ movhi
	mov	r4, #232
	str	r4, [r2, #0]
	mov	r4, #240
	str	r4, [r2, #16]
	mov	r4, #120
	ldr	r3, .L11+24
	mov	r0, #1
	mov	r6, #112
	str	r4, [r2, #20]
	mov	r4, #3
	str	r1, [r2, #24]
	str	r6, [r2, #4]
	str	r0, [r2, #32]
	str	ip, [r2, #80]
	str	r4, [r2, #76]
	str	r0, [r2, #48]
	mov	r2, #30
	str	r2, [r3, #0]
	mov	r2, #2
	str	r2, [r3, #40]
	mov	r2, #200
	mov	r5, #60
	str	r2, [r3, #48]
	mov	r2, #50
	str	r2, [r3, #92]
	str	r6, [r3, #4]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r0, [r3, #36]
	str	r5, [r3, #44]
	str	r1, [r3, #64]
	str	r1, [r3, #60]
	str	ip, [r3, #84]
	str	r0, [r3, #80]
	str	r5, [r3, #88]
	str	r1, [r3, #108]
	str	r1, [r3, #104]
	str	r0, [r3, #128]
	str	r0, [r3, #124]
	ldr	r2, .L11+28
	ldr	r3, .L11+32
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	splashBGPal
	.word	loadPalette
	.word	DMANow
	.word	splashBGTiles
	.word	splashBGMap
	.word	player
	.word	enemy
	.word	updateSplash
	.word	state
	.size	goToSplash, .-goToSplash
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	goToSplash
	ldr	r7, .L15
	ldr	r4, .L15+4
	ldr	r6, .L15+8
	mov	r5, #67108864
.L14:
	ldr	r2, [r4, #0]
	ldr	r3, [r5, #304]
	str	r2, [r7, #0]
	str	r3, [r4, #0]
	ldr	ip, [r6, #0]
	mov	lr, pc
	bx	ip
	b	.L14
.L16:
	.align	2
.L15:
	.word	oldButtons
	.word	buttons
	.word	state
	.size	main, .-main
	.align	2
	.global	goToInstr
	.type	goToInstr, %function
goToInstr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #256	@ movhi
	mov	r3, #67108864
	strh	r2, [r3, #0]	@ movhi
	mov	r2, #7680	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r0, .L18
	mov	r5, #-2147483648
	ldr	r3, .L18+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L18+8
	mov	r0, #3
	ldr	r1, .L18+12
	mov	r2, #100663296
	add	r3, r5, #2912
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	add	r3, r5, #1024
	mov	r0, #3
	ldr	r1, .L18+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L18+20
	ldr	r3, .L18+24
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	instrBGPal
	.word	loadPalette
	.word	DMANow
	.word	instrBGTiles
	.word	instrBGMap
	.word	updateInstr
	.word	state
	.size	goToInstr, .-goToInstr
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
	ldr	r0, .L21
	mov	r6, #-2147483648
	strh	r3, [r4, #8]	@ movhi
	ldr	r3, .L21+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L21+8
	mov	r0, #3
	ldr	r1, .L21+12
	mov	r2, #100663296
	add	r3, r6, #1392
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	ldr	r1, .L21+16
	add	r2, r2, #61440
	add	r3, r6, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r1, .L21+20
	ldr	r2, .L21+24
	mov	r3, #0
	strh	r3, [r4, #16]	@ movhi
	str	r1, [r2, #0]
	strh	r3, [r4, #18]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	pauseBGPal
	.word	loadPalette
	.word	DMANow
	.word	pauseBGTiles
	.word	pauseBGMap
	.word	updatePause
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToDeath
	.type	goToDeath, %function
goToDeath:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #256	@ movhi
	mov	r3, #67108864
	strh	r2, [r3, #0]	@ movhi
	mov	r2, #7680	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r0, .L24
	mov	r5, #-2147483648
	ldr	r3, .L24+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L24+8
	mov	r0, #3
	ldr	r1, .L24+12
	mov	r2, #100663296
	add	r3, r5, #1472
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	add	r3, r5, #1024
	mov	r0, #3
	ldr	r1, .L24+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L24+20
	ldr	r3, .L24+24
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	loseBGPal
	.word	loadPalette
	.word	DMANow
	.word	loseBGTiles
	.word	loseBGMap
	.word	updateDeath
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
	ldr	r0, .L27
	mov	r6, #-2147483648
	strh	r3, [r4, #8]	@ movhi
	ldr	r3, .L27+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L27+8
	mov	r0, #3
	ldr	r1, .L27+12
	mov	r2, #100663296
	add	r3, r6, #1280
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	ldr	r1, .L27+16
	add	r2, r2, #61440
	add	r3, r6, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r1, .L27+20
	ldr	r2, .L27+24
	mov	r3, #0
	strh	r3, [r4, #16]	@ movhi
	str	r1, [r2, #0]
	strh	r3, [r4, #18]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	winBGPal
	.word	loadPalette
	.word	DMANow
	.word	winBGTiles
	.word	winBGMap
	.word	updateWin
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
	ldr	r3, .L32
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r2, [r3, #0]
	ldr	r3, .L32+4
	ldr	r0, .L32+8
	ldr	r1, [r3, #0]
	ldr	r6, [r0, #0]
	ldr	r4, [r0, #4]
	mov	r7, r2, asl #16
	mov	r5, r1, asl #16
	ldr	r3, .L32+12
	mov	ip, #67108864
	rsb	r4, r2, r4
	mov	r7, r7, lsr #16
	mov	r5, r5, lsr #16
	rsb	r6, r1, r6
	strh	r7, [ip, #20]	@ movhi
	str	r6, [r0, #8]
	strh	r5, [ip, #22]	@ movhi
	str	r4, [r0, #12]
	add	r4, r3, #132
.L30:
	ldr	ip, [r3, #0]
	ldr	r0, [r3, #4]
	rsb	ip, r1, ip
	rsb	r0, r2, r0
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	add	r3, r3, #44
	cmp	r3, r4
	bne	.L30
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L33:
	.align	2
.L32:
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
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r8, .L44
	ldr	r3, [r8, #76]
	cmp	r3, #0
	ble	.L41
.L35:
	ldr	r3, .L44+4
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L42
.L36:
	ldr	r0, .L44
	ldr	r3, .L44+8
	mov	lr, pc
	bx	r3
	bl	updateLocations
	ldr	r6, .L44+12
	ldr	r7, .L44+16
	ldr	r9, .L44
	ldr	sl, .L44+20
	mov	r5, r6
	mov	r4, #0
.L38:
	add	fp, r4, r4, asl #2
	add	fp, r4, fp, asl #1
	add	fp, r6, fp, asl #2
	mov	r0, fp
	mov	lr, pc
	bx	r7
	ldr	r3, [r5, #36]
	cmp	r3, #0
	add	r4, r4, #1
	bne	.L43
.L37:
	cmp	r4, #3
	add	r5, r5, #44
	bne	.L38
	ldr	r3, [r8, #56]
	cmp	r3, #0
	ldr	r4, .L44
	beq	.L34
	ldr	r5, .L44+24
	ldr	r1, .L44+12
	mov	r0, r4
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r1, .L44+28
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r1, .L44+32
	mov	lr, pc
	bx	r5
	mov	r3, #0
	str	r3, [r4, #56]
.L34:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L43:
	ldr	r0, .L44
	mov	r1, fp
	mov	lr, pc
	bx	sl
	cmp	r0, #0
	ldrne	r3, [r9, #76]
	subne	r3, r3, #1
	strne	r3, [r9, #76]
	b	.L37
.L42:
	bl	goToWin
	b	.L36
.L41:
	bl	goToDeath
	b	.L35
.L45:
	.align	2
.L44:
	.word	player
	.word	enemiesLeft
	.word	updatePlayer
	.word	enemy
	.word	updateEnemy
	.word	playerEnemyCollision
	.word	attackCheck
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
	ldr	r2, .L49
	mov	r3, #0
.L47:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L47
	bx	lr
.L50:
	.align	2
.L49:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r2, #1264
	mov	r3, #67108864
	sub	r2, r2, #1
	mov	r1, #128	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L53+8
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	ip, [ip, #0]
	mov	sl, r0
	mov	r5, #0
	mov	r4, #67108864
	add	ip, ip, #12
	mov	r6, r2
	mov	r8, r1
	add	r2, r4, #160
	add	fp, r4, #256
	mov	r9, r3
	mov	r0, #1
	mov	r3, #910163968
	mov	r1, sl
	str	r5, [ip, #8]
	ldr	ip, .L53+12
	mov	lr, pc
	bx	ip
	mov	r1, r6
	ldr	r3, .L53+16
	mov	r0, #16777216
	strh	r5, [fp, #2]	@ movhi
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L53+20
	mov	r3, r3, lsr #16
	strh	r3, [fp, #0]	@ movhi
	mov	r3, #1
	str	r3, [r4, #12]
	mov	r3, #128	@ movhi
	strh	r3, [fp, #2]	@ movhi
	ldr	r7, .L53+24
	mov	r0, r8
	str	r8, [r4, #4]
	str	r9, [r4, #16]
	str	sl, [r4, #0]
	str	r6, [r4, #8]
	mov	lr, pc
	bx	r7
	adr	r3, .L53
	ldmia	r3, {r2-r3}
	ldr	ip, .L53+28
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L53+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L53+36
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L54:
	.align	3
.L53:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #7424
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r2, #4864	@ movhi
	mov	r6, #67108864
	add	r3, r3, #4
	mov	r5, #100663296
	mov	r7, #-2147483648
	ldr	r0, .L56
	strh	r2, [r6, #0]	@ movhi
	strh	r3, [r6, #10]	@ movhi
	ldr	r3, .L56+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L56+8
	add	r8, r7, #1024
	mov	r0, #3
	ldr	r1, .L56+12
	add	r2, r5, #16384
	add	r3, r7, #96
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L56+16
	add	r2, r5, #59392
	mov	r3, r8
	mov	lr, pc
	bx	r4
	mov	ip, #7680	@ movhi
	strh	ip, [r6, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L56+20
	mov	r2, r5
	add	r3, r7, #208
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L56+24
	add	r2, r5, #61440
	mov	r3, r8
	mov	lr, pc
	bx	r4
	mov	r1, #2424832
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, #1
	ldr	r0, .L56+28
	add	r1, r1, #4160
	bl	playSoundA
	ldr	r2, .L56+32
	ldr	r3, .L56+36
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	gameBGPal
	.word	loadPalette
	.word	DMANow
	.word	gameBGTiles
	.word	gameBGMap
	.word	gameUITiles
	.word	gameUIMap
	.word	gameMusic
	.word	updateGame
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L59+8
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	ip, [ip, #0]
	mov	sl, r0
	mov	r5, #0
	mov	r4, #67108864
	add	ip, ip, #24
	mov	r6, r2
	mov	r8, r1
	add	r2, r4, #164
	add	fp, r4, #256
	mov	r9, r3
	mov	r0, #2
	mov	r3, #910163968
	mov	r1, sl
	str	r5, [ip, #8]
	ldr	ip, .L59+12
	mov	lr, pc
	bx	ip
	mov	r1, r6
	ldr	r3, .L59+16
	mov	r0, #16777216
	strh	r5, [fp, #6]	@ movhi
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L59+20
	mov	r3, r3, lsr #16
	strh	r3, [fp, #4]	@ movhi
	mov	r3, #1
	str	r3, [r4, #12]
	mov	r3, #128	@ movhi
	strh	r3, [fp, #6]	@ movhi
	ldr	r7, .L59+24
	mov	r0, r8
	str	r8, [r4, #4]
	str	r9, [r4, #16]
	str	sl, [r4, #0]
	str	r6, [r4, #8]
	mov	lr, pc
	bx	r7
	adr	r3, .L59
	ldmia	r3, {r2-r3}
	ldr	ip, .L59+28
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L59+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L59+36
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L60:
	.align	3
.L59:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #67108864
	add	r3, r3, #512
	ldrh	r2, [r3, #2]
	tst	r2, #1
	mov	r2, #0	@ movhi
	strh	r2, [r3, #8]	@ movhi
	beq	.L62
	ldr	r2, .L70
	ldr	r3, [r2, #12]
	cmp	r3, #0
	beq	.L63
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #20]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r2, #28]
	ble	.L63
	ldr	r3, [r2, #16]
	cmp	r3, #0
	bne	.L67
	ldr	r1, .L70+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #12
	add	r1, r1, #256
	str	r3, [r0, #8]
	str	r3, [r2, #12]
	strh	r3, [r1, #2]	@ movhi
.L63:
	ldr	r2, .L70+8
	ldr	r3, [r2, #12]
	cmp	r3, #0
	bne	.L68
.L65:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L62:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r3, lr}
	bx	lr
.L68:
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #20]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r2, #28]
	ble	.L65
	ldr	r3, [r2, #16]
	cmp	r3, #0
	bne	.L69
	ldr	r1, .L70+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #24
	add	r1, r1, #256
	str	r3, [r0, #8]
	str	r3, [r2, #12]
	strh	r3, [r1, #6]	@ movhi
	b	.L65
.L67:
	ldmia	r2, {r0, r1, r2}	@ phole ldm
	bl	playSoundA
	b	.L63
.L69:
	ldmia	r2, {r0, r1, r2}	@ phole ldm
	bl	playSoundB
	b	.L65
.L71:
	.align	2
.L70:
	.word	soundA
	.word	dma
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L73
	mov	r2, #0
	str	r2, [r1, #12]
	mov	r3, #67108864
	ldr	r1, .L73+4
	add	r3, r3, #256
	str	r2, [r1, #12]
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	bx	lr
.L74:
	.align	2
.L73:
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L76
	mov	r1, #1
	str	r1, [r0, #12]
	mov	r3, #67108864
	ldr	r0, .L76+4
	add	r3, r3, #256
	mov	r2, #128
	str	r1, [r0, #12]
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	bx	lr
.L77:
	.align	2
.L76:
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L79
	ldr	r1, [r3, #0]
	mov	r3, #0
	add	r0, r1, #12
	str	r3, [r0, #8]
	mov	r2, #67108864
	ldr	r0, .L79+4
	add	r2, r2, #256
	add	r1, r1, #24
	str	r3, [r0, #12]
	strh	r3, [r2, #2]	@ movhi
	str	r3, [r1, #8]
	ldr	r1, .L79+8
	str	r3, [r1, #12]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L80:
	.align	2
.L79:
	.word	dma
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	add	r3, r2, #512
	str	r4, [sp, #-4]!
	ldrh	r0, [r2, #4]
	ldrh	ip, [r3, #0]
	mov	r1, #50331648
	ldr	r4, .L82
	add	r1, r1, #28672
	orr	ip, ip, #1
	orr	r0, r0, #8
	str	r4, [r1, #4092]
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L83:
	.align	2
.L82:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	enemiesLeft,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.comm	player,84,4
	.comm	enemy,132,4
	.comm	soundA,32,4
	.comm	soundB,32,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
