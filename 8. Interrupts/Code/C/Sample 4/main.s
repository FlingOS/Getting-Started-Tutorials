	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	Delay
	.type	Delay, @function
Delay:
.LFB0:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	mov	DWORD PTR [ebp-4], 9437184
	nop
.L2:
	mov	eax, DWORD PTR [ebp-4]
	lea	edx, [eax-1]
	mov	DWORD PTR [ebp-4], edx
	test	eax, eax
	jne	.L2
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	Delay, .-Delay
	.globl	DisplayColourArea
	.type	DisplayColourArea, @function
DisplayColourArea:
.LFB1:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp+12]
	mov	BYTE PTR [ebp-20], dl
	mov	BYTE PTR [ebp-24], al
	movzx	eax, BYTE PTR [ebp-20]
	sal	eax, 4
	movzx	edx, BYTE PTR [ebp-24]
	and	edx, 15
	or	eax, edx
	mov	BYTE PTR [ebp-5], al
	mov	DWORD PTR [ebp-12], 753664
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [ebp-4], eax
	jmp	.L4
.L6:
	mov	eax, DWORD PTR [ebp-4]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-4], edx
	lea	edx, [eax+eax]
	mov	eax, DWORD PTR [ebp-12]
	add	eax, edx
	movzx	edx, BYTE PTR [ebp-5]
	sal	edx, 8
	mov	WORD PTR [eax], dx
.L4:
	cmp	DWORD PTR [ebp-4], 1999
	ja	.L3
	mov	eax, DWORD PTR [ebp+20]
	mov	edx, DWORD PTR [ebp+16]
	add	eax, edx
	cmp	eax, DWORD PTR [ebp-4]
	ja	.L6
.L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	DisplayColourArea, .-DisplayColourArea
	.globl	DisplayColour
	.type	DisplayColour, @function
DisplayColour:
.LFB2:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp+12]
	mov	BYTE PTR [ebp-4], dl
	mov	BYTE PTR [ebp-8], al
	movzx	edx, BYTE PTR [ebp-8]
	movzx	eax, BYTE PTR [ebp-4]
	mov	DWORD PTR [esp+12], 2000
	mov	DWORD PTR [esp+8], 0
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	DisplayColourArea
	call	Delay
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	DisplayColour, .-DisplayColour
	.globl	CommonInterruptHandler
	.type	CommonInterruptHandler, @function
CommonInterruptHandler:
.LFB3:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp+12], 1
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], 15
	mov	DWORD PTR [esp], 15
	call	DisplayColourArea
	call	Delay
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp+12], 1
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], 15
	mov	DWORD PTR [esp], 0
	call	DisplayColourArea
	cmp	DWORD PTR [ebp+8], 31
	jle	.L8
	cmp	DWORD PTR [ebp+8], 47
	jg	.L8
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp+12], 1
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], 15
	mov	DWORD PTR [esp], 4
	call	DisplayColourArea
	cmp	DWORD PTR [ebp+8], 39
	jle	.L10
/APP
/  359 "main.c" 1
	mov AL, 0x20
outb 0xA0, AL

/  0 "" 2
/NO_APP
.L10:
/APP
/  361 "main.c" 1
	mov AL, 0x20
outb 0x20, AL

/  0 "" 2
/NO_APP
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp+12], 1
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], 15
	mov	DWORD PTR [esp], 5
	call	DisplayColourArea
.L8:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	CommonInterruptHandler, .-CommonInterruptHandler
	.globl	IssueInterrupt
	.type	IssueInterrupt, @function
IssueInterrupt:
.LFB4:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 4
	mov	eax, DWORD PTR [ebp+8]
	mov	BYTE PTR [ebp-4], al
	movzx	eax, BYTE PTR [ebp-4]
	cmp	eax, 255
	ja	.L12
	mov	eax, DWORD PTR .L14[0+eax*4]
	jmp	eax
	.section	.rodata
	.align 4
	.align 4
.L14:
	.long	.L12
	.long	.L13
	.long	.L15
	.long	.L16
	.long	.L17
	.long	.L18
	.long	.L19
	.long	.L20
	.long	.L21
	.long	.L22
	.long	.L23
	.long	.L24
	.long	.L25
	.long	.L26
	.long	.L27
	.long	.L28
	.long	.L29
	.long	.L30
	.long	.L31
	.long	.L32
	.long	.L33
	.long	.L34
	.long	.L35
	.long	.L36
	.long	.L37
	.long	.L38
	.long	.L39
	.long	.L40
	.long	.L41
	.long	.L42
	.long	.L43
	.long	.L44
	.long	.L45
	.long	.L46
	.long	.L47
	.long	.L48
	.long	.L49
	.long	.L50
	.long	.L51
	.long	.L52
	.long	.L53
	.long	.L54
	.long	.L55
	.long	.L56
	.long	.L57
	.long	.L58
	.long	.L59
	.long	.L60
	.long	.L61
	.long	.L62
	.long	.L63
	.long	.L64
	.long	.L65
	.long	.L66
	.long	.L67
	.long	.L68
	.long	.L69
	.long	.L70
	.long	.L71
	.long	.L72
	.long	.L73
	.long	.L74
	.long	.L75
	.long	.L76
	.long	.L77
	.long	.L78
	.long	.L79
	.long	.L80
	.long	.L81
	.long	.L82
	.long	.L83
	.long	.L84
	.long	.L85
	.long	.L86
	.long	.L87
	.long	.L88
	.long	.L89
	.long	.L90
	.long	.L91
	.long	.L92
	.long	.L93
	.long	.L94
	.long	.L95
	.long	.L96
	.long	.L97
	.long	.L98
	.long	.L99
	.long	.L100
	.long	.L101
	.long	.L102
	.long	.L103
	.long	.L104
	.long	.L105
	.long	.L106
	.long	.L107
	.long	.L108
	.long	.L109
	.long	.L110
	.long	.L111
	.long	.L112
	.long	.L113
	.long	.L114
	.long	.L115
	.long	.L116
	.long	.L117
	.long	.L118
	.long	.L119
	.long	.L120
	.long	.L121
	.long	.L122
	.long	.L123
	.long	.L124
	.long	.L125
	.long	.L126
	.long	.L127
	.long	.L128
	.long	.L129
	.long	.L130
	.long	.L131
	.long	.L132
	.long	.L133
	.long	.L134
	.long	.L135
	.long	.L136
	.long	.L137
	.long	.L138
	.long	.L139
	.long	.L140
	.long	.L141
	.long	.L142
	.long	.L143
	.long	.L144
	.long	.L145
	.long	.L146
	.long	.L147
	.long	.L148
	.long	.L149
	.long	.L150
	.long	.L151
	.long	.L152
	.long	.L153
	.long	.L154
	.long	.L155
	.long	.L156
	.long	.L157
	.long	.L158
	.long	.L159
	.long	.L160
	.long	.L161
	.long	.L162
	.long	.L163
	.long	.L164
	.long	.L165
	.long	.L166
	.long	.L167
	.long	.L168
	.long	.L169
	.long	.L170
	.long	.L171
	.long	.L172
	.long	.L173
	.long	.L174
	.long	.L175
	.long	.L176
	.long	.L177
	.long	.L178
	.long	.L179
	.long	.L180
	.long	.L181
	.long	.L182
	.long	.L183
	.long	.L184
	.long	.L185
	.long	.L186
	.long	.L187
	.long	.L188
	.long	.L189
	.long	.L190
	.long	.L191
	.long	.L192
	.long	.L193
	.long	.L194
	.long	.L195
	.long	.L196
	.long	.L197
	.long	.L198
	.long	.L199
	.long	.L200
	.long	.L201
	.long	.L202
	.long	.L203
	.long	.L204
	.long	.L205
	.long	.L206
	.long	.L207
	.long	.L208
	.long	.L209
	.long	.L210
	.long	.L211
	.long	.L212
	.long	.L213
	.long	.L214
	.long	.L215
	.long	.L216
	.long	.L217
	.long	.L218
	.long	.L219
	.long	.L220
	.long	.L221
	.long	.L222
	.long	.L223
	.long	.L224
	.long	.L225
	.long	.L226
	.long	.L227
	.long	.L228
	.long	.L229
	.long	.L230
	.long	.L231
	.long	.L232
	.long	.L233
	.long	.L234
	.long	.L235
	.long	.L236
	.long	.L237
	.long	.L238
	.long	.L239
	.long	.L240
	.long	.L241
	.long	.L242
	.long	.L243
	.long	.L244
	.long	.L245
	.long	.L246
	.long	.L247
	.long	.L248
	.long	.L249
	.long	.L250
	.long	.L251
	.long	.L252
	.long	.L253
	.long	.L254
	.long	.L255
	.long	.L256
	.long	.L257
	.long	.L258
	.long	.L259
	.long	.L260
	.long	.L261
	.long	.L262
	.long	.L263
	.long	.L264
	.long	.L265
	.long	.L266
	.long	.L267
	.long	.L268
	.text
.L12:
/APP
/  371 "main.c" 1
	int 0

/  0 "" 2
/NO_APP
	jmp	.L11
.L13:
/APP
/  372 "main.c" 1
	int 1

/  0 "" 2
/NO_APP
	jmp	.L11
.L15:
/APP
/  373 "main.c" 1
	int 2

/  0 "" 2
/NO_APP
	jmp	.L11
.L16:
/APP
/  374 "main.c" 1
	int 3

/  0 "" 2
/NO_APP
	jmp	.L11
.L17:
/APP
/  375 "main.c" 1
	int 4

/  0 "" 2
/NO_APP
	jmp	.L11
.L18:
/APP
/  376 "main.c" 1
	int 5

/  0 "" 2
/NO_APP
	jmp	.L11
.L19:
/APP
/  377 "main.c" 1
	int 6

/  0 "" 2
/NO_APP
	jmp	.L11
.L20:
/APP
/  378 "main.c" 1
	int 7

/  0 "" 2
/NO_APP
	jmp	.L11
.L21:
/APP
/  379 "main.c" 1
	int 8

/  0 "" 2
/NO_APP
	jmp	.L11
.L22:
/APP
/  380 "main.c" 1
	int 9

/  0 "" 2
/NO_APP
	jmp	.L11
.L23:
/APP
/  381 "main.c" 1
	int 10

/  0 "" 2
/NO_APP
	jmp	.L11
.L24:
/APP
/  382 "main.c" 1
	int 11

/  0 "" 2
/NO_APP
	jmp	.L11
.L25:
/APP
/  383 "main.c" 1
	int 12

/  0 "" 2
/NO_APP
	jmp	.L11
.L26:
/APP
/  384 "main.c" 1
	int 13

/  0 "" 2
/NO_APP
	jmp	.L11
.L27:
/APP
/  385 "main.c" 1
	int 14

/  0 "" 2
/NO_APP
	jmp	.L11
.L28:
/APP
/  386 "main.c" 1
	int 15

/  0 "" 2
/NO_APP
	jmp	.L11
.L29:
/APP
/  387 "main.c" 1
	int 16

/  0 "" 2
/NO_APP
	jmp	.L11
.L30:
/APP
/  388 "main.c" 1
	int 17

/  0 "" 2
/NO_APP
	jmp	.L11
.L31:
/APP
/  389 "main.c" 1
	int 18

/  0 "" 2
/NO_APP
	jmp	.L11
.L32:
/APP
/  390 "main.c" 1
	int 19

/  0 "" 2
/NO_APP
	jmp	.L11
.L33:
/APP
/  391 "main.c" 1
	int 20

/  0 "" 2
/NO_APP
	jmp	.L11
.L34:
/APP
/  392 "main.c" 1
	int 21

/  0 "" 2
/NO_APP
	jmp	.L11
.L35:
/APP
/  393 "main.c" 1
	int 22

/  0 "" 2
/NO_APP
	jmp	.L11
.L36:
/APP
/  394 "main.c" 1
	int 23

/  0 "" 2
/NO_APP
	jmp	.L11
.L37:
/APP
/  395 "main.c" 1
	int 24

/  0 "" 2
/NO_APP
	jmp	.L11
.L38:
/APP
/  396 "main.c" 1
	int 25

/  0 "" 2
/NO_APP
	jmp	.L11
.L39:
/APP
/  397 "main.c" 1
	int 26

/  0 "" 2
/NO_APP
	jmp	.L11
.L40:
/APP
/  398 "main.c" 1
	int 27

/  0 "" 2
/NO_APP
	jmp	.L11
.L41:
/APP
/  399 "main.c" 1
	int 28

/  0 "" 2
/NO_APP
	jmp	.L11
.L42:
/APP
/  400 "main.c" 1
	int 29

/  0 "" 2
/NO_APP
	jmp	.L11
.L43:
/APP
/  401 "main.c" 1
	int 30

/  0 "" 2
/NO_APP
	jmp	.L11
.L44:
/APP
/  402 "main.c" 1
	int 31

/  0 "" 2
/NO_APP
	jmp	.L11
.L45:
/APP
/  403 "main.c" 1
	int 32

/  0 "" 2
/NO_APP
	jmp	.L11
.L46:
/APP
/  404 "main.c" 1
	int 33

/  0 "" 2
/NO_APP
	jmp	.L11
.L47:
/APP
/  405 "main.c" 1
	int 34

/  0 "" 2
/NO_APP
	jmp	.L11
.L48:
/APP
/  406 "main.c" 1
	int 35

/  0 "" 2
/NO_APP
	jmp	.L11
.L49:
/APP
/  407 "main.c" 1
	int 36

/  0 "" 2
/NO_APP
	jmp	.L11
.L50:
/APP
/  408 "main.c" 1
	int 37

/  0 "" 2
/NO_APP
	jmp	.L11
.L51:
/APP
/  409 "main.c" 1
	int 38

/  0 "" 2
/NO_APP
	jmp	.L11
.L52:
/APP
/  410 "main.c" 1
	int 39

/  0 "" 2
/NO_APP
	jmp	.L11
.L53:
/APP
/  411 "main.c" 1
	int 40

/  0 "" 2
/NO_APP
	jmp	.L11
.L54:
/APP
/  412 "main.c" 1
	int 41

/  0 "" 2
/NO_APP
	jmp	.L11
.L55:
/APP
/  413 "main.c" 1
	int 42

/  0 "" 2
/NO_APP
	jmp	.L11
.L56:
/APP
/  414 "main.c" 1
	int 43

/  0 "" 2
/NO_APP
	jmp	.L11
.L57:
/APP
/  415 "main.c" 1
	int 44

/  0 "" 2
/NO_APP
	jmp	.L11
.L58:
/APP
/  416 "main.c" 1
	int 45

/  0 "" 2
/NO_APP
	jmp	.L11
.L59:
/APP
/  417 "main.c" 1
	int 46

/  0 "" 2
/NO_APP
	jmp	.L11
.L60:
/APP
/  418 "main.c" 1
	int 47

/  0 "" 2
/NO_APP
	jmp	.L11
.L61:
/APP
/  419 "main.c" 1
	int 48

/  0 "" 2
/NO_APP
	jmp	.L11
.L62:
/APP
/  420 "main.c" 1
	int 49

/  0 "" 2
/NO_APP
	jmp	.L11
.L63:
/APP
/  421 "main.c" 1
	int 50

/  0 "" 2
/NO_APP
	jmp	.L11
.L64:
/APP
/  422 "main.c" 1
	int 51

/  0 "" 2
/NO_APP
	jmp	.L11
.L65:
/APP
/  423 "main.c" 1
	int 52

/  0 "" 2
/NO_APP
	jmp	.L11
.L66:
/APP
/  424 "main.c" 1
	int 53

/  0 "" 2
/NO_APP
	jmp	.L11
.L67:
/APP
/  425 "main.c" 1
	int 54

/  0 "" 2
/NO_APP
	jmp	.L11
.L68:
/APP
/  426 "main.c" 1
	int 55

/  0 "" 2
/NO_APP
	jmp	.L11
.L69:
/APP
/  427 "main.c" 1
	int 56

/  0 "" 2
/NO_APP
	jmp	.L11
.L70:
/APP
/  428 "main.c" 1
	int 57

/  0 "" 2
/NO_APP
	jmp	.L11
.L71:
/APP
/  429 "main.c" 1
	int 58

/  0 "" 2
/NO_APP
	jmp	.L11
.L72:
/APP
/  430 "main.c" 1
	int 59

/  0 "" 2
/NO_APP
	jmp	.L11
.L73:
/APP
/  431 "main.c" 1
	int 60

/  0 "" 2
/NO_APP
	jmp	.L11
.L74:
/APP
/  432 "main.c" 1
	int 61

/  0 "" 2
/NO_APP
	jmp	.L11
.L75:
/APP
/  433 "main.c" 1
	int 62

/  0 "" 2
/NO_APP
	jmp	.L11
.L76:
/APP
/  434 "main.c" 1
	int 63

/  0 "" 2
/NO_APP
	jmp	.L11
.L77:
/APP
/  435 "main.c" 1
	int 64

/  0 "" 2
/NO_APP
	jmp	.L11
.L78:
/APP
/  436 "main.c" 1
	int 65

/  0 "" 2
/NO_APP
	jmp	.L11
.L79:
/APP
/  437 "main.c" 1
	int 66

/  0 "" 2
/NO_APP
	jmp	.L11
.L80:
/APP
/  438 "main.c" 1
	int 67

/  0 "" 2
/NO_APP
	jmp	.L11
.L81:
/APP
/  439 "main.c" 1
	int 68

/  0 "" 2
/NO_APP
	jmp	.L11
.L82:
/APP
/  440 "main.c" 1
	int 69

/  0 "" 2
/NO_APP
	jmp	.L11
.L83:
/APP
/  441 "main.c" 1
	int 70

/  0 "" 2
/NO_APP
	jmp	.L11
.L84:
/APP
/  442 "main.c" 1
	int 71

/  0 "" 2
/NO_APP
	jmp	.L11
.L85:
/APP
/  443 "main.c" 1
	int 72

/  0 "" 2
/NO_APP
	jmp	.L11
.L86:
/APP
/  444 "main.c" 1
	int 73

/  0 "" 2
/NO_APP
	jmp	.L11
.L87:
/APP
/  445 "main.c" 1
	int 74

/  0 "" 2
/NO_APP
	jmp	.L11
.L88:
/APP
/  446 "main.c" 1
	int 75

/  0 "" 2
/NO_APP
	jmp	.L11
.L89:
/APP
/  447 "main.c" 1
	int 76

/  0 "" 2
/NO_APP
	jmp	.L11
.L90:
/APP
/  448 "main.c" 1
	int 77

/  0 "" 2
/NO_APP
	jmp	.L11
.L91:
/APP
/  449 "main.c" 1
	int 78

/  0 "" 2
/NO_APP
	jmp	.L11
.L92:
/APP
/  450 "main.c" 1
	int 79

/  0 "" 2
/NO_APP
	jmp	.L11
.L93:
/APP
/  451 "main.c" 1
	int 80

/  0 "" 2
/NO_APP
	jmp	.L11
.L94:
/APP
/  452 "main.c" 1
	int 81

/  0 "" 2
/NO_APP
	jmp	.L11
.L95:
/APP
/  453 "main.c" 1
	int 82

/  0 "" 2
/NO_APP
	jmp	.L11
.L96:
/APP
/  454 "main.c" 1
	int 83

/  0 "" 2
/NO_APP
	jmp	.L11
.L97:
/APP
/  455 "main.c" 1
	int 84

/  0 "" 2
/NO_APP
	jmp	.L11
.L98:
/APP
/  456 "main.c" 1
	int 85

/  0 "" 2
/NO_APP
	jmp	.L11
.L99:
/APP
/  457 "main.c" 1
	int 86

/  0 "" 2
/NO_APP
	jmp	.L11
.L100:
/APP
/  458 "main.c" 1
	int 87

/  0 "" 2
/NO_APP
	jmp	.L11
.L101:
/APP
/  459 "main.c" 1
	int 88

/  0 "" 2
/NO_APP
	jmp	.L11
.L102:
/APP
/  460 "main.c" 1
	int 89

/  0 "" 2
/NO_APP
	jmp	.L11
.L103:
/APP
/  461 "main.c" 1
	int 90

/  0 "" 2
/NO_APP
	jmp	.L11
.L104:
/APP
/  462 "main.c" 1
	int 91

/  0 "" 2
/NO_APP
	jmp	.L11
.L105:
/APP
/  463 "main.c" 1
	int 92

/  0 "" 2
/NO_APP
	jmp	.L11
.L106:
/APP
/  464 "main.c" 1
	int 93

/  0 "" 2
/NO_APP
	jmp	.L11
.L107:
/APP
/  465 "main.c" 1
	int 94

/  0 "" 2
/NO_APP
	jmp	.L11
.L108:
/APP
/  466 "main.c" 1
	int 95

/  0 "" 2
/NO_APP
	jmp	.L11
.L109:
/APP
/  467 "main.c" 1
	int 96

/  0 "" 2
/NO_APP
	jmp	.L11
.L110:
/APP
/  468 "main.c" 1
	int 97

/  0 "" 2
/NO_APP
	jmp	.L11
.L111:
/APP
/  469 "main.c" 1
	int 98

/  0 "" 2
/NO_APP
	jmp	.L11
.L112:
/APP
/  470 "main.c" 1
	int 99

/  0 "" 2
/NO_APP
	jmp	.L11
.L113:
/APP
/  471 "main.c" 1
	int 100

/  0 "" 2
/NO_APP
	jmp	.L11
.L114:
/APP
/  472 "main.c" 1
	int 101

/  0 "" 2
/NO_APP
	jmp	.L11
.L115:
/APP
/  473 "main.c" 1
	int 102

/  0 "" 2
/NO_APP
	jmp	.L11
.L116:
/APP
/  474 "main.c" 1
	int 103

/  0 "" 2
/NO_APP
	jmp	.L11
.L117:
/APP
/  475 "main.c" 1
	int 104

/  0 "" 2
/NO_APP
	jmp	.L11
.L118:
/APP
/  476 "main.c" 1
	int 105

/  0 "" 2
/NO_APP
	jmp	.L11
.L119:
/APP
/  477 "main.c" 1
	int 106

/  0 "" 2
/NO_APP
	jmp	.L11
.L120:
/APP
/  478 "main.c" 1
	int 107

/  0 "" 2
/NO_APP
	jmp	.L11
.L121:
/APP
/  479 "main.c" 1
	int 108

/  0 "" 2
/NO_APP
	jmp	.L11
.L122:
/APP
/  480 "main.c" 1
	int 109

/  0 "" 2
/NO_APP
	jmp	.L11
.L123:
/APP
/  481 "main.c" 1
	int 110

/  0 "" 2
/NO_APP
	jmp	.L11
.L124:
/APP
/  482 "main.c" 1
	int 111

/  0 "" 2
/NO_APP
	jmp	.L11
.L125:
/APP
/  483 "main.c" 1
	int 112

/  0 "" 2
/NO_APP
	jmp	.L11
.L126:
/APP
/  484 "main.c" 1
	int 113

/  0 "" 2
/NO_APP
	jmp	.L11
.L127:
/APP
/  485 "main.c" 1
	int 114

/  0 "" 2
/NO_APP
	jmp	.L11
.L128:
/APP
/  486 "main.c" 1
	int 115

/  0 "" 2
/NO_APP
	jmp	.L11
.L129:
/APP
/  487 "main.c" 1
	int 116

/  0 "" 2
/NO_APP
	jmp	.L11
.L130:
/APP
/  488 "main.c" 1
	int 117

/  0 "" 2
/NO_APP
	jmp	.L11
.L131:
/APP
/  489 "main.c" 1
	int 118

/  0 "" 2
/NO_APP
	jmp	.L11
.L132:
/APP
/  490 "main.c" 1
	int 119

/  0 "" 2
/NO_APP
	jmp	.L11
.L133:
/APP
/  491 "main.c" 1
	int 120

/  0 "" 2
/NO_APP
	jmp	.L11
.L134:
/APP
/  492 "main.c" 1
	int 121

/  0 "" 2
/NO_APP
	jmp	.L11
.L135:
/APP
/  493 "main.c" 1
	int 122

/  0 "" 2
/NO_APP
	jmp	.L11
.L136:
/APP
/  494 "main.c" 1
	int 123

/  0 "" 2
/NO_APP
	jmp	.L11
.L137:
/APP
/  495 "main.c" 1
	int 124

/  0 "" 2
/NO_APP
	jmp	.L11
.L138:
/APP
/  496 "main.c" 1
	int 125

/  0 "" 2
/NO_APP
	jmp	.L11
.L139:
/APP
/  497 "main.c" 1
	int 126

/  0 "" 2
/NO_APP
	jmp	.L11
.L140:
/APP
/  498 "main.c" 1
	int 127

/  0 "" 2
/NO_APP
	jmp	.L11
.L141:
/APP
/  499 "main.c" 1
	int 128

/  0 "" 2
/NO_APP
	jmp	.L11
.L142:
/APP
/  500 "main.c" 1
	int 129

/  0 "" 2
/NO_APP
	jmp	.L11
.L143:
/APP
/  501 "main.c" 1
	int 130

/  0 "" 2
/NO_APP
	jmp	.L11
.L144:
/APP
/  502 "main.c" 1
	int 131

/  0 "" 2
/NO_APP
	jmp	.L11
.L145:
/APP
/  503 "main.c" 1
	int 132

/  0 "" 2
/NO_APP
	jmp	.L11
.L146:
/APP
/  504 "main.c" 1
	int 133

/  0 "" 2
/NO_APP
	jmp	.L11
.L147:
/APP
/  505 "main.c" 1
	int 134

/  0 "" 2
/NO_APP
	jmp	.L11
.L148:
/APP
/  506 "main.c" 1
	int 135

/  0 "" 2
/NO_APP
	jmp	.L11
.L149:
/APP
/  507 "main.c" 1
	int 136

/  0 "" 2
/NO_APP
	jmp	.L11
.L150:
/APP
/  508 "main.c" 1
	int 137

/  0 "" 2
/NO_APP
	jmp	.L11
.L151:
/APP
/  509 "main.c" 1
	int 138

/  0 "" 2
/NO_APP
	jmp	.L11
.L152:
/APP
/  510 "main.c" 1
	int 139

/  0 "" 2
/NO_APP
	jmp	.L11
.L153:
/APP
/  511 "main.c" 1
	int 140

/  0 "" 2
/NO_APP
	jmp	.L11
.L154:
/APP
/  512 "main.c" 1
	int 141

/  0 "" 2
/NO_APP
	jmp	.L11
.L155:
/APP
/  513 "main.c" 1
	int 142

/  0 "" 2
/NO_APP
	jmp	.L11
.L156:
/APP
/  514 "main.c" 1
	int 143

/  0 "" 2
/NO_APP
	jmp	.L11
.L157:
/APP
/  515 "main.c" 1
	int 144

/  0 "" 2
/NO_APP
	jmp	.L11
.L158:
/APP
/  516 "main.c" 1
	int 145

/  0 "" 2
/NO_APP
	jmp	.L11
.L159:
/APP
/  517 "main.c" 1
	int 146

/  0 "" 2
/NO_APP
	jmp	.L11
.L160:
/APP
/  518 "main.c" 1
	int 147

/  0 "" 2
/NO_APP
	jmp	.L11
.L161:
/APP
/  519 "main.c" 1
	int 148

/  0 "" 2
/NO_APP
	jmp	.L11
.L162:
/APP
/  520 "main.c" 1
	int 149

/  0 "" 2
/NO_APP
	jmp	.L11
.L163:
/APP
/  521 "main.c" 1
	int 150

/  0 "" 2
/NO_APP
	jmp	.L11
.L164:
/APP
/  522 "main.c" 1
	int 151

/  0 "" 2
/NO_APP
	jmp	.L11
.L165:
/APP
/  523 "main.c" 1
	int 152

/  0 "" 2
/NO_APP
	jmp	.L11
.L166:
/APP
/  524 "main.c" 1
	int 153

/  0 "" 2
/NO_APP
	jmp	.L11
.L167:
/APP
/  525 "main.c" 1
	int 154

/  0 "" 2
/NO_APP
	jmp	.L11
.L168:
/APP
/  526 "main.c" 1
	int 155

/  0 "" 2
/NO_APP
	jmp	.L11
.L169:
/APP
/  527 "main.c" 1
	int 156

/  0 "" 2
/NO_APP
	jmp	.L11
.L170:
/APP
/  528 "main.c" 1
	int 157

/  0 "" 2
/NO_APP
	jmp	.L11
.L171:
/APP
/  529 "main.c" 1
	int 158

/  0 "" 2
/NO_APP
	jmp	.L11
.L172:
/APP
/  530 "main.c" 1
	int 159

/  0 "" 2
/NO_APP
	jmp	.L11
.L173:
/APP
/  531 "main.c" 1
	int 160

/  0 "" 2
/NO_APP
	jmp	.L11
.L174:
/APP
/  532 "main.c" 1
	int 161

/  0 "" 2
/NO_APP
	jmp	.L11
.L175:
/APP
/  533 "main.c" 1
	int 162

/  0 "" 2
/NO_APP
	jmp	.L11
.L176:
/APP
/  534 "main.c" 1
	int 163

/  0 "" 2
/NO_APP
	jmp	.L11
.L177:
/APP
/  535 "main.c" 1
	int 164

/  0 "" 2
/NO_APP
	jmp	.L11
.L178:
/APP
/  536 "main.c" 1
	int 165

/  0 "" 2
/NO_APP
	jmp	.L11
.L179:
/APP
/  537 "main.c" 1
	int 166

/  0 "" 2
/NO_APP
	jmp	.L11
.L180:
/APP
/  538 "main.c" 1
	int 167

/  0 "" 2
/NO_APP
	jmp	.L11
.L181:
/APP
/  539 "main.c" 1
	int 168

/  0 "" 2
/NO_APP
	jmp	.L11
.L182:
/APP
/  540 "main.c" 1
	int 169

/  0 "" 2
/NO_APP
	jmp	.L11
.L183:
/APP
/  541 "main.c" 1
	int 170

/  0 "" 2
/NO_APP
	jmp	.L11
.L184:
/APP
/  542 "main.c" 1
	int 171

/  0 "" 2
/NO_APP
	jmp	.L11
.L185:
/APP
/  543 "main.c" 1
	int 172

/  0 "" 2
/NO_APP
	jmp	.L11
.L186:
/APP
/  544 "main.c" 1
	int 173

/  0 "" 2
/NO_APP
	jmp	.L11
.L187:
/APP
/  545 "main.c" 1
	int 174

/  0 "" 2
/NO_APP
	jmp	.L11
.L188:
/APP
/  546 "main.c" 1
	int 175

/  0 "" 2
/NO_APP
	jmp	.L11
.L189:
/APP
/  547 "main.c" 1
	int 176

/  0 "" 2
/NO_APP
	jmp	.L11
.L190:
/APP
/  548 "main.c" 1
	int 177

/  0 "" 2
/NO_APP
	jmp	.L11
.L191:
/APP
/  549 "main.c" 1
	int 178

/  0 "" 2
/NO_APP
	jmp	.L11
.L192:
/APP
/  550 "main.c" 1
	int 179

/  0 "" 2
/NO_APP
	jmp	.L11
.L193:
/APP
/  551 "main.c" 1
	int 180

/  0 "" 2
/NO_APP
	jmp	.L11
.L194:
/APP
/  552 "main.c" 1
	int 181

/  0 "" 2
/NO_APP
	jmp	.L11
.L195:
/APP
/  553 "main.c" 1
	int 182

/  0 "" 2
/NO_APP
	jmp	.L11
.L196:
/APP
/  554 "main.c" 1
	int 183

/  0 "" 2
/NO_APP
	jmp	.L11
.L197:
/APP
/  555 "main.c" 1
	int 184

/  0 "" 2
/NO_APP
	jmp	.L11
.L198:
/APP
/  556 "main.c" 1
	int 185

/  0 "" 2
/NO_APP
	jmp	.L11
.L199:
/APP
/  557 "main.c" 1
	int 186

/  0 "" 2
/NO_APP
	jmp	.L11
.L200:
/APP
/  558 "main.c" 1
	int 187

/  0 "" 2
/NO_APP
	jmp	.L11
.L201:
/APP
/  559 "main.c" 1
	int 188

/  0 "" 2
/NO_APP
	jmp	.L11
.L202:
/APP
/  560 "main.c" 1
	int 189

/  0 "" 2
/NO_APP
	jmp	.L11
.L203:
/APP
/  561 "main.c" 1
	int 190

/  0 "" 2
/NO_APP
	jmp	.L11
.L204:
/APP
/  562 "main.c" 1
	int 191

/  0 "" 2
/NO_APP
	jmp	.L11
.L205:
/APP
/  563 "main.c" 1
	int 192

/  0 "" 2
/NO_APP
	jmp	.L11
.L206:
/APP
/  564 "main.c" 1
	int 193

/  0 "" 2
/NO_APP
	jmp	.L11
.L207:
/APP
/  565 "main.c" 1
	int 194

/  0 "" 2
/NO_APP
	jmp	.L11
.L208:
/APP
/  566 "main.c" 1
	int 195

/  0 "" 2
/NO_APP
	jmp	.L11
.L209:
/APP
/  567 "main.c" 1
	int 196

/  0 "" 2
/NO_APP
	jmp	.L11
.L210:
/APP
/  568 "main.c" 1
	int 197

/  0 "" 2
/NO_APP
	jmp	.L11
.L211:
/APP
/  569 "main.c" 1
	int 198

/  0 "" 2
/NO_APP
	jmp	.L11
.L212:
/APP
/  570 "main.c" 1
	int 199

/  0 "" 2
/NO_APP
	jmp	.L11
.L213:
/APP
/  571 "main.c" 1
	int 200

/  0 "" 2
/NO_APP
	jmp	.L11
.L214:
/APP
/  572 "main.c" 1
	int 201

/  0 "" 2
/NO_APP
	jmp	.L11
.L215:
/APP
/  573 "main.c" 1
	int 202

/  0 "" 2
/NO_APP
	jmp	.L11
.L216:
/APP
/  574 "main.c" 1
	int 203

/  0 "" 2
/NO_APP
	jmp	.L11
.L217:
/APP
/  575 "main.c" 1
	int 204

/  0 "" 2
/NO_APP
	jmp	.L11
.L218:
/APP
/  576 "main.c" 1
	int 205

/  0 "" 2
/NO_APP
	jmp	.L11
.L219:
/APP
/  577 "main.c" 1
	int 206

/  0 "" 2
/NO_APP
	jmp	.L11
.L220:
/APP
/  578 "main.c" 1
	int 207

/  0 "" 2
/NO_APP
	jmp	.L11
.L221:
/APP
/  579 "main.c" 1
	int 208

/  0 "" 2
/NO_APP
	jmp	.L11
.L222:
/APP
/  580 "main.c" 1
	int 209

/  0 "" 2
/NO_APP
	jmp	.L11
.L223:
/APP
/  581 "main.c" 1
	int 210

/  0 "" 2
/NO_APP
	jmp	.L11
.L224:
/APP
/  582 "main.c" 1
	int 211

/  0 "" 2
/NO_APP
	jmp	.L11
.L225:
/APP
/  583 "main.c" 1
	int 212

/  0 "" 2
/NO_APP
	jmp	.L11
.L226:
/APP
/  584 "main.c" 1
	int 213

/  0 "" 2
/NO_APP
	jmp	.L11
.L227:
/APP
/  585 "main.c" 1
	int 214

/  0 "" 2
/NO_APP
	jmp	.L11
.L228:
/APP
/  586 "main.c" 1
	int 215

/  0 "" 2
/NO_APP
	jmp	.L11
.L229:
/APP
/  587 "main.c" 1
	int 216

/  0 "" 2
/NO_APP
	jmp	.L11
.L230:
/APP
/  588 "main.c" 1
	int 217

/  0 "" 2
/NO_APP
	jmp	.L11
.L231:
/APP
/  589 "main.c" 1
	int 218

/  0 "" 2
/NO_APP
	jmp	.L11
.L232:
/APP
/  590 "main.c" 1
	int 219

/  0 "" 2
/NO_APP
	jmp	.L11
.L233:
/APP
/  591 "main.c" 1
	int 220

/  0 "" 2
/NO_APP
	jmp	.L11
.L234:
/APP
/  592 "main.c" 1
	int 221

/  0 "" 2
/NO_APP
	jmp	.L11
.L235:
/APP
/  593 "main.c" 1
	int 222

/  0 "" 2
/NO_APP
	jmp	.L11
.L236:
/APP
/  594 "main.c" 1
	int 223

/  0 "" 2
/NO_APP
	jmp	.L11
.L237:
/APP
/  595 "main.c" 1
	int 224

/  0 "" 2
/NO_APP
	jmp	.L11
.L238:
/APP
/  596 "main.c" 1
	int 225

/  0 "" 2
/NO_APP
	jmp	.L11
.L239:
/APP
/  597 "main.c" 1
	int 226

/  0 "" 2
/NO_APP
	jmp	.L11
.L240:
/APP
/  598 "main.c" 1
	int 227

/  0 "" 2
/NO_APP
	jmp	.L11
.L241:
/APP
/  599 "main.c" 1
	int 228

/  0 "" 2
/NO_APP
	jmp	.L11
.L242:
/APP
/  600 "main.c" 1
	int 229

/  0 "" 2
/NO_APP
	jmp	.L11
.L243:
/APP
/  601 "main.c" 1
	int 230

/  0 "" 2
/NO_APP
	jmp	.L11
.L244:
/APP
/  602 "main.c" 1
	int 231

/  0 "" 2
/NO_APP
	jmp	.L11
.L245:
/APP
/  603 "main.c" 1
	int 232

/  0 "" 2
/NO_APP
	jmp	.L11
.L246:
/APP
/  604 "main.c" 1
	int 233

/  0 "" 2
/NO_APP
	jmp	.L11
.L247:
/APP
/  605 "main.c" 1
	int 234

/  0 "" 2
/NO_APP
	jmp	.L11
.L248:
/APP
/  606 "main.c" 1
	int 235

/  0 "" 2
/NO_APP
	jmp	.L11
.L249:
/APP
/  607 "main.c" 1
	int 236

/  0 "" 2
/NO_APP
	jmp	.L11
.L250:
/APP
/  608 "main.c" 1
	int 237

/  0 "" 2
/NO_APP
	jmp	.L11
.L251:
/APP
/  609 "main.c" 1
	int 238

/  0 "" 2
/NO_APP
	jmp	.L11
.L252:
/APP
/  610 "main.c" 1
	int 239

/  0 "" 2
/NO_APP
	jmp	.L11
.L253:
/APP
/  611 "main.c" 1
	int 240

/  0 "" 2
/NO_APP
	jmp	.L11
.L254:
/APP
/  612 "main.c" 1
	int 241

/  0 "" 2
/NO_APP
	jmp	.L11
.L255:
/APP
/  613 "main.c" 1
	int 242

/  0 "" 2
/NO_APP
	jmp	.L11
.L256:
/APP
/  614 "main.c" 1
	int 243

/  0 "" 2
/NO_APP
	jmp	.L11
.L257:
/APP
/  615 "main.c" 1
	int 244

/  0 "" 2
/NO_APP
	jmp	.L11
.L258:
/APP
/  616 "main.c" 1
	int 245

/  0 "" 2
/NO_APP
	jmp	.L11
.L259:
/APP
/  617 "main.c" 1
	int 246

/  0 "" 2
/NO_APP
	jmp	.L11
.L260:
/APP
/  618 "main.c" 1
	int 247

/  0 "" 2
/NO_APP
	jmp	.L11
.L261:
/APP
/  619 "main.c" 1
	int 248

/  0 "" 2
/NO_APP
	jmp	.L11
.L262:
/APP
/  620 "main.c" 1
	int 249

/  0 "" 2
/NO_APP
	jmp	.L11
.L263:
/APP
/  621 "main.c" 1
	int 250

/  0 "" 2
/NO_APP
	jmp	.L11
.L264:
/APP
/  622 "main.c" 1
	int 251

/  0 "" 2
/NO_APP
	jmp	.L11
.L265:
/APP
/  623 "main.c" 1
	int 252

/  0 "" 2
/NO_APP
	jmp	.L11
.L266:
/APP
/  624 "main.c" 1
	int 253

/  0 "" 2
/NO_APP
	jmp	.L11
.L267:
/APP
/  625 "main.c" 1
	int 254

/  0 "" 2
/NO_APP
	jmp	.L11
.L268:
/APP
/  626 "main.c" 1
	int 255

/  0 "" 2
/NO_APP
	nop
.L11:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	IssueInterrupt, .-IssueInterrupt
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 1080
	mov	DWORD PTR [ebp-4], 7
	mov	DWORD PTR [ebp-16], 4
	mov	DWORD PTR [ebp-20], 1024
	mov	DWORD PTR [ebp-24], 0
	mov	eax, DWORD PTR [ebp-16]
	imul	eax, DWORD PTR [ebp-20]
	mov	DWORD PTR [ebp-28], eax
	mov	DWORD PTR [ebp-8], 0
	mov	eax, OFFSET FLAT:Page_Table1
	add	eax, 1073741824
	mov	DWORD PTR [ebp-32], eax
	mov	eax, OFFSET FLAT:Page_Directory
	add	eax, 1073741824
	mov	DWORD PTR [ebp-36], eax
	jmp	.L271
.L272:
	mov	eax, DWORD PTR [ebp-8]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp-32]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-4]
	mov	DWORD PTR [edx], eax
	add	DWORD PTR [ebp-8], 1
	add	DWORD PTR [ebp-4], 4096
.L271:
	mov	eax, DWORD PTR [ebp-24]
	mov	edx, DWORD PTR [ebp-28]
	add	eax, edx
	cmp	eax, DWORD PTR [ebp-8]
	ja	.L272
	mov	DWORD PTR [ebp-4], 7
	mov	DWORD PTR [ebp-8], 786432
	mov	DWORD PTR [ebp-24], 786432
	jmp	.L273
.L274:
	mov	eax, DWORD PTR [ebp-8]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp-32]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-4]
	mov	DWORD PTR [edx], eax
	add	DWORD PTR [ebp-8], 1
	add	DWORD PTR [ebp-4], 4096
.L273:
	mov	eax, DWORD PTR [ebp-24]
	mov	edx, DWORD PTR [ebp-28]
	add	eax, edx
	cmp	eax, DWORD PTR [ebp-8]
	ja	.L274
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [ebp-4], eax
	or	DWORD PTR [ebp-4], 7
	mov	DWORD PTR [ebp-40], 1024
	mov	DWORD PTR [ebp-8], 0
	jmp	.L275
.L276:
	mov	eax, DWORD PTR [ebp-8]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp-36]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-4]
	mov	DWORD PTR [edx], eax
	add	DWORD PTR [ebp-8], 1
	add	DWORD PTR [ebp-4], 4096
.L275:
	mov	eax, DWORD PTR [ebp-8]
	cmp	eax, DWORD PTR [ebp-40]
	jb	.L276
/APP
/  682 "main.c" 1
	lea ECX, [Page_Directory - 0xC0000000]
mov CR3, ECX

/  0 "" 2
/  689 "main.c" 1
	mov ECX, CR0
or ECX, 0x80000000
mov CR0, ECX

/  0 "" 2
/  699 "main.c" 1
	lea ECX, [StartInHigherHalf]
jmp ECX
StartInHigherHalf:
nop

/  0 "" 2
/NO_APP
	mov	DWORD PTR [esp+4], 15
	mov	DWORD PTR [esp], 3
	call	DisplayColour
	mov	eax, DWORD PTR IDT_Contents
	mov	DWORD PTR [ebp-44], eax
	mov	DWORD PTR [ebp-48], OFFSET FLAT:CommonInterruptHandler0
	mov	eax, DWORD PTR [ebp-48]
	mov	edx, eax
	mov	eax, DWORD PTR [ebp-44]
	mov	WORD PTR [eax], dx
	mov	eax, DWORD PTR [ebp-48]
	shr	eax, 16
	mov	edx, eax
	mov	eax, DWORD PTR [ebp-44]
	mov	WORD PTR [eax+6], dx
	mov	eax, DWORD PTR [ebp-44]
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-52], OFFSET FLAT:CommonInterruptHandler1
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+8]
	mov	eax, DWORD PTR [ebp-52]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+8]
	mov	eax, DWORD PTR [ebp-52]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 8
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 8
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 8
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 8
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 8
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 8
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-56], OFFSET FLAT:CommonInterruptHandler2
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+16]
	mov	eax, DWORD PTR [ebp-56]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+16]
	mov	eax, DWORD PTR [ebp-56]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 16
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 16
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 16
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 16
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 16
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 16
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-60], OFFSET FLAT:CommonInterruptHandler3
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+24]
	mov	eax, DWORD PTR [ebp-60]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+24]
	mov	eax, DWORD PTR [ebp-60]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 24
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 24
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 24
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 24
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 24
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 24
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-64], OFFSET FLAT:CommonInterruptHandler4
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+32]
	mov	eax, DWORD PTR [ebp-64]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+32]
	mov	eax, DWORD PTR [ebp-64]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 32
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 32
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 32
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 32
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 32
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 32
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-68], OFFSET FLAT:CommonInterruptHandler5
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+40]
	mov	eax, DWORD PTR [ebp-68]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+40]
	mov	eax, DWORD PTR [ebp-68]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 40
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 40
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 40
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 40
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 40
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 40
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-72], OFFSET FLAT:CommonInterruptHandler6
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+48]
	mov	eax, DWORD PTR [ebp-72]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+48]
	mov	eax, DWORD PTR [ebp-72]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 48
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 48
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 48
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 48
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 48
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 48
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-76], OFFSET FLAT:CommonInterruptHandler7
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+56]
	mov	eax, DWORD PTR [ebp-76]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+56]
	mov	eax, DWORD PTR [ebp-76]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 56
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 56
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 56
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 56
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 56
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 56
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-80], OFFSET FLAT:CommonInterruptHandler8
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+64]
	mov	eax, DWORD PTR [ebp-80]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+64]
	mov	eax, DWORD PTR [ebp-80]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 64
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 64
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 64
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 64
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 64
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 64
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-84], OFFSET FLAT:CommonInterruptHandler9
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+72]
	mov	eax, DWORD PTR [ebp-84]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+72]
	mov	eax, DWORD PTR [ebp-84]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 72
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 72
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 72
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 72
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 72
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 72
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-88], OFFSET FLAT:CommonInterruptHandler10
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+80]
	mov	eax, DWORD PTR [ebp-88]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+80]
	mov	eax, DWORD PTR [ebp-88]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 80
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 80
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 80
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 80
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 80
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 80
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-92], OFFSET FLAT:CommonInterruptHandler11
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+88]
	mov	eax, DWORD PTR [ebp-92]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+88]
	mov	eax, DWORD PTR [ebp-92]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 88
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 88
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 88
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 88
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 88
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 88
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-96], OFFSET FLAT:CommonInterruptHandler12
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+96]
	mov	eax, DWORD PTR [ebp-96]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+96]
	mov	eax, DWORD PTR [ebp-96]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 96
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 96
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 96
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 96
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 96
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 96
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-100], OFFSET FLAT:CommonInterruptHandler13
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+104]
	mov	eax, DWORD PTR [ebp-100]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+104]
	mov	eax, DWORD PTR [ebp-100]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 104
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 104
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 104
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 104
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 104
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 104
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-104], OFFSET FLAT:CommonInterruptHandler14
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+112]
	mov	eax, DWORD PTR [ebp-104]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+112]
	mov	eax, DWORD PTR [ebp-104]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 112
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 112
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 112
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 112
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 112
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 112
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-108], OFFSET FLAT:CommonInterruptHandler15
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+120]
	mov	eax, DWORD PTR [ebp-108]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+120]
	mov	eax, DWORD PTR [ebp-108]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 120
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 120
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 120
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 120
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 120
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 120
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-112], OFFSET FLAT:CommonInterruptHandler16
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+128]
	mov	eax, DWORD PTR [ebp-112]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+128]
	mov	eax, DWORD PTR [ebp-112]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	sub	eax, -128
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	sub	eax, -128
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	sub	eax, -128
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	sub	eax, -128
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	sub	eax, -128
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	sub	eax, -128
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-116], OFFSET FLAT:CommonInterruptHandler17
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+136]
	mov	eax, DWORD PTR [ebp-116]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+136]
	mov	eax, DWORD PTR [ebp-116]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 136
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 136
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 136
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 136
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 136
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 136
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-120], OFFSET FLAT:CommonInterruptHandler18
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+144]
	mov	eax, DWORD PTR [ebp-120]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+144]
	mov	eax, DWORD PTR [ebp-120]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 144
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 144
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 144
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 144
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 144
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 144
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-124], OFFSET FLAT:CommonInterruptHandler19
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+152]
	mov	eax, DWORD PTR [ebp-124]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+152]
	mov	eax, DWORD PTR [ebp-124]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 152
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 152
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 152
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 152
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 152
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 152
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-128], OFFSET FLAT:CommonInterruptHandler20
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+160]
	mov	eax, DWORD PTR [ebp-128]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+160]
	mov	eax, DWORD PTR [ebp-128]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 160
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 160
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 160
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 160
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 160
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 160
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-132], OFFSET FLAT:CommonInterruptHandler21
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+168]
	mov	eax, DWORD PTR [ebp-132]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+168]
	mov	eax, DWORD PTR [ebp-132]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 168
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 168
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 168
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 168
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 168
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 168
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-136], OFFSET FLAT:CommonInterruptHandler22
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+176]
	mov	eax, DWORD PTR [ebp-136]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+176]
	mov	eax, DWORD PTR [ebp-136]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 176
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 176
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 176
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 176
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 176
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 176
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-140], OFFSET FLAT:CommonInterruptHandler23
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+184]
	mov	eax, DWORD PTR [ebp-140]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+184]
	mov	eax, DWORD PTR [ebp-140]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 184
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 184
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 184
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 184
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 184
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 184
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-144], OFFSET FLAT:CommonInterruptHandler24
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+192]
	mov	eax, DWORD PTR [ebp-144]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+192]
	mov	eax, DWORD PTR [ebp-144]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 192
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 192
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 192
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 192
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 192
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 192
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-148], OFFSET FLAT:CommonInterruptHandler25
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+200]
	mov	eax, DWORD PTR [ebp-148]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+200]
	mov	eax, DWORD PTR [ebp-148]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 200
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 200
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 200
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 200
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 200
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 200
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-152], OFFSET FLAT:CommonInterruptHandler26
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+208]
	mov	eax, DWORD PTR [ebp-152]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+208]
	mov	eax, DWORD PTR [ebp-152]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 208
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 208
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 208
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 208
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 208
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 208
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-156], OFFSET FLAT:CommonInterruptHandler27
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+216]
	mov	eax, DWORD PTR [ebp-156]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+216]
	mov	eax, DWORD PTR [ebp-156]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 216
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 216
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 216
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 216
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 216
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 216
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-160], OFFSET FLAT:CommonInterruptHandler28
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+224]
	mov	eax, DWORD PTR [ebp-160]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+224]
	mov	eax, DWORD PTR [ebp-160]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 224
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 224
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 224
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 224
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 224
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 224
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-164], OFFSET FLAT:CommonInterruptHandler29
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+232]
	mov	eax, DWORD PTR [ebp-164]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+232]
	mov	eax, DWORD PTR [ebp-164]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 232
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 232
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 232
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 232
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 232
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 232
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-168], OFFSET FLAT:CommonInterruptHandler30
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+240]
	mov	eax, DWORD PTR [ebp-168]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+240]
	mov	eax, DWORD PTR [ebp-168]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 240
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 240
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 240
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 240
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 240
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 240
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-172], OFFSET FLAT:CommonInterruptHandler31
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+248]
	mov	eax, DWORD PTR [ebp-172]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+248]
	mov	eax, DWORD PTR [ebp-172]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 248
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 248
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 248
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 248
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 248
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 248
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-176], OFFSET FLAT:CommonInterruptHandler32
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+256]
	mov	eax, DWORD PTR [ebp-176]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+256]
	mov	eax, DWORD PTR [ebp-176]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 256
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 256
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 256
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 256
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 256
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 256
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-180], OFFSET FLAT:CommonInterruptHandler33
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+264]
	mov	eax, DWORD PTR [ebp-180]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+264]
	mov	eax, DWORD PTR [ebp-180]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 264
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 264
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 264
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 264
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 264
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 264
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-184], OFFSET FLAT:CommonInterruptHandler34
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+272]
	mov	eax, DWORD PTR [ebp-184]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+272]
	mov	eax, DWORD PTR [ebp-184]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 272
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 272
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 272
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 272
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 272
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 272
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-188], OFFSET FLAT:CommonInterruptHandler35
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+280]
	mov	eax, DWORD PTR [ebp-188]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+280]
	mov	eax, DWORD PTR [ebp-188]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 280
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 280
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 280
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 280
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 280
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 280
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-192], OFFSET FLAT:CommonInterruptHandler36
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+288]
	mov	eax, DWORD PTR [ebp-192]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+288]
	mov	eax, DWORD PTR [ebp-192]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 288
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 288
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 288
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 288
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 288
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 288
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-196], OFFSET FLAT:CommonInterruptHandler37
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+296]
	mov	eax, DWORD PTR [ebp-196]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+296]
	mov	eax, DWORD PTR [ebp-196]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 296
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 296
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 296
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 296
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 296
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 296
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-200], OFFSET FLAT:CommonInterruptHandler38
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+304]
	mov	eax, DWORD PTR [ebp-200]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+304]
	mov	eax, DWORD PTR [ebp-200]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 304
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 304
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 304
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 304
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 304
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 304
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-204], OFFSET FLAT:CommonInterruptHandler39
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+312]
	mov	eax, DWORD PTR [ebp-204]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+312]
	mov	eax, DWORD PTR [ebp-204]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 312
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 312
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 312
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 312
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 312
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 312
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-208], OFFSET FLAT:CommonInterruptHandler40
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+320]
	mov	eax, DWORD PTR [ebp-208]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+320]
	mov	eax, DWORD PTR [ebp-208]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 320
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 320
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 320
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 320
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 320
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 320
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-212], OFFSET FLAT:CommonInterruptHandler41
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+328]
	mov	eax, DWORD PTR [ebp-212]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+328]
	mov	eax, DWORD PTR [ebp-212]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 328
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 328
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 328
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 328
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 328
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 328
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-216], OFFSET FLAT:CommonInterruptHandler42
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+336]
	mov	eax, DWORD PTR [ebp-216]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+336]
	mov	eax, DWORD PTR [ebp-216]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 336
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 336
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 336
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 336
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 336
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 336
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-220], OFFSET FLAT:CommonInterruptHandler43
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+344]
	mov	eax, DWORD PTR [ebp-220]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+344]
	mov	eax, DWORD PTR [ebp-220]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 344
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 344
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 344
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 344
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 344
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 344
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-224], OFFSET FLAT:CommonInterruptHandler44
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+352]
	mov	eax, DWORD PTR [ebp-224]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+352]
	mov	eax, DWORD PTR [ebp-224]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 352
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 352
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 352
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 352
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 352
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 352
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-228], OFFSET FLAT:CommonInterruptHandler45
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+360]
	mov	eax, DWORD PTR [ebp-228]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+360]
	mov	eax, DWORD PTR [ebp-228]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 360
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 360
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 360
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 360
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 360
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 360
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-232], OFFSET FLAT:CommonInterruptHandler46
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+368]
	mov	eax, DWORD PTR [ebp-232]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+368]
	mov	eax, DWORD PTR [ebp-232]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 368
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 368
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 368
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 368
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 368
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 368
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-236], OFFSET FLAT:CommonInterruptHandler47
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+376]
	mov	eax, DWORD PTR [ebp-236]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+376]
	mov	eax, DWORD PTR [ebp-236]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 376
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 376
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 376
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 376
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 376
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 376
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-240], OFFSET FLAT:CommonInterruptHandler48
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+384]
	mov	eax, DWORD PTR [ebp-240]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+384]
	mov	eax, DWORD PTR [ebp-240]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 384
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 384
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 384
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 384
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 384
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 384
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-244], OFFSET FLAT:CommonInterruptHandler49
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+392]
	mov	eax, DWORD PTR [ebp-244]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+392]
	mov	eax, DWORD PTR [ebp-244]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 392
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 392
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 392
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 392
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 392
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 392
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-248], OFFSET FLAT:CommonInterruptHandler50
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+400]
	mov	eax, DWORD PTR [ebp-248]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+400]
	mov	eax, DWORD PTR [ebp-248]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 400
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 400
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 400
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 400
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 400
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 400
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-252], OFFSET FLAT:CommonInterruptHandler51
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+408]
	mov	eax, DWORD PTR [ebp-252]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+408]
	mov	eax, DWORD PTR [ebp-252]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 408
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 408
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 408
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 408
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 408
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 408
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-256], OFFSET FLAT:CommonInterruptHandler52
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+416]
	mov	eax, DWORD PTR [ebp-256]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+416]
	mov	eax, DWORD PTR [ebp-256]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 416
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 416
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 416
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 416
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 416
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 416
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-260], OFFSET FLAT:CommonInterruptHandler53
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+424]
	mov	eax, DWORD PTR [ebp-260]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+424]
	mov	eax, DWORD PTR [ebp-260]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 424
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 424
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 424
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 424
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 424
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 424
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-264], OFFSET FLAT:CommonInterruptHandler54
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+432]
	mov	eax, DWORD PTR [ebp-264]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+432]
	mov	eax, DWORD PTR [ebp-264]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 432
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 432
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 432
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 432
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 432
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 432
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-268], OFFSET FLAT:CommonInterruptHandler55
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+440]
	mov	eax, DWORD PTR [ebp-268]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+440]
	mov	eax, DWORD PTR [ebp-268]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 440
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 440
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 440
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 440
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 440
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 440
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-272], OFFSET FLAT:CommonInterruptHandler56
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+448]
	mov	eax, DWORD PTR [ebp-272]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+448]
	mov	eax, DWORD PTR [ebp-272]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 448
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 448
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 448
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 448
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 448
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 448
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-276], OFFSET FLAT:CommonInterruptHandler57
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+456]
	mov	eax, DWORD PTR [ebp-276]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+456]
	mov	eax, DWORD PTR [ebp-276]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 456
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 456
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 456
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 456
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 456
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 456
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-280], OFFSET FLAT:CommonInterruptHandler58
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+464]
	mov	eax, DWORD PTR [ebp-280]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+464]
	mov	eax, DWORD PTR [ebp-280]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 464
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 464
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 464
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 464
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 464
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 464
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-284], OFFSET FLAT:CommonInterruptHandler59
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+472]
	mov	eax, DWORD PTR [ebp-284]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+472]
	mov	eax, DWORD PTR [ebp-284]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 472
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 472
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 472
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 472
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 472
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 472
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-288], OFFSET FLAT:CommonInterruptHandler60
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+480]
	mov	eax, DWORD PTR [ebp-288]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+480]
	mov	eax, DWORD PTR [ebp-288]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 480
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 480
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 480
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 480
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 480
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 480
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-292], OFFSET FLAT:CommonInterruptHandler61
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+488]
	mov	eax, DWORD PTR [ebp-292]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+488]
	mov	eax, DWORD PTR [ebp-292]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 488
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 488
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 488
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 488
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 488
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 488
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-296], OFFSET FLAT:CommonInterruptHandler62
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+496]
	mov	eax, DWORD PTR [ebp-296]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+496]
	mov	eax, DWORD PTR [ebp-296]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 496
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 496
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 496
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 496
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 496
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 496
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-300], OFFSET FLAT:CommonInterruptHandler63
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+504]
	mov	eax, DWORD PTR [ebp-300]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+504]
	mov	eax, DWORD PTR [ebp-300]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 504
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 504
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 504
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 504
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 504
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 504
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-304], OFFSET FLAT:CommonInterruptHandler64
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+512]
	mov	eax, DWORD PTR [ebp-304]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+512]
	mov	eax, DWORD PTR [ebp-304]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 512
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 512
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 512
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 512
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 512
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 512
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-308], OFFSET FLAT:CommonInterruptHandler65
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+520]
	mov	eax, DWORD PTR [ebp-308]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+520]
	mov	eax, DWORD PTR [ebp-308]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 520
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 520
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 520
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 520
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 520
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 520
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-312], OFFSET FLAT:CommonInterruptHandler66
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+528]
	mov	eax, DWORD PTR [ebp-312]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+528]
	mov	eax, DWORD PTR [ebp-312]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 528
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 528
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 528
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 528
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 528
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 528
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-316], OFFSET FLAT:CommonInterruptHandler67
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+536]
	mov	eax, DWORD PTR [ebp-316]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+536]
	mov	eax, DWORD PTR [ebp-316]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 536
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 536
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 536
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 536
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 536
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 536
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-320], OFFSET FLAT:CommonInterruptHandler68
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+544]
	mov	eax, DWORD PTR [ebp-320]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+544]
	mov	eax, DWORD PTR [ebp-320]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 544
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 544
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 544
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 544
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 544
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 544
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-324], OFFSET FLAT:CommonInterruptHandler69
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+552]
	mov	eax, DWORD PTR [ebp-324]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+552]
	mov	eax, DWORD PTR [ebp-324]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 552
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 552
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 552
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 552
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 552
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 552
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-328], OFFSET FLAT:CommonInterruptHandler70
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+560]
	mov	eax, DWORD PTR [ebp-328]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+560]
	mov	eax, DWORD PTR [ebp-328]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 560
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 560
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 560
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 560
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 560
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 560
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-332], OFFSET FLAT:CommonInterruptHandler71
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+568]
	mov	eax, DWORD PTR [ebp-332]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+568]
	mov	eax, DWORD PTR [ebp-332]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 568
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 568
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 568
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 568
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 568
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 568
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-336], OFFSET FLAT:CommonInterruptHandler72
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+576]
	mov	eax, DWORD PTR [ebp-336]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+576]
	mov	eax, DWORD PTR [ebp-336]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 576
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 576
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 576
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 576
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 576
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 576
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-340], OFFSET FLAT:CommonInterruptHandler73
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+584]
	mov	eax, DWORD PTR [ebp-340]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+584]
	mov	eax, DWORD PTR [ebp-340]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 584
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 584
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 584
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 584
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 584
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 584
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-344], OFFSET FLAT:CommonInterruptHandler74
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+592]
	mov	eax, DWORD PTR [ebp-344]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+592]
	mov	eax, DWORD PTR [ebp-344]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 592
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 592
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 592
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 592
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 592
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 592
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-348], OFFSET FLAT:CommonInterruptHandler75
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+600]
	mov	eax, DWORD PTR [ebp-348]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+600]
	mov	eax, DWORD PTR [ebp-348]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 600
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 600
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 600
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 600
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 600
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 600
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-352], OFFSET FLAT:CommonInterruptHandler76
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+608]
	mov	eax, DWORD PTR [ebp-352]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+608]
	mov	eax, DWORD PTR [ebp-352]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 608
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 608
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 608
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 608
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 608
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 608
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-356], OFFSET FLAT:CommonInterruptHandler77
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+616]
	mov	eax, DWORD PTR [ebp-356]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+616]
	mov	eax, DWORD PTR [ebp-356]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 616
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 616
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 616
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 616
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 616
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 616
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-360], OFFSET FLAT:CommonInterruptHandler78
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+624]
	mov	eax, DWORD PTR [ebp-360]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+624]
	mov	eax, DWORD PTR [ebp-360]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 624
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 624
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 624
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 624
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 624
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 624
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-364], OFFSET FLAT:CommonInterruptHandler79
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+632]
	mov	eax, DWORD PTR [ebp-364]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+632]
	mov	eax, DWORD PTR [ebp-364]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 632
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 632
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 632
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 632
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 632
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 632
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-368], OFFSET FLAT:CommonInterruptHandler80
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+640]
	mov	eax, DWORD PTR [ebp-368]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+640]
	mov	eax, DWORD PTR [ebp-368]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 640
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 640
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 640
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 640
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 640
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 640
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-372], OFFSET FLAT:CommonInterruptHandler81
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+648]
	mov	eax, DWORD PTR [ebp-372]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+648]
	mov	eax, DWORD PTR [ebp-372]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 648
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 648
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 648
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 648
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 648
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 648
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-376], OFFSET FLAT:CommonInterruptHandler82
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+656]
	mov	eax, DWORD PTR [ebp-376]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+656]
	mov	eax, DWORD PTR [ebp-376]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 656
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 656
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 656
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 656
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 656
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 656
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-380], OFFSET FLAT:CommonInterruptHandler83
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+664]
	mov	eax, DWORD PTR [ebp-380]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+664]
	mov	eax, DWORD PTR [ebp-380]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 664
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 664
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 664
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 664
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 664
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 664
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-384], OFFSET FLAT:CommonInterruptHandler84
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+672]
	mov	eax, DWORD PTR [ebp-384]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+672]
	mov	eax, DWORD PTR [ebp-384]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 672
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 672
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 672
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 672
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 672
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 672
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-388], OFFSET FLAT:CommonInterruptHandler85
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+680]
	mov	eax, DWORD PTR [ebp-388]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+680]
	mov	eax, DWORD PTR [ebp-388]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 680
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 680
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 680
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 680
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 680
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 680
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-392], OFFSET FLAT:CommonInterruptHandler86
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+688]
	mov	eax, DWORD PTR [ebp-392]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+688]
	mov	eax, DWORD PTR [ebp-392]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 688
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 688
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 688
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 688
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 688
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 688
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-396], OFFSET FLAT:CommonInterruptHandler87
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+696]
	mov	eax, DWORD PTR [ebp-396]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+696]
	mov	eax, DWORD PTR [ebp-396]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 696
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 696
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 696
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 696
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 696
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 696
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-400], OFFSET FLAT:CommonInterruptHandler88
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+704]
	mov	eax, DWORD PTR [ebp-400]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+704]
	mov	eax, DWORD PTR [ebp-400]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 704
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 704
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 704
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 704
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 704
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 704
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-404], OFFSET FLAT:CommonInterruptHandler89
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+712]
	mov	eax, DWORD PTR [ebp-404]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+712]
	mov	eax, DWORD PTR [ebp-404]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 712
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 712
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 712
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 712
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 712
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 712
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-408], OFFSET FLAT:CommonInterruptHandler90
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+720]
	mov	eax, DWORD PTR [ebp-408]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+720]
	mov	eax, DWORD PTR [ebp-408]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 720
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 720
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 720
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 720
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 720
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 720
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-412], OFFSET FLAT:CommonInterruptHandler91
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+728]
	mov	eax, DWORD PTR [ebp-412]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+728]
	mov	eax, DWORD PTR [ebp-412]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 728
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 728
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 728
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 728
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 728
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 728
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-416], OFFSET FLAT:CommonInterruptHandler92
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+736]
	mov	eax, DWORD PTR [ebp-416]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+736]
	mov	eax, DWORD PTR [ebp-416]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 736
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 736
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 736
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 736
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 736
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 736
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-420], OFFSET FLAT:CommonInterruptHandler93
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+744]
	mov	eax, DWORD PTR [ebp-420]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+744]
	mov	eax, DWORD PTR [ebp-420]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 744
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 744
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 744
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 744
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 744
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 744
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-424], OFFSET FLAT:CommonInterruptHandler94
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+752]
	mov	eax, DWORD PTR [ebp-424]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+752]
	mov	eax, DWORD PTR [ebp-424]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 752
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 752
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 752
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 752
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 752
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 752
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-428], OFFSET FLAT:CommonInterruptHandler95
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+760]
	mov	eax, DWORD PTR [ebp-428]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+760]
	mov	eax, DWORD PTR [ebp-428]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 760
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 760
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 760
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 760
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 760
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 760
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-432], OFFSET FLAT:CommonInterruptHandler96
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+768]
	mov	eax, DWORD PTR [ebp-432]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+768]
	mov	eax, DWORD PTR [ebp-432]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 768
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 768
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 768
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 768
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 768
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 768
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-436], OFFSET FLAT:CommonInterruptHandler97
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+776]
	mov	eax, DWORD PTR [ebp-436]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+776]
	mov	eax, DWORD PTR [ebp-436]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 776
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 776
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 776
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 776
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 776
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 776
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-440], OFFSET FLAT:CommonInterruptHandler98
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+784]
	mov	eax, DWORD PTR [ebp-440]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+784]
	mov	eax, DWORD PTR [ebp-440]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 784
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 784
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 784
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 784
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 784
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 784
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-444], OFFSET FLAT:CommonInterruptHandler99
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+792]
	mov	eax, DWORD PTR [ebp-444]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+792]
	mov	eax, DWORD PTR [ebp-444]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 792
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 792
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 792
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 792
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 792
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 792
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-448], OFFSET FLAT:CommonInterruptHandler100
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+800]
	mov	eax, DWORD PTR [ebp-448]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+800]
	mov	eax, DWORD PTR [ebp-448]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 800
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 800
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 800
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 800
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 800
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 800
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-452], OFFSET FLAT:CommonInterruptHandler101
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+808]
	mov	eax, DWORD PTR [ebp-452]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+808]
	mov	eax, DWORD PTR [ebp-452]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 808
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 808
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 808
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 808
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 808
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 808
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-456], OFFSET FLAT:CommonInterruptHandler102
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+816]
	mov	eax, DWORD PTR [ebp-456]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+816]
	mov	eax, DWORD PTR [ebp-456]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 816
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 816
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 816
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 816
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 816
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 816
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-460], OFFSET FLAT:CommonInterruptHandler103
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+824]
	mov	eax, DWORD PTR [ebp-460]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+824]
	mov	eax, DWORD PTR [ebp-460]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 824
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 824
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 824
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 824
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 824
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 824
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-464], OFFSET FLAT:CommonInterruptHandler104
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+832]
	mov	eax, DWORD PTR [ebp-464]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+832]
	mov	eax, DWORD PTR [ebp-464]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 832
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 832
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 832
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 832
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 832
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 832
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-468], OFFSET FLAT:CommonInterruptHandler105
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+840]
	mov	eax, DWORD PTR [ebp-468]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+840]
	mov	eax, DWORD PTR [ebp-468]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 840
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 840
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 840
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 840
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 840
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 840
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-472], OFFSET FLAT:CommonInterruptHandler106
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+848]
	mov	eax, DWORD PTR [ebp-472]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+848]
	mov	eax, DWORD PTR [ebp-472]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 848
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 848
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 848
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 848
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 848
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 848
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-476], OFFSET FLAT:CommonInterruptHandler107
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+856]
	mov	eax, DWORD PTR [ebp-476]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+856]
	mov	eax, DWORD PTR [ebp-476]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 856
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 856
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 856
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 856
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 856
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 856
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-480], OFFSET FLAT:CommonInterruptHandler108
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+864]
	mov	eax, DWORD PTR [ebp-480]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+864]
	mov	eax, DWORD PTR [ebp-480]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 864
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 864
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 864
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 864
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 864
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 864
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-484], OFFSET FLAT:CommonInterruptHandler109
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+872]
	mov	eax, DWORD PTR [ebp-484]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+872]
	mov	eax, DWORD PTR [ebp-484]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 872
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 872
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 872
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 872
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 872
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 872
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-488], OFFSET FLAT:CommonInterruptHandler110
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+880]
	mov	eax, DWORD PTR [ebp-488]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+880]
	mov	eax, DWORD PTR [ebp-488]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 880
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 880
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 880
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 880
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 880
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 880
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-492], OFFSET FLAT:CommonInterruptHandler111
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+888]
	mov	eax, DWORD PTR [ebp-492]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+888]
	mov	eax, DWORD PTR [ebp-492]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 888
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 888
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 888
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 888
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 888
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 888
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-496], OFFSET FLAT:CommonInterruptHandler112
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+896]
	mov	eax, DWORD PTR [ebp-496]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+896]
	mov	eax, DWORD PTR [ebp-496]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 896
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 896
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 896
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 896
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 896
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 896
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-500], OFFSET FLAT:CommonInterruptHandler113
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+904]
	mov	eax, DWORD PTR [ebp-500]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+904]
	mov	eax, DWORD PTR [ebp-500]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 904
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 904
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 904
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 904
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 904
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 904
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-504], OFFSET FLAT:CommonInterruptHandler114
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+912]
	mov	eax, DWORD PTR [ebp-504]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+912]
	mov	eax, DWORD PTR [ebp-504]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 912
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 912
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 912
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 912
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 912
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 912
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-508], OFFSET FLAT:CommonInterruptHandler115
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+920]
	mov	eax, DWORD PTR [ebp-508]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+920]
	mov	eax, DWORD PTR [ebp-508]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 920
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 920
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 920
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 920
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 920
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 920
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-512], OFFSET FLAT:CommonInterruptHandler116
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+928]
	mov	eax, DWORD PTR [ebp-512]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+928]
	mov	eax, DWORD PTR [ebp-512]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 928
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 928
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 928
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 928
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 928
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 928
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-516], OFFSET FLAT:CommonInterruptHandler117
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+936]
	mov	eax, DWORD PTR [ebp-516]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+936]
	mov	eax, DWORD PTR [ebp-516]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 936
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 936
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 936
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 936
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 936
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 936
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-520], OFFSET FLAT:CommonInterruptHandler118
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+944]
	mov	eax, DWORD PTR [ebp-520]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+944]
	mov	eax, DWORD PTR [ebp-520]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 944
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 944
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 944
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 944
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 944
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 944
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-524], OFFSET FLAT:CommonInterruptHandler119
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+952]
	mov	eax, DWORD PTR [ebp-524]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+952]
	mov	eax, DWORD PTR [ebp-524]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 952
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 952
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 952
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 952
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 952
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 952
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-528], OFFSET FLAT:CommonInterruptHandler120
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+960]
	mov	eax, DWORD PTR [ebp-528]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+960]
	mov	eax, DWORD PTR [ebp-528]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 960
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 960
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 960
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 960
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 960
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 960
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-532], OFFSET FLAT:CommonInterruptHandler121
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+968]
	mov	eax, DWORD PTR [ebp-532]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+968]
	mov	eax, DWORD PTR [ebp-532]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 968
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 968
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 968
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 968
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 968
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 968
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-536], OFFSET FLAT:CommonInterruptHandler122
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+976]
	mov	eax, DWORD PTR [ebp-536]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+976]
	mov	eax, DWORD PTR [ebp-536]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 976
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 976
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 976
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 976
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 976
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 976
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-540], OFFSET FLAT:CommonInterruptHandler123
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+984]
	mov	eax, DWORD PTR [ebp-540]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+984]
	mov	eax, DWORD PTR [ebp-540]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 984
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 984
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 984
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 984
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 984
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 984
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-544], OFFSET FLAT:CommonInterruptHandler124
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+992]
	mov	eax, DWORD PTR [ebp-544]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+992]
	mov	eax, DWORD PTR [ebp-544]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 992
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 992
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 992
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 992
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 992
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 992
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-548], OFFSET FLAT:CommonInterruptHandler125
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1000]
	mov	eax, DWORD PTR [ebp-548]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1000]
	mov	eax, DWORD PTR [ebp-548]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1000
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1000
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1000
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1000
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1000
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1000
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-552], OFFSET FLAT:CommonInterruptHandler126
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1008]
	mov	eax, DWORD PTR [ebp-552]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1008]
	mov	eax, DWORD PTR [ebp-552]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1008
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1008
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1008
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1008
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1008
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1008
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-556], OFFSET FLAT:CommonInterruptHandler127
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1016]
	mov	eax, DWORD PTR [ebp-556]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1016]
	mov	eax, DWORD PTR [ebp-556]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1016
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1016
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1016
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1016
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1016
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1016
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-560], OFFSET FLAT:CommonInterruptHandler128
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1024]
	mov	eax, DWORD PTR [ebp-560]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1024]
	mov	eax, DWORD PTR [ebp-560]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1024
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1024
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1024
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1024
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1024
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1024
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-564], OFFSET FLAT:CommonInterruptHandler129
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1032]
	mov	eax, DWORD PTR [ebp-564]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1032]
	mov	eax, DWORD PTR [ebp-564]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1032
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1032
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1032
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1032
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1032
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1032
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-568], OFFSET FLAT:CommonInterruptHandler130
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1040]
	mov	eax, DWORD PTR [ebp-568]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1040]
	mov	eax, DWORD PTR [ebp-568]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1040
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1040
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1040
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1040
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1040
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1040
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-572], OFFSET FLAT:CommonInterruptHandler131
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1048]
	mov	eax, DWORD PTR [ebp-572]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1048]
	mov	eax, DWORD PTR [ebp-572]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1048
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1048
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1048
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1048
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1048
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1048
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-576], OFFSET FLAT:CommonInterruptHandler132
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1056]
	mov	eax, DWORD PTR [ebp-576]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1056]
	mov	eax, DWORD PTR [ebp-576]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1056
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1056
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1056
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1056
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1056
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1056
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-580], OFFSET FLAT:CommonInterruptHandler133
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1064]
	mov	eax, DWORD PTR [ebp-580]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1064]
	mov	eax, DWORD PTR [ebp-580]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1064
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1064
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1064
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1064
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1064
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1064
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-584], OFFSET FLAT:CommonInterruptHandler134
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1072]
	mov	eax, DWORD PTR [ebp-584]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1072]
	mov	eax, DWORD PTR [ebp-584]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1072
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1072
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1072
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1072
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1072
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1072
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-588], OFFSET FLAT:CommonInterruptHandler135
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1080]
	mov	eax, DWORD PTR [ebp-588]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1080]
	mov	eax, DWORD PTR [ebp-588]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1080
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1080
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1080
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1080
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1080
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1080
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-592], OFFSET FLAT:CommonInterruptHandler136
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1088]
	mov	eax, DWORD PTR [ebp-592]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1088]
	mov	eax, DWORD PTR [ebp-592]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1088
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1088
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1088
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1088
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1088
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1088
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-596], OFFSET FLAT:CommonInterruptHandler137
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1096]
	mov	eax, DWORD PTR [ebp-596]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1096]
	mov	eax, DWORD PTR [ebp-596]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1096
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1096
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1096
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1096
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1096
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1096
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-600], OFFSET FLAT:CommonInterruptHandler138
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1104]
	mov	eax, DWORD PTR [ebp-600]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1104]
	mov	eax, DWORD PTR [ebp-600]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1104
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1104
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1104
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1104
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1104
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1104
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-604], OFFSET FLAT:CommonInterruptHandler139
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1112]
	mov	eax, DWORD PTR [ebp-604]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1112]
	mov	eax, DWORD PTR [ebp-604]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1112
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1112
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1112
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1112
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1112
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1112
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-608], OFFSET FLAT:CommonInterruptHandler140
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1120]
	mov	eax, DWORD PTR [ebp-608]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1120]
	mov	eax, DWORD PTR [ebp-608]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1120
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1120
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1120
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1120
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1120
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1120
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-612], OFFSET FLAT:CommonInterruptHandler141
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1128]
	mov	eax, DWORD PTR [ebp-612]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1128]
	mov	eax, DWORD PTR [ebp-612]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1128
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1128
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1128
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1128
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1128
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1128
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-616], OFFSET FLAT:CommonInterruptHandler142
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1136]
	mov	eax, DWORD PTR [ebp-616]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1136]
	mov	eax, DWORD PTR [ebp-616]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1136
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1136
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1136
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1136
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1136
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1136
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-620], OFFSET FLAT:CommonInterruptHandler143
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1144]
	mov	eax, DWORD PTR [ebp-620]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1144]
	mov	eax, DWORD PTR [ebp-620]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1144
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1144
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1144
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1144
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1144
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1144
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-624], OFFSET FLAT:CommonInterruptHandler144
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1152]
	mov	eax, DWORD PTR [ebp-624]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1152]
	mov	eax, DWORD PTR [ebp-624]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1152
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1152
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1152
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1152
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1152
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1152
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-628], OFFSET FLAT:CommonInterruptHandler145
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1160]
	mov	eax, DWORD PTR [ebp-628]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1160]
	mov	eax, DWORD PTR [ebp-628]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1160
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1160
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1160
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1160
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1160
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1160
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-632], OFFSET FLAT:CommonInterruptHandler146
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1168]
	mov	eax, DWORD PTR [ebp-632]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1168]
	mov	eax, DWORD PTR [ebp-632]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1168
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1168
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1168
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1168
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1168
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1168
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-636], OFFSET FLAT:CommonInterruptHandler147
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1176]
	mov	eax, DWORD PTR [ebp-636]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1176]
	mov	eax, DWORD PTR [ebp-636]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1176
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1176
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1176
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1176
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1176
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1176
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-640], OFFSET FLAT:CommonInterruptHandler148
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1184]
	mov	eax, DWORD PTR [ebp-640]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1184]
	mov	eax, DWORD PTR [ebp-640]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1184
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1184
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1184
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1184
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1184
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1184
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-644], OFFSET FLAT:CommonInterruptHandler149
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1192]
	mov	eax, DWORD PTR [ebp-644]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1192]
	mov	eax, DWORD PTR [ebp-644]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1192
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1192
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1192
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1192
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1192
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1192
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-648], OFFSET FLAT:CommonInterruptHandler150
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1200]
	mov	eax, DWORD PTR [ebp-648]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1200]
	mov	eax, DWORD PTR [ebp-648]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1200
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1200
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1200
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1200
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1200
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1200
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-652], OFFSET FLAT:CommonInterruptHandler151
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1208]
	mov	eax, DWORD PTR [ebp-652]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1208]
	mov	eax, DWORD PTR [ebp-652]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1208
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1208
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1208
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1208
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1208
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1208
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-656], OFFSET FLAT:CommonInterruptHandler152
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1216]
	mov	eax, DWORD PTR [ebp-656]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1216]
	mov	eax, DWORD PTR [ebp-656]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1216
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1216
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1216
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1216
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1216
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1216
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-660], OFFSET FLAT:CommonInterruptHandler153
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1224]
	mov	eax, DWORD PTR [ebp-660]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1224]
	mov	eax, DWORD PTR [ebp-660]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1224
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1224
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1224
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1224
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1224
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1224
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-664], OFFSET FLAT:CommonInterruptHandler154
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1232]
	mov	eax, DWORD PTR [ebp-664]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1232]
	mov	eax, DWORD PTR [ebp-664]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1232
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1232
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1232
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1232
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1232
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1232
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-668], OFFSET FLAT:CommonInterruptHandler155
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1240]
	mov	eax, DWORD PTR [ebp-668]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1240]
	mov	eax, DWORD PTR [ebp-668]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1240
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1240
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1240
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1240
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1240
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1240
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-672], OFFSET FLAT:CommonInterruptHandler156
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1248]
	mov	eax, DWORD PTR [ebp-672]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1248]
	mov	eax, DWORD PTR [ebp-672]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1248
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1248
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1248
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1248
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1248
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1248
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-676], OFFSET FLAT:CommonInterruptHandler157
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1256]
	mov	eax, DWORD PTR [ebp-676]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1256]
	mov	eax, DWORD PTR [ebp-676]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1256
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1256
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1256
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1256
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1256
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1256
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-680], OFFSET FLAT:CommonInterruptHandler158
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1264]
	mov	eax, DWORD PTR [ebp-680]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1264]
	mov	eax, DWORD PTR [ebp-680]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1264
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1264
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1264
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1264
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1264
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1264
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-684], OFFSET FLAT:CommonInterruptHandler159
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1272]
	mov	eax, DWORD PTR [ebp-684]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1272]
	mov	eax, DWORD PTR [ebp-684]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1272
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1272
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1272
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1272
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1272
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1272
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-688], OFFSET FLAT:CommonInterruptHandler160
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1280]
	mov	eax, DWORD PTR [ebp-688]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1280]
	mov	eax, DWORD PTR [ebp-688]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1280
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1280
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1280
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1280
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1280
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1280
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-692], OFFSET FLAT:CommonInterruptHandler161
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1288]
	mov	eax, DWORD PTR [ebp-692]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1288]
	mov	eax, DWORD PTR [ebp-692]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1288
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1288
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1288
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1288
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1288
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1288
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-696], OFFSET FLAT:CommonInterruptHandler162
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1296]
	mov	eax, DWORD PTR [ebp-696]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1296]
	mov	eax, DWORD PTR [ebp-696]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1296
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1296
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1296
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1296
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1296
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1296
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-700], OFFSET FLAT:CommonInterruptHandler163
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1304]
	mov	eax, DWORD PTR [ebp-700]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1304]
	mov	eax, DWORD PTR [ebp-700]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1304
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1304
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1304
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1304
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1304
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1304
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-704], OFFSET FLAT:CommonInterruptHandler164
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1312]
	mov	eax, DWORD PTR [ebp-704]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1312]
	mov	eax, DWORD PTR [ebp-704]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1312
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1312
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1312
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1312
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1312
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1312
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-708], OFFSET FLAT:CommonInterruptHandler165
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1320]
	mov	eax, DWORD PTR [ebp-708]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1320]
	mov	eax, DWORD PTR [ebp-708]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1320
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1320
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1320
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1320
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1320
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1320
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-712], OFFSET FLAT:CommonInterruptHandler166
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1328]
	mov	eax, DWORD PTR [ebp-712]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1328]
	mov	eax, DWORD PTR [ebp-712]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1328
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1328
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1328
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1328
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1328
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1328
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-716], OFFSET FLAT:CommonInterruptHandler167
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1336]
	mov	eax, DWORD PTR [ebp-716]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1336]
	mov	eax, DWORD PTR [ebp-716]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1336
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1336
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1336
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1336
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1336
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1336
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-720], OFFSET FLAT:CommonInterruptHandler168
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1344]
	mov	eax, DWORD PTR [ebp-720]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1344]
	mov	eax, DWORD PTR [ebp-720]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1344
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1344
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1344
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1344
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1344
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1344
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-724], OFFSET FLAT:CommonInterruptHandler169
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1352]
	mov	eax, DWORD PTR [ebp-724]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1352]
	mov	eax, DWORD PTR [ebp-724]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1352
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1352
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1352
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1352
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1352
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1352
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-728], OFFSET FLAT:CommonInterruptHandler170
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1360]
	mov	eax, DWORD PTR [ebp-728]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1360]
	mov	eax, DWORD PTR [ebp-728]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1360
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1360
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1360
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1360
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1360
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1360
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-732], OFFSET FLAT:CommonInterruptHandler171
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1368]
	mov	eax, DWORD PTR [ebp-732]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1368]
	mov	eax, DWORD PTR [ebp-732]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1368
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1368
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1368
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1368
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1368
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1368
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-736], OFFSET FLAT:CommonInterruptHandler172
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1376]
	mov	eax, DWORD PTR [ebp-736]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1376]
	mov	eax, DWORD PTR [ebp-736]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1376
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1376
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1376
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1376
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1376
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1376
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-740], OFFSET FLAT:CommonInterruptHandler173
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1384]
	mov	eax, DWORD PTR [ebp-740]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1384]
	mov	eax, DWORD PTR [ebp-740]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1384
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1384
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1384
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1384
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1384
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1384
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-744], OFFSET FLAT:CommonInterruptHandler174
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1392]
	mov	eax, DWORD PTR [ebp-744]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1392]
	mov	eax, DWORD PTR [ebp-744]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1392
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1392
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1392
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1392
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1392
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1392
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-748], OFFSET FLAT:CommonInterruptHandler175
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1400]
	mov	eax, DWORD PTR [ebp-748]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1400]
	mov	eax, DWORD PTR [ebp-748]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1400
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1400
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1400
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1400
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1400
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1400
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-752], OFFSET FLAT:CommonInterruptHandler176
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1408]
	mov	eax, DWORD PTR [ebp-752]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1408]
	mov	eax, DWORD PTR [ebp-752]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1408
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1408
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1408
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1408
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1408
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1408
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-756], OFFSET FLAT:CommonInterruptHandler177
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1416]
	mov	eax, DWORD PTR [ebp-756]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1416]
	mov	eax, DWORD PTR [ebp-756]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1416
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1416
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1416
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1416
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1416
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1416
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-760], OFFSET FLAT:CommonInterruptHandler178
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1424]
	mov	eax, DWORD PTR [ebp-760]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1424]
	mov	eax, DWORD PTR [ebp-760]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1424
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1424
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1424
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1424
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1424
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1424
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-764], OFFSET FLAT:CommonInterruptHandler179
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1432]
	mov	eax, DWORD PTR [ebp-764]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1432]
	mov	eax, DWORD PTR [ebp-764]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1432
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1432
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1432
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1432
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1432
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1432
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-768], OFFSET FLAT:CommonInterruptHandler180
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1440]
	mov	eax, DWORD PTR [ebp-768]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1440]
	mov	eax, DWORD PTR [ebp-768]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1440
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1440
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1440
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1440
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1440
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1440
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-772], OFFSET FLAT:CommonInterruptHandler181
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1448]
	mov	eax, DWORD PTR [ebp-772]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1448]
	mov	eax, DWORD PTR [ebp-772]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1448
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1448
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1448
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1448
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1448
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1448
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-776], OFFSET FLAT:CommonInterruptHandler182
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1456]
	mov	eax, DWORD PTR [ebp-776]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1456]
	mov	eax, DWORD PTR [ebp-776]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1456
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1456
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1456
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1456
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1456
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1456
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-780], OFFSET FLAT:CommonInterruptHandler183
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1464]
	mov	eax, DWORD PTR [ebp-780]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1464]
	mov	eax, DWORD PTR [ebp-780]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1464
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1464
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1464
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1464
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1464
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1464
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-784], OFFSET FLAT:CommonInterruptHandler184
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1472]
	mov	eax, DWORD PTR [ebp-784]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1472]
	mov	eax, DWORD PTR [ebp-784]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1472
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1472
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1472
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1472
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1472
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1472
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-788], OFFSET FLAT:CommonInterruptHandler185
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1480]
	mov	eax, DWORD PTR [ebp-788]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1480]
	mov	eax, DWORD PTR [ebp-788]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1480
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1480
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1480
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1480
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1480
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1480
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-792], OFFSET FLAT:CommonInterruptHandler186
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1488]
	mov	eax, DWORD PTR [ebp-792]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1488]
	mov	eax, DWORD PTR [ebp-792]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1488
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1488
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1488
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1488
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1488
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1488
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-796], OFFSET FLAT:CommonInterruptHandler187
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1496]
	mov	eax, DWORD PTR [ebp-796]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1496]
	mov	eax, DWORD PTR [ebp-796]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1496
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1496
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1496
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1496
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1496
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1496
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-800], OFFSET FLAT:CommonInterruptHandler188
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1504]
	mov	eax, DWORD PTR [ebp-800]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1504]
	mov	eax, DWORD PTR [ebp-800]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1504
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1504
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1504
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1504
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1504
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1504
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-804], OFFSET FLAT:CommonInterruptHandler189
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1512]
	mov	eax, DWORD PTR [ebp-804]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1512]
	mov	eax, DWORD PTR [ebp-804]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1512
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1512
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1512
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1512
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1512
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1512
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-808], OFFSET FLAT:CommonInterruptHandler190
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1520]
	mov	eax, DWORD PTR [ebp-808]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1520]
	mov	eax, DWORD PTR [ebp-808]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1520
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1520
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1520
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1520
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1520
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1520
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-812], OFFSET FLAT:CommonInterruptHandler191
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1528]
	mov	eax, DWORD PTR [ebp-812]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1528]
	mov	eax, DWORD PTR [ebp-812]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1528
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1528
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1528
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1528
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1528
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1528
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-816], OFFSET FLAT:CommonInterruptHandler192
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1536]
	mov	eax, DWORD PTR [ebp-816]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1536]
	mov	eax, DWORD PTR [ebp-816]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1536
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1536
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1536
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1536
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1536
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1536
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-820], OFFSET FLAT:CommonInterruptHandler193
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1544]
	mov	eax, DWORD PTR [ebp-820]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1544]
	mov	eax, DWORD PTR [ebp-820]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1544
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1544
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1544
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1544
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1544
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1544
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-824], OFFSET FLAT:CommonInterruptHandler194
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1552]
	mov	eax, DWORD PTR [ebp-824]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1552]
	mov	eax, DWORD PTR [ebp-824]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1552
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1552
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1552
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1552
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1552
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1552
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-828], OFFSET FLAT:CommonInterruptHandler195
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1560]
	mov	eax, DWORD PTR [ebp-828]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1560]
	mov	eax, DWORD PTR [ebp-828]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1560
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1560
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1560
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1560
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1560
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1560
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-832], OFFSET FLAT:CommonInterruptHandler196
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1568]
	mov	eax, DWORD PTR [ebp-832]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1568]
	mov	eax, DWORD PTR [ebp-832]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1568
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1568
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1568
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1568
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1568
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1568
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-836], OFFSET FLAT:CommonInterruptHandler197
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1576]
	mov	eax, DWORD PTR [ebp-836]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1576]
	mov	eax, DWORD PTR [ebp-836]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1576
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1576
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1576
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1576
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1576
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1576
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-840], OFFSET FLAT:CommonInterruptHandler198
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1584]
	mov	eax, DWORD PTR [ebp-840]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1584]
	mov	eax, DWORD PTR [ebp-840]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1584
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1584
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1584
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1584
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1584
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1584
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-844], OFFSET FLAT:CommonInterruptHandler199
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1592]
	mov	eax, DWORD PTR [ebp-844]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1592]
	mov	eax, DWORD PTR [ebp-844]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1592
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1592
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1592
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1592
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1592
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1592
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-848], OFFSET FLAT:CommonInterruptHandler200
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1600]
	mov	eax, DWORD PTR [ebp-848]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1600]
	mov	eax, DWORD PTR [ebp-848]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1600
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1600
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1600
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1600
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1600
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1600
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-852], OFFSET FLAT:CommonInterruptHandler201
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1608]
	mov	eax, DWORD PTR [ebp-852]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1608]
	mov	eax, DWORD PTR [ebp-852]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1608
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1608
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1608
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1608
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1608
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1608
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-856], OFFSET FLAT:CommonInterruptHandler202
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1616]
	mov	eax, DWORD PTR [ebp-856]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1616]
	mov	eax, DWORD PTR [ebp-856]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1616
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1616
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1616
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1616
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1616
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1616
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-860], OFFSET FLAT:CommonInterruptHandler203
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1624]
	mov	eax, DWORD PTR [ebp-860]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1624]
	mov	eax, DWORD PTR [ebp-860]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1624
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1624
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1624
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1624
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1624
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1624
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-864], OFFSET FLAT:CommonInterruptHandler204
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1632]
	mov	eax, DWORD PTR [ebp-864]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1632]
	mov	eax, DWORD PTR [ebp-864]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1632
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1632
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1632
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1632
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1632
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1632
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-868], OFFSET FLAT:CommonInterruptHandler205
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1640]
	mov	eax, DWORD PTR [ebp-868]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1640]
	mov	eax, DWORD PTR [ebp-868]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1640
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1640
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1640
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1640
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1640
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1640
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-872], OFFSET FLAT:CommonInterruptHandler206
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1648]
	mov	eax, DWORD PTR [ebp-872]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1648]
	mov	eax, DWORD PTR [ebp-872]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1648
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1648
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1648
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1648
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1648
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1648
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-876], OFFSET FLAT:CommonInterruptHandler207
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1656]
	mov	eax, DWORD PTR [ebp-876]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1656]
	mov	eax, DWORD PTR [ebp-876]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1656
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1656
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1656
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1656
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1656
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1656
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-880], OFFSET FLAT:CommonInterruptHandler208
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1664]
	mov	eax, DWORD PTR [ebp-880]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1664]
	mov	eax, DWORD PTR [ebp-880]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1664
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1664
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1664
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1664
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1664
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1664
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-884], OFFSET FLAT:CommonInterruptHandler209
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1672]
	mov	eax, DWORD PTR [ebp-884]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1672]
	mov	eax, DWORD PTR [ebp-884]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1672
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1672
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1672
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1672
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1672
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1672
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-888], OFFSET FLAT:CommonInterruptHandler210
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1680]
	mov	eax, DWORD PTR [ebp-888]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1680]
	mov	eax, DWORD PTR [ebp-888]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1680
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1680
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1680
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1680
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1680
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1680
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-892], OFFSET FLAT:CommonInterruptHandler211
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1688]
	mov	eax, DWORD PTR [ebp-892]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1688]
	mov	eax, DWORD PTR [ebp-892]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1688
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1688
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1688
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1688
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1688
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1688
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-896], OFFSET FLAT:CommonInterruptHandler212
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1696]
	mov	eax, DWORD PTR [ebp-896]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1696]
	mov	eax, DWORD PTR [ebp-896]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1696
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1696
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1696
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1696
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1696
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1696
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-900], OFFSET FLAT:CommonInterruptHandler213
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1704]
	mov	eax, DWORD PTR [ebp-900]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1704]
	mov	eax, DWORD PTR [ebp-900]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1704
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1704
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1704
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1704
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1704
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1704
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-904], OFFSET FLAT:CommonInterruptHandler214
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1712]
	mov	eax, DWORD PTR [ebp-904]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1712]
	mov	eax, DWORD PTR [ebp-904]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1712
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1712
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1712
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1712
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1712
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1712
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-908], OFFSET FLAT:CommonInterruptHandler215
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1720]
	mov	eax, DWORD PTR [ebp-908]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1720]
	mov	eax, DWORD PTR [ebp-908]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1720
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1720
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1720
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1720
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1720
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1720
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-912], OFFSET FLAT:CommonInterruptHandler216
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1728]
	mov	eax, DWORD PTR [ebp-912]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1728]
	mov	eax, DWORD PTR [ebp-912]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1728
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1728
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1728
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1728
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1728
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1728
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-916], OFFSET FLAT:CommonInterruptHandler217
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1736]
	mov	eax, DWORD PTR [ebp-916]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1736]
	mov	eax, DWORD PTR [ebp-916]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1736
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1736
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1736
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1736
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1736
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1736
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-920], OFFSET FLAT:CommonInterruptHandler218
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1744]
	mov	eax, DWORD PTR [ebp-920]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1744]
	mov	eax, DWORD PTR [ebp-920]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1744
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1744
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1744
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1744
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1744
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1744
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-924], OFFSET FLAT:CommonInterruptHandler219
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1752]
	mov	eax, DWORD PTR [ebp-924]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1752]
	mov	eax, DWORD PTR [ebp-924]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1752
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1752
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1752
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1752
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1752
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1752
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-928], OFFSET FLAT:CommonInterruptHandler220
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1760]
	mov	eax, DWORD PTR [ebp-928]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1760]
	mov	eax, DWORD PTR [ebp-928]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1760
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1760
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1760
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1760
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1760
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1760
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-932], OFFSET FLAT:CommonInterruptHandler221
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1768]
	mov	eax, DWORD PTR [ebp-932]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1768]
	mov	eax, DWORD PTR [ebp-932]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1768
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1768
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1768
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1768
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1768
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1768
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-936], OFFSET FLAT:CommonInterruptHandler222
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1776]
	mov	eax, DWORD PTR [ebp-936]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1776]
	mov	eax, DWORD PTR [ebp-936]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1776
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1776
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1776
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1776
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1776
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1776
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-940], OFFSET FLAT:CommonInterruptHandler223
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1784]
	mov	eax, DWORD PTR [ebp-940]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1784]
	mov	eax, DWORD PTR [ebp-940]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1784
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1784
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1784
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1784
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1784
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1784
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-944], OFFSET FLAT:CommonInterruptHandler224
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1792]
	mov	eax, DWORD PTR [ebp-944]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1792]
	mov	eax, DWORD PTR [ebp-944]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1792
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1792
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1792
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1792
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1792
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1792
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-948], OFFSET FLAT:CommonInterruptHandler225
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1800]
	mov	eax, DWORD PTR [ebp-948]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1800]
	mov	eax, DWORD PTR [ebp-948]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1800
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1800
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1800
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1800
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1800
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1800
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-952], OFFSET FLAT:CommonInterruptHandler226
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1808]
	mov	eax, DWORD PTR [ebp-952]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1808]
	mov	eax, DWORD PTR [ebp-952]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1808
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1808
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1808
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1808
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1808
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1808
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-956], OFFSET FLAT:CommonInterruptHandler227
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1816]
	mov	eax, DWORD PTR [ebp-956]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1816]
	mov	eax, DWORD PTR [ebp-956]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1816
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1816
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1816
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1816
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1816
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1816
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-960], OFFSET FLAT:CommonInterruptHandler228
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1824]
	mov	eax, DWORD PTR [ebp-960]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1824]
	mov	eax, DWORD PTR [ebp-960]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1824
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1824
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1824
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1824
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1824
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1824
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-964], OFFSET FLAT:CommonInterruptHandler229
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1832]
	mov	eax, DWORD PTR [ebp-964]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1832]
	mov	eax, DWORD PTR [ebp-964]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1832
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1832
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1832
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1832
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1832
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1832
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-968], OFFSET FLAT:CommonInterruptHandler230
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1840]
	mov	eax, DWORD PTR [ebp-968]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1840]
	mov	eax, DWORD PTR [ebp-968]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1840
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1840
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1840
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1840
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1840
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1840
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-972], OFFSET FLAT:CommonInterruptHandler231
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1848]
	mov	eax, DWORD PTR [ebp-972]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1848]
	mov	eax, DWORD PTR [ebp-972]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1848
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1848
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1848
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1848
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1848
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1848
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-976], OFFSET FLAT:CommonInterruptHandler232
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1856]
	mov	eax, DWORD PTR [ebp-976]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1856]
	mov	eax, DWORD PTR [ebp-976]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1856
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1856
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1856
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1856
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1856
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1856
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-980], OFFSET FLAT:CommonInterruptHandler233
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1864]
	mov	eax, DWORD PTR [ebp-980]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1864]
	mov	eax, DWORD PTR [ebp-980]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1864
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1864
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1864
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1864
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1864
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1864
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-984], OFFSET FLAT:CommonInterruptHandler234
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1872]
	mov	eax, DWORD PTR [ebp-984]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1872]
	mov	eax, DWORD PTR [ebp-984]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1872
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1872
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1872
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1872
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1872
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1872
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-988], OFFSET FLAT:CommonInterruptHandler235
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1880]
	mov	eax, DWORD PTR [ebp-988]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1880]
	mov	eax, DWORD PTR [ebp-988]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1880
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1880
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1880
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1880
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1880
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1880
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-992], OFFSET FLAT:CommonInterruptHandler236
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1888]
	mov	eax, DWORD PTR [ebp-992]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1888]
	mov	eax, DWORD PTR [ebp-992]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1888
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1888
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1888
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1888
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1888
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1888
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-996], OFFSET FLAT:CommonInterruptHandler237
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1896]
	mov	eax, DWORD PTR [ebp-996]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1896]
	mov	eax, DWORD PTR [ebp-996]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1896
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1896
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1896
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1896
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1896
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1896
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1000], OFFSET FLAT:CommonInterruptHandler238
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1904]
	mov	eax, DWORD PTR [ebp-1000]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1904]
	mov	eax, DWORD PTR [ebp-1000]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1904
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1904
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1904
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1904
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1904
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1904
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1004], OFFSET FLAT:CommonInterruptHandler239
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1912]
	mov	eax, DWORD PTR [ebp-1004]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1912]
	mov	eax, DWORD PTR [ebp-1004]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1912
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1912
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1912
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1912
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1912
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1912
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1008], OFFSET FLAT:CommonInterruptHandler240
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1920]
	mov	eax, DWORD PTR [ebp-1008]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1920]
	mov	eax, DWORD PTR [ebp-1008]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1920
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1920
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1920
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1920
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1920
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1920
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1012], OFFSET FLAT:CommonInterruptHandler241
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1928]
	mov	eax, DWORD PTR [ebp-1012]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1928]
	mov	eax, DWORD PTR [ebp-1012]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1928
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1928
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1928
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1928
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1928
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1928
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1016], OFFSET FLAT:CommonInterruptHandler242
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1936]
	mov	eax, DWORD PTR [ebp-1016]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1936]
	mov	eax, DWORD PTR [ebp-1016]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1936
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1936
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1936
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1936
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1936
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1936
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1020], OFFSET FLAT:CommonInterruptHandler243
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1944]
	mov	eax, DWORD PTR [ebp-1020]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1944]
	mov	eax, DWORD PTR [ebp-1020]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1944
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1944
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1944
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1944
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1944
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1944
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1024], OFFSET FLAT:CommonInterruptHandler244
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1952]
	mov	eax, DWORD PTR [ebp-1024]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1952]
	mov	eax, DWORD PTR [ebp-1024]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1952
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1952
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1952
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1952
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1952
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1952
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1028], OFFSET FLAT:CommonInterruptHandler245
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1960]
	mov	eax, DWORD PTR [ebp-1028]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1960]
	mov	eax, DWORD PTR [ebp-1028]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1960
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1960
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1960
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1960
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1960
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1960
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1032], OFFSET FLAT:CommonInterruptHandler246
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1968]
	mov	eax, DWORD PTR [ebp-1032]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1968]
	mov	eax, DWORD PTR [ebp-1032]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1968
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1968
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1968
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1968
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1968
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1968
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1036], OFFSET FLAT:CommonInterruptHandler247
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1976]
	mov	eax, DWORD PTR [ebp-1036]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1976]
	mov	eax, DWORD PTR [ebp-1036]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1976
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1976
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1976
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1976
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1976
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1976
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1040], OFFSET FLAT:CommonInterruptHandler248
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1984]
	mov	eax, DWORD PTR [ebp-1040]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1984]
	mov	eax, DWORD PTR [ebp-1040]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1984
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1984
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1984
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1984
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1984
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1984
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1044], OFFSET FLAT:CommonInterruptHandler249
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1992]
	mov	eax, DWORD PTR [ebp-1044]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+1992]
	mov	eax, DWORD PTR [ebp-1044]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1992
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1992
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1992
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1992
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1992
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 1992
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1048], OFFSET FLAT:CommonInterruptHandler250
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+2000]
	mov	eax, DWORD PTR [ebp-1048]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+2000]
	mov	eax, DWORD PTR [ebp-1048]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2000
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2000
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2000
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2000
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2000
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2000
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1052], OFFSET FLAT:CommonInterruptHandler251
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+2008]
	mov	eax, DWORD PTR [ebp-1052]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+2008]
	mov	eax, DWORD PTR [ebp-1052]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2008
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2008
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2008
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2008
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2008
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2008
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1056], OFFSET FLAT:CommonInterruptHandler252
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+2016]
	mov	eax, DWORD PTR [ebp-1056]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+2016]
	mov	eax, DWORD PTR [ebp-1056]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2016
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2016
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2016
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2016
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2016
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2016
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1060], OFFSET FLAT:CommonInterruptHandler253
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+2024]
	mov	eax, DWORD PTR [ebp-1060]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+2024]
	mov	eax, DWORD PTR [ebp-1060]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2024
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2024
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2024
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2024
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2024
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2024
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1064], OFFSET FLAT:CommonInterruptHandler254
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+2032]
	mov	eax, DWORD PTR [ebp-1064]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+2032]
	mov	eax, DWORD PTR [ebp-1064]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2032
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2032
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2032
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2032
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2032
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2032
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1068], OFFSET FLAT:CommonInterruptHandler255
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+2040]
	mov	eax, DWORD PTR [ebp-1068]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-44]
	lea	edx, [eax+2040]
	mov	eax, DWORD PTR [ebp-1068]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2040
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2040
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2040
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2040
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2040
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-44]
	add	eax, 2040
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR IDT_Pointer
	mov	DWORD PTR [ebp-1072], eax
	mov	eax, DWORD PTR [ebp-1072]
	mov	WORD PTR [eax], 2047
	mov	eax, DWORD PTR [ebp-1072]
	mov	edx, DWORD PTR [ebp-44]
	mov	DWORD PTR [eax+4], edx
/APP
/  975 "main.c" 1
	lea EAX, [IDT_Pointer]
lidt [EAX]

/  0 "" 2
/  987 "main.c" 1
	mov AL, 0x11
outb 0x20, AL

/  0 "" 2
/  988 "main.c" 1
	mov AL, 0x11
outb 0xA0, AL

/  0 "" 2
/  990 "main.c" 1
	mov AL, 0x20
outb 0x21, AL

/  0 "" 2
/  991 "main.c" 1
	mov AL, 0x28
outb 0xA1, AL

/  0 "" 2
/  993 "main.c" 1
	mov AL, 0x04
outb 0x21, AL

/  0 "" 2
/  994 "main.c" 1
	mov AL, 0x02
outb 0xA1, AL

/  0 "" 2
/  996 "main.c" 1
	mov AL, 0x01
outb 0x21, AL

/  0 "" 2
/  997 "main.c" 1
	mov AL, 0x01
outb 0xA1, AL

/  0 "" 2
/  999 "main.c" 1
	mov AL, 0xFF
outb 0x21, AL

/  0 "" 2
/  1000 "main.c" 1
	mov AL, 0xFF
outb 0xA1, AL

/  0 "" 2
/  1002 "main.c" 1
	sti
nop

/  0 "" 2
/  1007 "main.c" 1
	cli
nop

/  0 "" 2
/  1009 "main.c" 1
	in AL, 0x21
and AL, 0xFE
out 0x21, AL

/  0 "" 2
/  1016 "main.c" 1
	mov AL, 0x34
outb 0x43, AL

/  0 "" 2
/  1017 "main.c" 1
	mov AL, 0xFF
outb 0x40, AL

/  0 "" 2
/  1018 "main.c" 1
	mov AL, 0xFF
outb 0x40, AL

/  0 "" 2
/  1020 "main.c" 1
	sti
nop

/  0 "" 2
/NO_APP
.L279:
	mov	DWORD PTR [ebp-12], 48
	jmp	.L277
.L278:
	mov	eax, DWORD PTR [ebp-12]
	movzx	eax, al
	mov	DWORD PTR [esp], eax
	call	IssueInterrupt
	add	DWORD PTR [ebp-12], 1
.L277:
	cmp	DWORD PTR [ebp-12], 254
	jbe	.L278
	jmp	.L279
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.2"
