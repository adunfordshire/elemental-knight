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
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L2
	ldr	r1, .L2+4
	mov	r0, r4
	ldr	r3, .L2+8
	mov	lr, pc
	bx	r3
	mov	r0, r4
	mov	r2, #3
	ldr	r1, .L2+12
	ldr	r3, .L2+16
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r1, .L2+20
	ldr	r3, .L2+24
	mov	lr, pc
	bx	r3
	mov	r0, #3
	mov	r1, r4
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L2+28
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	shadowOAM
	.word	player
	.word	drawPlayer
	.word	enemy
	.word	drawEnemy
	.word	life
	.word	drawLife
	.word	DMANow
	.size	draw, .-draw
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
	ldr	r0, .L5
	mov	r5, #-2147483648
	ldr	r3, .L5+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L5+8
	mov	r0, #3
	ldr	r1, .L5+12
	mov	r2, #100663296
	add	r3, r5, #3712
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	add	r3, r5, #1024
	mov	r0, #3
	ldr	r1, .L5+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L5+20
	ldr	r3, .L5+24
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L6:
	.align	2
.L5:
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
	ldr	r0, .L8
	mov	r6, #-2147483648
	strh	r3, [r4, #8]	@ movhi
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L8+8
	mov	r0, #3
	ldr	r1, .L8+12
	mov	r2, #100663296
	add	r3, r6, #1392
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	add	r2, r2, #61440
	add	r3, r6, #1024
	mov	r0, #3
	ldr	r1, .L8+16
	mov	lr, pc
	bx	r5
	ldr	r2, .L8+20
	mov	r3, #0
	strh	r3, [r4, #16]	@ movhi
	str	r3, [r2, #0]
	ldr	r2, .L8+24
	str	r3, [r2, #0]
	strh	r3, [r4, #18]	@ movhi
	strh	r3, [r4, #80]	@ movhi
	strh	r3, [r4, #82]	@ movhi
	ldr	r2, .L8+28
	ldr	r3, .L8+32
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	pauseBGPal
	.word	loadPalette
	.word	DMANow
	.word	pauseBGTiles
	.word	pauseBGMap
	.word	v0Off
	.word	h0Off
	.word	updatePause
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	updateLocations
	.type	updateLocations, %function
updateLocations:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L14
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r2, [r3, #0]
	ldr	r3, .L14+4
	ldr	r0, .L14+8
	ldr	r1, [r3, #0]
	ldr	r6, [r0, #0]
	ldr	r4, [r0, #4]
	mov	r7, r2, asl #16
	mov	r5, r1, asl #16
	ldr	r3, .L14+12
	mov	ip, #67108864
	rsb	r4, r2, r4
	mov	r7, r7, lsr #16
	mov	r5, r5, lsr #16
	rsb	r6, r1, r6
	strh	r7, [ip, #20]	@ movhi
	str	r6, [r0, #8]
	strh	r5, [ip, #22]	@ movhi
	str	r4, [r0, #12]
	add	r4, r3, #168
.L11:
	ldr	ip, [r3, #0]
	ldr	r0, [r3, #4]
	rsb	ip, r1, ip
	rsb	r0, r2, r0
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	add	r3, r3, #56
	cmp	r3, r4
	bne	.L11
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L15:
	.align	2
.L14:
	.word	hOff
	.word	vOff
	.word	player
	.word	enemy
	.size	updateLocations, .-updateLocations
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L19
	mov	r3, #0
.L17:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L17
	bx	lr
.L20:
	.align	2
.L19:
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
	ldr	ip, .L23+8
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
	ldr	ip, .L23+12
	mov	lr, pc
	bx	ip
	mov	r1, r6
	ldr	r3, .L23+16
	mov	r0, #16777216
	strh	r5, [fp, #2]	@ movhi
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L23+20
	mov	r3, r3, lsr #16
	strh	r3, [fp, #0]	@ movhi
	mov	r3, #1
	str	r3, [r4, #12]
	mov	r3, #128	@ movhi
	strh	r3, [fp, #2]	@ movhi
	ldr	r7, .L23+24
	mov	r0, r8
	str	r8, [r4, #4]
	str	r9, [r4, #16]
	str	sl, [r4, #0]
	str	r6, [r4, #8]
	mov	lr, pc
	bx	r7
	adr	r3, .L23
	ldmia	r3, {r2-r3}
	ldr	ip, .L23+28
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L23+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L23+36
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L24:
	.align	3
.L23:
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
	ldr	r0, .L26
	mov	r6, #-2147483648
	strh	r3, [r4, #8]	@ movhi
	ldr	r3, .L26+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L26+8
	mov	r0, #3
	ldr	r1, .L26+12
	mov	r2, #100663296
	add	r3, r6, #1280
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L26+16
	add	r2, r2, #61440
	add	r3, r6, #1024
	mov	lr, pc
	bx	r5
	ldr	lr, .L26+20
	mov	ip, #0
	strh	ip, [r4, #16]	@ movhi
	str	ip, [lr, #0]
	ldr	lr, .L26+24
	mov	r1, #42752
	mov	r2, #11008
	str	ip, [lr, #0]
	add	r2, r2, #17
	mov	r3, ip
	ldr	r0, .L26+28
	add	r1, r1, #172
	strh	ip, [r4, #18]	@ movhi
	strh	ip, [r4, #80]	@ movhi
	strh	ip, [r4, #82]	@ movhi
	bl	playSoundA
	ldr	r2, .L26+32
	ldr	r3, .L26+36
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	winBGPal
	.word	loadPalette
	.word	DMANow
	.word	winBGTiles
	.word	winBGMap
	.word	v0Off
	.word	h0Off
	.word	winSong
	.word	updateWin
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L29+8
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
	ldr	ip, .L29+12
	mov	lr, pc
	bx	ip
	mov	r1, r6
	ldr	r3, .L29+16
	mov	r0, #16777216
	strh	r5, [fp, #6]	@ movhi
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L29+20
	mov	r3, r3, lsr #16
	strh	r3, [fp, #4]	@ movhi
	mov	r3, #1
	str	r3, [r4, #12]
	mov	r3, #128	@ movhi
	strh	r3, [fp, #6]	@ movhi
	ldr	r7, .L29+24
	mov	r0, r8
	str	r8, [r4, #4]
	str	r9, [r4, #16]
	str	sl, [r4, #0]
	str	r6, [r4, #8]
	mov	lr, pc
	bx	r7
	adr	r3, .L29
	ldmia	r3, {r2-r3}
	ldr	ip, .L29+28
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L29+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L29+36
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L30:
	.align	3
.L29:
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
	beq	.L32
	ldr	r2, .L40
	ldr	r3, [r2, #12]
	cmp	r3, #0
	beq	.L33
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #20]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r2, #28]
	ble	.L33
	ldr	r3, [r2, #16]
	cmp	r3, #0
	bne	.L37
	ldr	r1, .L40+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #12
	add	r1, r1, #256
	str	r3, [r0, #8]
	str	r3, [r2, #12]
	strh	r3, [r1, #2]	@ movhi
.L33:
	ldr	r2, .L40+8
	ldr	r3, [r2, #12]
	cmp	r3, #0
	bne	.L38
.L35:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L32:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r3, lr}
	bx	lr
.L38:
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #20]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r2, #28]
	ble	.L35
	ldr	r3, [r2, #16]
	cmp	r3, #0
	bne	.L39
	ldr	r1, .L40+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #24
	add	r1, r1, #256
	str	r3, [r0, #8]
	str	r3, [r2, #12]
	strh	r3, [r1, #6]	@ movhi
	b	.L35
.L37:
	ldmia	r2, {r0, r1, r2}	@ phole ldm
	bl	playSoundA
	b	.L33
.L39:
	ldmia	r2, {r0, r1, r2}	@ phole ldm
	bl	playSoundB
	b	.L35
.L41:
	.align	2
.L40:
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
	ldr	r1, .L43
	mov	r2, #0
	str	r2, [r1, #12]
	mov	r3, #67108864
	ldr	r1, .L43+4
	add	r3, r3, #256
	str	r2, [r1, #12]
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	bx	lr
.L44:
	.align	2
.L43:
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
	ldr	r0, .L46
	mov	r1, #1
	str	r1, [r0, #12]
	mov	r3, #67108864
	ldr	r0, .L46+4
	add	r3, r3, #256
	mov	r2, #128
	str	r1, [r0, #12]
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	bx	lr
.L47:
	.align	2
.L46:
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
	ldr	r3, .L49
	ldr	r1, [r3, #0]
	mov	r3, #0
	add	r0, r1, #12
	str	r3, [r0, #8]
	mov	r2, #67108864
	ldr	r0, .L49+4
	add	r2, r2, #256
	add	r1, r1, #24
	str	r3, [r0, #12]
	strh	r3, [r2, #2]	@ movhi
	str	r3, [r1, #8]
	ldr	r1, .L49+8
	str	r3, [r1, #12]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L50:
	.align	2
.L49:
	.word	dma
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.align	2
	.global	goToDeath
	.type	goToDeath, %function
goToDeath:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r3, #256	@ movhi
	mov	r4, #67108864
	strh	r3, [r4, #0]	@ movhi
	mov	r3, #7680	@ movhi
	ldr	r0, .L52
	mov	r6, #-2147483648
	strh	r3, [r4, #8]	@ movhi
	ldr	r3, .L52+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L52+8
	mov	r0, #3
	ldr	r1, .L52+12
	mov	r2, #100663296
	add	r3, r6, #1472
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L52+16
	add	r2, r2, #61440
	add	r3, r6, #1024
	mov	lr, pc
	bx	r5
	ldr	r2, .L52+20
	mov	r3, #0
	strh	r3, [r4, #16]	@ movhi
	str	r3, [r2, #0]
	ldr	r2, .L52+24
	str	r3, [r2, #0]
	strh	r3, [r4, #18]	@ movhi
	strh	r3, [r4, #80]	@ movhi
	strh	r3, [r4, #82]	@ movhi
	bl	stopSound
	ldr	r2, .L52+28
	ldr	r3, .L52+32
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	loseBGPal
	.word	loadPalette
	.word	DMANow
	.word	loseBGTiles
	.word	loseBGMap
	.word	v0Off
	.word	h0Off
	.word	updateDeath
	.word	state
	.size	goToDeath, .-goToDeath
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r7, .L66
	ldr	r3, .L66+4
	mov	r0, r7
	ldr	ip, [r3, #0]
	mov	lr, pc
	bx	ip
	ldr	r3, [r7, #80]
	cmp	r3, #0
	ble	.L62
.L55:
	ldr	r3, .L66+8
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L63
.L56:
	ldr	r0, .L66
	ldr	r3, .L66+12
	mov	lr, pc
	bx	r3
	bl	updateLocations
	ldr	r6, .L66+16
	ldr	r8, .L66+20
	ldr	sl, .L66+24
	ldr	r9, .L66+28
	mov	r5, r6
	mov	r4, #0
.L58:
	rsb	fp, r4, r4, asl #3
	add	fp, r6, fp, asl #3
	mov	r0, fp
	mov	lr, pc
	bx	r8
	ldr	r3, [r5, #40]
	cmp	r3, #0
	add	r4, r4, #1
	bne	.L64
.L57:
	cmp	r4, #3
	add	r5, r5, #56
	bne	.L58
	ldr	r3, [r7, #60]
	cmp	r3, #0
	ldr	r4, .L66
	beq	.L59
	ldr	r5, .L66+32
	ldr	r1, .L66+16
	mov	r0, r4
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r1, .L66+36
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r1, .L66+40
	mov	lr, pc
	bx	r5
	mov	r3, #0
	str	r3, [r4, #60]
.L59:
	ldr	r3, .L66+44
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L65
.L60:
	ldr	r1, .L66+48
	ldr	r3, [r1, #0]
	ldr	r0, .L66+52
	sub	r3, r3, #1
	smull	r2, r0, r3, r0
	ldr	r2, .L66+56
	sub	r0, r0, r3, asr #31
	ldrh	ip, [r2, #0]
	mov	r0, r0, asl #16
	mov	r2, #67108864
	mov	r0, r0, lsr #16
	strh	ip, [r2, #16]	@ movhi
	str	r3, [r1, #0]
	strh	r0, [r2, #18]	@ movhi
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L64:
	mov	r1, fp
	ldr	r0, .L66
	mov	lr, pc
	bx	sl
	cmp	r0, #0
	beq	.L57
	ldr	r0, .L66
	ldr	r1, .L66+60
	mov	lr, pc
	bx	r9
	b	.L57
.L63:
	bl	goToWin
	b	.L56
.L65:
	ldr	r3, .L66+64
	ldr	r0, .L66+16
	mov	lr, pc
	bx	r3
	ldr	r3, [r6, #40]
	cmp	r3, #0
	bne	.L60
	bl	goToWin
	b	.L60
.L62:
	bl	goToDeath
	b	.L55
.L67:
	.align	2
.L66:
	.word	player
	.word	room
	.word	enemiesLeft
	.word	updatePlayer
	.word	enemy
	.word	updateEnemy
	.word	playerEnemyCollision
	.word	playerHit
	.word	attackCheck
	.word	enemy+56
	.word	enemy+112
	.word	currRoom
	.word	v0Off
	.word	1431655766
	.word	h0Off
	.word	life
	.word	moveBoss
	.size	update, .-update
	.align	2
	.global	init
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	add	r1, r1, #512
	stmfd	sp!, {r4, r5, r6, lr}
	ldrh	r2, [r1, #0]
	ldr	r0, .L71
	mov	r3, #50331648
	add	r3, r3, #28672
	orr	r2, r2, #1
	str	r0, [r3, #4092]
	strh	r2, [r1, #0]	@ movhi
	mov	ip, #67108864
	ldrh	r0, [ip, #4]
	orr	r0, r0, #8
	strh	r0, [ip, #4]	@ movhi
	mov	r6, #128	@ movhi
	mov	r0, #1	@ movhi
	mvn	lr, #1264
	strh	r0, [r1, #8]	@ movhi
	sub	lr, lr, #1
	strh	r6, [ip, #132]	@ movhi
	mov	r6, #0	@ movhi
	strh	lr, [ip, #130]	@ movhi
	strh	r6, [ip, #128]	@ movhi
	ldr	ip, .L71+4
	mov	r5, #3
	mov	r2, #100663296
	mov	r3, #-2147483648
	ldr	r1, .L71+8
	add	r2, r2, #65536
	add	r3, r3, #16384
	ldr	r4, .L71+12
	mov	r0, r5
	str	r5, [ip, #0]
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, r5
	ldr	r1, .L71+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L71+20
	mov	r3, #0
.L69:
	mov	r0, #512	@ movhi
	strh	r0, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L69
	mov	r0, #3
	ldr	r1, .L71+20
	mov	r2, #117440512
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, lr}
	b	stopSound
.L72:
	.align	2
.L71:
	.word	interruptHandler
	.word	enemiesLeft
	.word	spritesTiles
	.word	DMANow
	.word	spritesPal
	.word	shadowOAM
	.size	init, .-init
	.align	2
	.global	goToSplash
	.type	goToSplash, %function
goToSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	bl	init
	mov	r4, #67108864
	mov	r3, #256	@ movhi
	strh	r3, [r4, #0]	@ movhi
	mov	r3, #7680	@ movhi
	ldr	r0, .L74
	strh	r3, [r4, #8]	@ movhi
	ldr	r3, .L74+4
	mov	lr, pc
	bx	r3
	mov	r3, #4544
	mov	r0, #3
	ldr	r1, .L74+8
	mov	r2, #100663296
	add	r3, r3, #-2147483600
	ldr	r5, .L74+12
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r3, #-2147483648
	mov	r0, #3
	ldr	r1, .L74+16
	add	r2, r2, #61440
	add	r3, r3, #1024
	mov	lr, pc
	bx	r5
	ldr	ip, .L74+20
	mov	r3, #0
	strh	r3, [r4, #20]	@ movhi
	ldr	r2, .L74+24
	str	r3, [ip, #0]
	ldr	ip, .L74+28
	mov	r0, #2
	strh	r3, [r4, #22]	@ movhi
	mov	r1, #1
	str	r3, [ip, #0]
	strh	r3, [r4, #80]	@ movhi
	strh	r3, [r4, #82]	@ movhi
	mov	ip, #16
	str	r0, [r2, #20]
	str	r0, [r2, #40]
	str	r0, [r2, #60]
	mov	r0, #32
	str	r3, [r2, #16]
	str	r3, [r2, #24]
	str	r1, [r2, #36]
	str	ip, [r2, #44]
	str	r1, [r2, #56]
	str	r0, [r2, #64]
	str	r1, [r2, #76]
	ldr	r2, .L74+32
	str	r3, [r2, #96]
	ldr	r2, .L74+36
	str	r3, [r2, #0]
	ldr	r2, .L74+40
	ldr	r3, .L74+44
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L75:
	.align	2
.L74:
	.word	splashBGPal
	.word	loadPalette
	.word	splashBGTiles
	.word	DMANow
	.word	splashBGMap
	.word	vOff
	.word	life
	.word	hOff
	.word	player
	.word	currRoom
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
	ldr	r7, .L78
	ldr	r4, .L78+4
	ldr	r6, .L78+8
	mov	r5, #67108864
.L77:
	ldr	r2, [r4, #0]
	ldr	r3, [r5, #304]
	str	r2, [r7, #0]
	str	r3, [r4, #0]
	ldr	ip, [r6, #0]
	mov	lr, pc
	bx	ip
	b	.L77
.L79:
	.align	2
.L78:
	.word	oldButtons
	.word	buttons
	.word	state
	.size	main, .-main
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
	ldr	r4, .L81
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
.L82:
	.align	2
.L81:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	enterPlacement
	.type	enterPlacement, %function
enterPlacement:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, [r0, #96]
	cmp	r3, #0
	beq	.L90
	cmp	r3, #1
	beq	.L91
	cmp	r3, #2
	beq	.L92
	cmp	r3, #3
	bne	.L83
	add	r1, r0, #24
	ldmia	r1, {r1, r2}	@ phole ldm
	rsb	r2, r2, #220
	add	ip, r2, #8
	str	r2, [r0, #4]
	ldr	r2, .L93
	rsb	r1, r1, #80
	mov	r3, #0
	str	r1, [r0, #0]
	str	r3, [r2, #0]
	ldr	r2, .L93+4
	add	r4, r1, #8
	str	r4, [r0, #16]
	str	ip, [r0, #20]
	str	r3, [r2, #0]
.L83:
	ldmfd	sp!, {r4}
	bx	lr
.L90:
	ldr	r2, [r0, #24]
	rsb	r2, r2, #140
	add	r1, r2, #8
	str	r2, [r0, #0]
	mov	r2, #112
	str	r2, [r0, #4]
	str	r1, [r0, #16]
.L88:
	mov	r2, #120
.L89:
	str	r2, [r0, #20]
	ldr	r2, .L93
	str	r3, [r2, #0]
	ldr	r2, .L93+4
	str	r3, [r2, #0]
	b	.L83
.L91:
	mov	r2, #112
	mov	r3, #0
	str	r2, [r0, #4]
	mov	r2, #8
	str	r3, [r0, #0]
	str	r2, [r0, #16]
	b	.L88
.L92:
	ldr	r2, [r0, #24]
	rsb	r2, r2, #80
	add	r1, r2, #8
	mov	r3, #0
	stmia	r0, {r2, r3}	@ phole stm
	str	r1, [r0, #16]
	mov	r2, #8
	b	.L89
.L94:
	.align	2
.L93:
	.word	vOff
	.word	hOff
	.size	enterPlacement, .-enterPlacement
	.align	2
	.global	goToRoom
	.type	goToRoom, %function
goToRoom:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	subs	r4, r0, #0
	beq	.L105
	cmp	r4, #1
	beq	.L106
	cmp	r4, #2
	beq	.L107
	cmp	r4, #3
	beq	.L108
	cmp	r4, #4
	beq	.L109
	cmp	r4, #5
	beq	.L110
.L95:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L105:
	mov	r3, #7424
	mov	r5, #67108864
	mov	r1, #4864	@ movhi
	add	r3, r3, #6
	ldr	r0, .L112
	strh	r1, [r5, #0]	@ movhi
	strh	r3, [r5, #10]	@ movhi
	ldr	r3, .L112+4
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r3, #-2147483648
	mov	r0, #3
	ldr	r1, .L112+8
	add	r2, r2, #16384
	add	r3, r3, #160
	ldr	r6, .L112+12
	mov	lr, pc
	bx	r6
	mov	r2, #100663296
	mov	r3, #-2147483648
	mov	r0, #3
	add	r3, r3, #1024
	ldr	r1, .L112+16
	add	r2, r2, #59392
	mov	lr, pc
	bx	r6
	ldr	r0, .L112+20
	ldr	r3, [r0, #96]
	cmp	r3, #1
	strh	r4, [r5, #16]	@ movhi
	strh	r4, [r5, #18]	@ movhi
	beq	.L111
	mov	r2, #16
	str	r2, [r0, #28]
	str	r2, [r0, #24]
	mov	r2, #232
	ldr	r1, .L112+24
	str	r2, [r0, #0]
	mov	r2, #112
	mov	ip, #96
	str	r2, [r0, #4]
	mov	r2, #240
	str	ip, [r1, #0]
	str	r2, [r0, #16]
	ldr	r1, .L112+28
	mov	r2, #120
	mov	r3, #1
	mov	ip, #8
	str	r2, [r0, #20]
	mov	r2, #3
	str	ip, [r1, #0]
	str	r3, [r0, #32]
	str	r4, [r0, #92]
	str	r2, [r0, #80]
	str	r3, [r0, #48]
	str	r4, [r0, #84]
	str	r4, [r0, #96]
	str	r4, [r0, #88]
	str	r4, [r0, #52]
.L98:
	ldr	r3, .L112+32
	mov	r4, #116
	mov	ip, #60
	str	r4, [r3, #4]
	mov	r4, #2
	mov	r2, #0
	mov	r1, #1
	mov	r0, #16
	str	ip, [r3, #0]
	str	r4, [r3, #44]
	str	ip, [r3, #56]
	str	ip, [r3, #112]
	mov	r4, #200
	mov	ip, #50
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #100]
	str	r2, [r3, #104]
	str	r2, [r3, #108]
	str	r2, [r3, #160]
	str	r2, [r3, #164]
	str	r0, [r3, #20]
	str	r0, [r3, #16]
	str	r1, [r3, #36]
	str	r1, [r3, #40]
	str	r4, [r3, #60]
	str	r0, [r3, #76]
	str	r0, [r3, #72]
	str	r1, [r3, #92]
	str	r1, [r3, #96]
	str	ip, [r3, #116]
	str	r0, [r3, #132]
	str	r0, [r3, #128]
	str	r1, [r3, #156]
	str	r1, [r3, #148]
	str	r1, [r3, #152]
	ldr	r3, .L112+36
	str	r2, [r3, #0]
	ldr	r2, .L112+40
	ldr	r3, .L112+44
	str	r2, [r3, #0]
	ldr	r2, .L112+48
.L104:
	ldr	r3, .L112+52
	str	r2, [r3, #0]
	ldr	r2, .L112+56
	ldr	r3, .L112+60
	str	r2, [r3, #0]
	b	.L95
.L110:
	mov	r3, #7424
	mov	r2, #67108864
	mov	r1, #4864	@ movhi
	add	r3, r3, #6
	strh	r1, [r2, #0]	@ movhi
	strh	r3, [r2, #10]	@ movhi
	ldr	r0, .L112+64
	ldr	r3, .L112+4
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r3, #-2147483648
	mov	r0, #3
	ldr	r1, .L112+68
	add	r2, r2, #16384
	add	r3, r3, #144
	ldr	r5, .L112+12
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r3, #-2147483648
	add	r2, r2, #59392
	add	r3, r3, #1024
	mov	r0, #3
	ldr	r1, .L112+72
	mov	lr, pc
	bx	r5
	ldr	r0, .L112+20
	bl	enterPlacement
	ldr	r3, .L112+36
	ldr	r2, .L112+76
	str	r4, [r3, #0]
	ldr	r3, .L112+44
	str	r2, [r3, #0]
	ldr	r2, .L112+80
	b	.L104
.L106:
	mov	r3, #7424
	mov	r5, #67108864
	mov	r2, #4864	@ movhi
	add	r3, r3, #6
	ldr	r0, .L112+84
	strh	r2, [r5, #0]	@ movhi
	strh	r3, [r5, #10]	@ movhi
	ldr	r3, .L112+4
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r3, #-2147483648
	ldr	r6, .L112+12
	mov	r0, #3
	ldr	r1, .L112+88
	add	r2, r2, #16384
	add	r3, r3, #64
	mov	lr, pc
	bx	r6
	mov	r2, #100663296
	mov	r3, #-2147483648
	ldr	r1, .L112+92
	add	r2, r2, #59392
	mov	r0, #3
	add	r3, r3, #1024
	mov	lr, pc
	bx	r6
	ldr	r3, .L112+24
	mov	r6, #0
	strh	r6, [r5, #16]	@ movhi
	str	r6, [r3, #0]
	ldr	r3, .L112+28
	ldr	r0, .L112+20
	str	r6, [r3, #0]
	strh	r6, [r5, #18]	@ movhi
	bl	enterPlacement
	ldr	r3, .L112+32
	mov	r0, #30
	str	r0, [r3, #0]
	mov	r0, #112
	mov	r1, #60
	str	r0, [r3, #4]
	mov	r0, #2
	mov	r2, #16
	str	r0, [r3, #44]
	str	r1, [r3, #56]
	str	r1, [r3, #112]
	mov	r0, #200
	mov	r1, #50
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r2, [r3, #76]
	str	r2, [r3, #72]
	str	r2, [r3, #132]
	str	r2, [r3, #128]
	str	r4, [r3, #36]
	str	r4, [r3, #40]
	str	r6, [r3, #48]
	str	r6, [r3, #52]
	str	r0, [r3, #60]
	str	r6, [r3, #100]
	str	r4, [r3, #92]
	str	r4, [r3, #96]
	str	r6, [r3, #104]
	str	r6, [r3, #108]
	str	r1, [r3, #116]
	str	r4, [r3, #156]
	str	r4, [r3, #148]
	str	r4, [r3, #152]
	str	r6, [r3, #160]
	str	r6, [r3, #164]
	ldr	r3, .L112+36
	ldr	r2, .L112+96
	str	r4, [r3, #0]
	ldr	r3, .L112+44
	str	r2, [r3, #0]
	ldr	r2, .L112+100
	b	.L104
.L107:
	mov	r3, #7424
	mov	r2, #67108864
	mov	r1, #4864	@ movhi
	add	r3, r3, #6
	strh	r1, [r2, #0]	@ movhi
	strh	r3, [r2, #10]	@ movhi
	ldr	r0, .L112+104
	ldr	r3, .L112+4
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r3, #-2147483648
	mov	r0, #3
	ldr	r1, .L112+108
	add	r2, r2, #16384
	add	r3, r3, #64
	ldr	r5, .L112+12
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r3, #-2147483648
	add	r2, r2, #59392
	add	r3, r3, #1024
	mov	r0, #3
	ldr	r1, .L112+112
	mov	lr, pc
	bx	r5
	ldr	r0, .L112+20
	bl	enterPlacement
	ldr	r3, .L112+32
	mov	r2, #0
	str	r2, [r3, #40]
	str	r2, [r3, #52]
	str	r2, [r3, #96]
	str	r2, [r3, #108]
	str	r2, [r3, #152]
	str	r2, [r3, #164]
	ldr	r3, .L112+36
	ldr	r2, .L112+116
	str	r4, [r3, #0]
	ldr	r3, .L112+44
	str	r2, [r3, #0]
	ldr	r2, .L112+120
	b	.L104
.L108:
	mov	r3, #7424
	mov	r2, #67108864
	mov	r1, #4864	@ movhi
	add	r3, r3, #6
	strh	r1, [r2, #0]	@ movhi
	strh	r3, [r2, #10]	@ movhi
	ldr	r0, .L112+124
	ldr	r3, .L112+4
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r3, #-2147483648
	mov	r0, r4
	ldr	r1, .L112+128
	add	r2, r2, #16384
	add	r3, r3, #96
	ldr	r5, .L112+12
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r3, #-2147483648
	ldr	r1, .L112+132
	add	r2, r2, #59392
	add	r3, r3, #1024
	mov	r0, r4
	mov	lr, pc
	bx	r5
	ldr	r0, .L112+20
	bl	enterPlacement
	ldr	r3, .L112+32
	mov	ip, #30
	mov	r2, #0
	str	ip, [r3, #0]
	mov	r0, #32
	mov	r1, #1
	mov	ip, #112
	str	r2, [r3, #44]
	str	r2, [r3, #52]
	str	r2, [r3, #96]
	str	r2, [r3, #152]
	str	ip, [r3, #4]
	str	r0, [r3, #20]
	str	r0, [r3, #16]
	str	r1, [r3, #40]
	str	r4, [r3, #36]
	str	r1, [r3, #48]
	ldr	r3, .L112+36
	ldr	r2, .L112+136
	str	r4, [r3, #0]
	ldr	r3, .L112+44
	str	r2, [r3, #0]
	ldr	r2, .L112+140
	b	.L104
.L109:
	mov	r3, #7424
	mov	r2, #67108864
	mov	r1, #4864	@ movhi
	add	r3, r3, #6
	strh	r1, [r2, #0]	@ movhi
	strh	r3, [r2, #10]	@ movhi
	ldr	r0, .L112+144
	ldr	r3, .L112+4
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r3, #-2147483648
	mov	r0, #3
	ldr	r1, .L112+148
	add	r2, r2, #16384
	add	r3, r3, #64
	ldr	r5, .L112+12
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r3, #-2147483648
	add	r2, r2, #59392
	add	r3, r3, #1024
	mov	r0, #3
	ldr	r1, .L112+152
	mov	lr, pc
	bx	r5
	ldr	r0, .L112+20
	bl	enterPlacement
	ldr	r3, .L112+36
	ldr	r2, .L112+156
	str	r4, [r3, #0]
	ldr	r3, .L112+44
	str	r2, [r3, #0]
	ldr	r2, .L112+160
	b	.L104
.L111:
	ldr	r3, .L112+24
	str	r4, [r3, #0]
	ldr	r3, .L112+28
	str	r4, [r3, #0]
	bl	enterPlacement
	b	.L98
.L113:
	.align	2
.L112:
	.word	gameBGPal
	.word	loadPalette
	.word	gameBGTiles
	.word	DMANow
	.word	gameBGMap
	.word	player
	.word	vOff
	.word	hOff
	.word	enemy
	.word	currRoom
	.word	collisionMapBitmap
	.word	currCollisionMap
	.word	updateRoom0
	.word	room
	.word	updateGame
	.word	state
	.word	room5BGPal
	.word	room5BGTiles
	.word	room5BGMap
	.word	room5CMBitmap
	.word	updateRoom5
	.word	room1BGPal
	.word	room1BGTiles
	.word	room1BGMap
	.word	room1CMBitmap
	.word	updateRoom1
	.word	room2BGPal
	.word	room2BGTiles
	.word	room2BGMap
	.word	room2CMBitmap
	.word	updateRoom2
	.word	room3BGPal
	.word	room3BGTiles
	.word	room3BGMap
	.word	room3CMBitmap
	.word	updateRoom3
	.word	room4BGPal
	.word	room4BGTiles
	.word	room4BGMap
	.word	room4CMBitmap
	.word	updateRoom4
	.size	goToRoom, .-goToRoom
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	lr, #7424
	mov	r4, #67108864
	add	lr, lr, #6
	mov	ip, #7680
	add	ip, ip, #1
	strh	lr, [r4, #10]	@ movhi
	mov	r3, #11072
	mov	lr, #4864	@ movhi
	strh	lr, [r4, #0]	@ movhi
	strh	ip, [r4, #8]	@ movhi
	ldr	r5, .L115
	mov	r0, #3
	ldr	r1, .L115+4
	mov	r2, #100663296
	add	r3, r3, #-2147483632
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r3, #-2147483648
	mov	r0, #3
	ldr	r1, .L115+8
	add	r2, r2, #61440
	add	r3, r3, #1024
	mov	lr, pc
	bx	r5
	mov	lr, #12864
	mov	ip, #4096
	add	lr, lr, #1
	add	ip, ip, #2
	mov	r1, #2424832
	mov	r2, #11008
	ldr	r0, .L115+12
	add	r1, r1, #4160
	add	r2, r2, #17
	mov	r3, #1
	strh	lr, [r4, #80]	@ movhi
	strh	ip, [r4, #82]	@ movhi
	bl	playSoundA
	ldr	r3, .L115+16
	ldr	r0, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToRoom
.L116:
	.align	2
.L115:
	.word	DMANow
	.word	fogBGTiles
	.word	fogBGMap
	.word	gameMusic
	.word	currRoom
	.size	goToGame, .-goToGame
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	enemiesLeft,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	currRoom,4,4
	.comm	currCollisionMap,4,4
	.comm	state,4,4
	.comm	room,4,4
	.comm	shadowOAM,1024,4
	.comm	player,100,4
	.comm	enemy,168,4
	.comm	life,80,4
	.comm	soundA,32,4
	.comm	soundB,32,4
	.comm	h0Off,4,4
	.comm	v0Off,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
