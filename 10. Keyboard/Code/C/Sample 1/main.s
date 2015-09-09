	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	outb
	.type	outb, @function
outb:
.LFB0:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp+12]
	mov	WORD PTR [ebp-4], dx
	mov	BYTE PTR [ebp-8], al
/APP
/  34 "main.c" 1
	mov AL, [ebp+12]
mov DX, [ebp+8]
outb DX, AL

/  0 "" 2
/NO_APP
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	outb, .-outb
	.globl	Delay
	.type	Delay, @function
Delay:
.LFB1:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	mov	DWORD PTR [ebp-4], 4194304
	nop
.L3:
	mov	eax, DWORD PTR [ebp-4]
	lea	edx, [eax-1]
	mov	DWORD PTR [ebp-4], edx
	test	eax, eax
	jne	.L3
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	Delay, .-Delay
	.globl	DisplayColourArea
	.type	DisplayColourArea, @function
DisplayColourArea:
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
	jmp	.L5
.L7:
	mov	eax, DWORD PTR [ebp-4]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-4], edx
	lea	edx, [eax+eax]
	mov	eax, DWORD PTR [ebp-12]
	add	eax, edx
	movzx	edx, BYTE PTR [ebp-5]
	sal	edx, 8
	mov	WORD PTR [eax], dx
.L5:
	cmp	DWORD PTR [ebp-4], 1999
	ja	.L4
	mov	eax, DWORD PTR [ebp+20]
	mov	edx, DWORD PTR [ebp+16]
	add	eax, edx
	cmp	eax, DWORD PTR [ebp-4]
	ja	.L7
.L4:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	DisplayColourArea, .-DisplayColourArea
	.globl	DisplayColour
	.type	DisplayColour, @function
DisplayColour:
.LFB3:
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
.LFE3:
	.size	DisplayColour, .-DisplayColour
	.globl	CommonInterruptHandler
	.type	CommonInterruptHandler, @function
CommonInterruptHandler:
.LFB4:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 40
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
	cmp	DWORD PTR [ebp+8], 33
	jne	.L10
/APP
/  398 "main.c" 1
	inb AL, 0x60
mov byte ptr [EBP-9], al

/  0 "" 2
/NO_APP
	mov	BYTE PTR [ebp-17], 1
	movzx	eax, BYTE PTR [ebp-9]
	and	eax, -128
	mov	BYTE PTR [ebp-18], al
	cmp	BYTE PTR [ebp-18], 0
	je	.L11
	xor	BYTE PTR [ebp-9], -128
.L11:
	movzx	eax, BYTE PTR [ebp-9]
	mov	DWORD PTR [ebp-16], eax
	mov	eax, DWORD PTR [ebp-16]
	cmp	eax, 42
	je	.L13
	cmp	eax, 42
	ja	.L14
	cmp	eax, 29
	je	.L15
	jmp	.L12
.L14:
	cmp	eax, 54
	je	.L13
	cmp	eax, 56
	je	.L16
	jmp	.L12
.L13:
	cmp	BYTE PTR [ebp-18], 0
	sete	al
	mov	BYTE PTR shiftPressed.1668, al
	mov	BYTE PTR [ebp-17], 0
	jmp	.L17
.L15:
	cmp	BYTE PTR [ebp-18], 0
	sete	al
	mov	BYTE PTR ctrlPressed.1669, al
	mov	BYTE PTR [ebp-17], 0
	jmp	.L17
.L16:
	cmp	BYTE PTR [ebp-18], 0
	sete	al
	mov	BYTE PTR altPressed.1670, al
	mov	BYTE PTR [ebp-17], 0
	jmp	.L17
.L12:
	cmp	BYTE PTR [ebp-18], 0
	jne	.L18
	movzx	eax, BYTE PTR shiftPressed.1668
	test	al, al
	je	.L20
	sal	DWORD PTR [ebp-16], 16
	jmp	.L160
.L18:
	mov	BYTE PTR [ebp-17], 0
	jmp	.L160
.L20:
.L160:
	nop
.L17:
	cmp	BYTE PTR [ebp-17], 0
	je	.L10
	mov	eax, DWORD PTR [ebp-16]
	cmp	eax, 57
	je	.L22
	cmp	eax, 57
	ja	.L23
	cmp	eax, 26
	je	.L24
	cmp	eax, 26
	ja	.L25
	cmp	eax, 13
	je	.L26
	cmp	eax, 13
	ja	.L27
	cmp	eax, 7
	je	.L28
	cmp	eax, 7
	ja	.L29
	cmp	eax, 4
	je	.L30
	cmp	eax, 4
	ja	.L31
	cmp	eax, 2
	je	.L32
	cmp	eax, 3
	je	.L33
	jmp	.L21
.L31:
	cmp	eax, 5
	je	.L34
	cmp	eax, 6
	je	.L35
	jmp	.L21
.L29:
	cmp	eax, 10
	je	.L36
	cmp	eax, 10
	ja	.L37
	cmp	eax, 8
	je	.L38
	cmp	eax, 9
	je	.L39
	jmp	.L21
.L37:
	cmp	eax, 11
	je	.L40
	cmp	eax, 12
	je	.L41
	jmp	.L21
.L27:
	cmp	eax, 19
	je	.L42
	cmp	eax, 19
	ja	.L43
	cmp	eax, 16
	je	.L44
	cmp	eax, 16
	ja	.L45
	cmp	eax, 14
	je	.L46
	cmp	eax, 15
	je	.L47
	jmp	.L21
.L45:
	cmp	eax, 17
	je	.L48
	cmp	eax, 18
	je	.L49
	jmp	.L21
.L43:
	cmp	eax, 22
	je	.L50
	cmp	eax, 22
	ja	.L51
	cmp	eax, 20
	je	.L52
	cmp	eax, 21
	je	.L53
	jmp	.L21
.L51:
	cmp	eax, 24
	je	.L54
	cmp	eax, 24
	ja	.L55
	jmp	.L158
.L25:
	cmp	eax, 40
	je	.L57
	cmp	eax, 40
	ja	.L58
	cmp	eax, 33
	je	.L59
	cmp	eax, 33
	ja	.L60
	cmp	eax, 30
	je	.L61
	cmp	eax, 30
	ja	.L62
	cmp	eax, 27
	je	.L63
	cmp	eax, 28
	je	.L64
	jmp	.L21
.L62:
	cmp	eax, 31
	je	.L65
	cmp	eax, 32
	je	.L66
	jmp	.L21
.L60:
	cmp	eax, 36
	je	.L67
	cmp	eax, 36
	ja	.L68
	cmp	eax, 34
	je	.L69
	cmp	eax, 35
	je	.L70
	jmp	.L21
.L68:
	cmp	eax, 38
	je	.L71
	cmp	eax, 38
	ja	.L72
	jmp	.L159
.L58:
	cmp	eax, 47
	je	.L74
	cmp	eax, 47
	ja	.L75
	cmp	eax, 44
	je	.L76
	cmp	eax, 44
	ja	.L77
	cmp	eax, 41
	je	.L78
	cmp	eax, 43
	je	.L79
	jmp	.L21
.L77:
	cmp	eax, 45
	je	.L80
	cmp	eax, 46
	je	.L81
	jmp	.L21
.L75:
	cmp	eax, 50
	je	.L82
	cmp	eax, 50
	ja	.L83
	cmp	eax, 48
	je	.L84
	cmp	eax, 49
	je	.L85
	jmp	.L21
.L83:
	cmp	eax, 52
	je	.L86
	cmp	eax, 52
	jb	.L87
	cmp	eax, 53
	je	.L88
	jmp	.L21
.L23:
	cmp	eax, 1769472
	je	.L89
	cmp	eax, 1769472
	ja	.L90
	cmp	eax, 917504
	je	.L91
	cmp	eax, 917504
	ja	.L92
	cmp	eax, 458752
	je	.L93
	cmp	eax, 458752
	ja	.L94
	cmp	eax, 262144
	je	.L95
	cmp	eax, 262144
	ja	.L96
	cmp	eax, 131072
	je	.L97
	cmp	eax, 196608
	je	.L98
	jmp	.L21
.L96:
	cmp	eax, 327680
	je	.L99
	cmp	eax, 393216
	je	.L100
	jmp	.L21
.L94:
	cmp	eax, 655360
	je	.L101
	cmp	eax, 655360
	ja	.L102
	cmp	eax, 524288
	je	.L103
	cmp	eax, 589824
	je	.L104
	jmp	.L21
.L102:
	cmp	eax, 786432
	je	.L105
	cmp	eax, 851968
	je	.L106
	cmp	eax, 720896
	je	.L107
	jmp	.L21
.L92:
	cmp	eax, 1310720
	je	.L108
	cmp	eax, 1310720
	ja	.L109
	cmp	eax, 1114112
	je	.L110
	cmp	eax, 1114112
	ja	.L111
	cmp	eax, 983040
	je	.L112
	cmp	eax, 1048576
	je	.L113
	jmp	.L21
.L111:
	cmp	eax, 1179648
	je	.L114
	cmp	eax, 1245184
	je	.L115
	jmp	.L21
.L109:
	cmp	eax, 1507328
	je	.L116
	cmp	eax, 1507328
	ja	.L117
	cmp	eax, 1376256
	je	.L118
	cmp	eax, 1441792
	je	.L119
	jmp	.L21
.L117:
	cmp	eax, 1638400
	je	.L120
	cmp	eax, 1703936
	je	.L121
	cmp	eax, 1572864
	je	.L122
	jmp	.L21
.L90:
	cmp	eax, 2686976
	je	.L123
	cmp	eax, 2686976
	ja	.L124
	cmp	eax, 2228224
	je	.L125
	cmp	eax, 2228224
	ja	.L126
	cmp	eax, 2031616
	je	.L127
	cmp	eax, 2031616
	ja	.L128
	cmp	eax, 1835008
	je	.L129
	cmp	eax, 1966080
	je	.L130
	jmp	.L21
.L128:
	cmp	eax, 2097152
	je	.L131
	cmp	eax, 2162688
	je	.L132
	jmp	.L21
.L126:
	cmp	eax, 2424832
	je	.L133
	cmp	eax, 2424832
	ja	.L134
	cmp	eax, 2293760
	je	.L135
	cmp	eax, 2359296
	je	.L136
	jmp	.L21
.L134:
	cmp	eax, 2555904
	je	.L137
	cmp	eax, 2621440
	je	.L138
	cmp	eax, 2490368
	je	.L139
	jmp	.L21
.L124:
	cmp	eax, 3145728
	je	.L140
	cmp	eax, 3145728
	ja	.L141
	cmp	eax, 2949120
	je	.L142
	cmp	eax, 2949120
	ja	.L143
	cmp	eax, 2818048
	je	.L144
	cmp	eax, 2883584
	je	.L145
	jmp	.L21
.L143:
	cmp	eax, 3014656
	je	.L146
	cmp	eax, 3080192
	je	.L147
	jmp	.L21
.L141:
	cmp	eax, 3342336
	je	.L148
	cmp	eax, 3342336
	ja	.L149
	cmp	eax, 3211264
	je	.L150
	cmp	eax, 3276800
	je	.L151
	jmp	.L21
.L149:
	cmp	eax, 3473408
	je	.L152
	cmp	eax, 3735552
	je	.L153
	cmp	eax, 3407872
	je	.L154
	jmp	.L21
.L44:
	mov	BYTE PTR [ebp-20], 113
	jmp	.L155
.L113:
	mov	BYTE PTR [ebp-20], 81
	jmp	.L155
.L48:
	mov	BYTE PTR [ebp-20], 119
	jmp	.L155
.L110:
	mov	BYTE PTR [ebp-20], 87
	jmp	.L155
.L49:
	mov	BYTE PTR [ebp-20], 101
	jmp	.L155
.L114:
	mov	BYTE PTR [ebp-20], 69
	jmp	.L155
.L42:
	mov	BYTE PTR [ebp-20], 114
	jmp	.L155
.L115:
	mov	BYTE PTR [ebp-20], 82
	jmp	.L155
.L52:
	mov	BYTE PTR [ebp-20], 116
	jmp	.L155
.L108:
	mov	BYTE PTR [ebp-20], 84
	jmp	.L155
.L53:
	mov	BYTE PTR [ebp-20], 121
	jmp	.L155
.L118:
	mov	BYTE PTR [ebp-20], 89
	jmp	.L155
.L50:
	mov	BYTE PTR [ebp-20], 117
	jmp	.L155
.L119:
	mov	BYTE PTR [ebp-20], 85
	jmp	.L155
.L158:
	mov	BYTE PTR [ebp-20], 105
	jmp	.L155
.L116:
	mov	BYTE PTR [ebp-20], 73
	jmp	.L155
.L54:
	mov	BYTE PTR [ebp-20], 111
	jmp	.L155
.L122:
	mov	BYTE PTR [ebp-20], 79
	jmp	.L155
.L55:
	mov	BYTE PTR [ebp-20], 112
	jmp	.L155
.L120:
	mov	BYTE PTR [ebp-20], 80
	jmp	.L155
.L61:
	mov	BYTE PTR [ebp-20], 97
	jmp	.L155
.L130:
	mov	BYTE PTR [ebp-20], 65
	jmp	.L155
.L65:
	mov	BYTE PTR [ebp-20], 115
	jmp	.L155
.L127:
	mov	BYTE PTR [ebp-20], 83
	jmp	.L155
.L66:
	mov	BYTE PTR [ebp-20], 100
	jmp	.L155
.L131:
	mov	BYTE PTR [ebp-20], 68
	jmp	.L155
.L59:
	mov	BYTE PTR [ebp-20], 102
	jmp	.L155
.L132:
	mov	BYTE PTR [ebp-20], 70
	jmp	.L155
.L69:
	mov	BYTE PTR [ebp-20], 103
	jmp	.L155
.L125:
	mov	BYTE PTR [ebp-20], 71
	jmp	.L155
.L70:
	mov	BYTE PTR [ebp-20], 104
	jmp	.L155
.L135:
	mov	BYTE PTR [ebp-20], 72
	jmp	.L155
.L67:
	mov	BYTE PTR [ebp-20], 106
	jmp	.L155
.L136:
	mov	BYTE PTR [ebp-20], 74
	jmp	.L155
.L159:
	mov	BYTE PTR [ebp-20], 107
	jmp	.L155
.L133:
	mov	BYTE PTR [ebp-20], 75
	jmp	.L155
.L71:
	mov	BYTE PTR [ebp-20], 108
	jmp	.L155
.L139:
	mov	BYTE PTR [ebp-20], 76
	jmp	.L155
.L76:
	mov	BYTE PTR [ebp-20], 122
	jmp	.L155
.L145:
	mov	BYTE PTR [ebp-20], 90
	jmp	.L155
.L80:
	mov	BYTE PTR [ebp-20], 120
	jmp	.L155
.L142:
	mov	BYTE PTR [ebp-20], 88
	jmp	.L155
.L81:
	mov	BYTE PTR [ebp-20], 99
	jmp	.L155
.L146:
	mov	BYTE PTR [ebp-20], 67
	jmp	.L155
.L74:
	mov	BYTE PTR [ebp-20], 118
	jmp	.L155
.L147:
	mov	BYTE PTR [ebp-20], 86
	jmp	.L155
.L84:
	mov	BYTE PTR [ebp-20], 98
	jmp	.L155
.L140:
	mov	BYTE PTR [ebp-20], 66
	jmp	.L155
.L85:
	mov	BYTE PTR [ebp-20], 110
	jmp	.L155
.L150:
	mov	BYTE PTR [ebp-20], 78
	jmp	.L155
.L82:
	mov	BYTE PTR [ebp-20], 109
	jmp	.L155
.L151:
	mov	BYTE PTR [ebp-20], 77
	jmp	.L155
.L78:
	mov	BYTE PTR [ebp-20], 96
	jmp	.L155
.L123:
	mov	BYTE PTR [ebp-20], 63
	jmp	.L155
.L32:
	mov	BYTE PTR [ebp-20], 49
	jmp	.L155
.L97:
	mov	BYTE PTR [ebp-20], 33
	jmp	.L155
.L33:
	mov	BYTE PTR [ebp-20], 50
	jmp	.L155
.L98:
	mov	BYTE PTR [ebp-20], 34
	jmp	.L155
.L30:
	mov	BYTE PTR [ebp-20], 51
	jmp	.L155
.L95:
	mov	BYTE PTR [ebp-20], 63
	jmp	.L155
.L34:
	mov	BYTE PTR [ebp-20], 52
	jmp	.L155
.L99:
	mov	BYTE PTR [ebp-20], 36
	jmp	.L155
.L35:
	mov	BYTE PTR [ebp-20], 53
	jmp	.L155
.L100:
	mov	BYTE PTR [ebp-20], 37
	jmp	.L155
.L28:
	mov	BYTE PTR [ebp-20], 54
	jmp	.L155
.L93:
	mov	BYTE PTR [ebp-20], 94
	jmp	.L155
.L38:
	mov	BYTE PTR [ebp-20], 55
	jmp	.L155
.L103:
	mov	BYTE PTR [ebp-20], 38
	jmp	.L155
.L39:
	mov	BYTE PTR [ebp-20], 56
	jmp	.L155
.L104:
	mov	BYTE PTR [ebp-20], 42
	jmp	.L155
.L36:
	mov	BYTE PTR [ebp-20], 57
	jmp	.L155
.L101:
	mov	BYTE PTR [ebp-20], 40
	jmp	.L155
.L40:
	mov	BYTE PTR [ebp-20], 48
	jmp	.L155
.L107:
	mov	BYTE PTR [ebp-20], 41
	jmp	.L155
.L72:
	mov	BYTE PTR [ebp-20], 59
	jmp	.L155
.L137:
	mov	BYTE PTR [ebp-20], 58
	jmp	.L155
.L57:
	mov	BYTE PTR [ebp-20], 39
	jmp	.L155
.L138:
	mov	BYTE PTR [ebp-20], 64
	jmp	.L155
.L79:
	mov	BYTE PTR [ebp-20], 35
	jmp	.L155
.L144:
	mov	BYTE PTR [ebp-20], 126
	jmp	.L155
.L87:
	mov	BYTE PTR [ebp-20], 44
	jmp	.L155
.L148:
	mov	BYTE PTR [ebp-20], 60
	jmp	.L155
.L86:
	mov	BYTE PTR [ebp-20], 46
	jmp	.L155
.L154:
	mov	BYTE PTR [ebp-20], 62
	jmp	.L155
.L88:
	mov	BYTE PTR [ebp-20], 47
	jmp	.L155
.L152:
	mov	BYTE PTR [ebp-20], 63
	jmp	.L155
.L41:
	mov	BYTE PTR [ebp-20], 45
	jmp	.L155
.L105:
	mov	BYTE PTR [ebp-20], 95
	jmp	.L155
.L26:
	mov	BYTE PTR [ebp-20], 61
	jmp	.L155
.L106:
	mov	BYTE PTR [ebp-20], 43
	jmp	.L155
.L24:
	mov	BYTE PTR [ebp-20], 91
	jmp	.L155
.L121:
	mov	BYTE PTR [ebp-20], 123
	jmp	.L155
.L63:
	mov	BYTE PTR [ebp-20], 93
	jmp	.L155
.L89:
	mov	BYTE PTR [ebp-20], 125
	jmp	.L155
.L46:
	mov	BYTE PTR [ebp-20], 8
	jmp	.L155
.L47:
	mov	BYTE PTR [ebp-20], 9
	jmp	.L155
.L64:
	mov	BYTE PTR [ebp-20], 10
	jmp	.L155
.L22:
	mov	BYTE PTR [ebp-20], 32
	jmp	.L155
.L91:
	mov	BYTE PTR [ebp-20], 8
	jmp	.L155
.L112:
	mov	BYTE PTR [ebp-20], 9
	jmp	.L155
.L129:
	mov	BYTE PTR [ebp-20], 10
	jmp	.L155
.L153:
	mov	BYTE PTR [ebp-20], 32
	jmp	.L155
.L21:
	mov	BYTE PTR [ebp-20], 63
	nop
.L155:
	mov	BYTE PTR [ebp-19], 0
	lea	eax, [ebp-20]
	mov	DWORD PTR [esp], eax
	call	Print
.L10:
	cmp	DWORD PTR [ebp+8], 31
	jle	.L9
	cmp	DWORD PTR [ebp+8], 47
	jg	.L9
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp+12], 1
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], 15
	mov	DWORD PTR [esp], 4
	call	DisplayColourArea
	cmp	DWORD PTR [ebp+8], 39
	jle	.L157
	mov	DWORD PTR [esp+4], 32
	mov	DWORD PTR [esp], 160
	call	outb
.L157:
	mov	DWORD PTR [esp+4], 32
	mov	DWORD PTR [esp], 32
	call	outb
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp+12], 1
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], 15
	mov	DWORD PTR [esp], 5
	call	DisplayColourArea
.L9:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	CommonInterruptHandler, .-CommonInterruptHandler
	.globl	IssueInterrupt
	.type	IssueInterrupt, @function
IssueInterrupt:
.LFB5:
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
	ja	.L162
	mov	eax, DWORD PTR .L164[0+eax*4]
	jmp	eax
	.section	.rodata
	.align 4
	.align 4
.L164:
	.long	.L162
	.long	.L163
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
	.long	.L269
	.long	.L270
	.long	.L271
	.long	.L272
	.long	.L273
	.long	.L274
	.long	.L275
	.long	.L276
	.long	.L277
	.long	.L278
	.long	.L279
	.long	.L280
	.long	.L281
	.long	.L282
	.long	.L283
	.long	.L284
	.long	.L285
	.long	.L286
	.long	.L287
	.long	.L288
	.long	.L289
	.long	.L290
	.long	.L291
	.long	.L292
	.long	.L293
	.long	.L294
	.long	.L295
	.long	.L296
	.long	.L297
	.long	.L298
	.long	.L299
	.long	.L300
	.long	.L301
	.long	.L302
	.long	.L303
	.long	.L304
	.long	.L305
	.long	.L306
	.long	.L307
	.long	.L308
	.long	.L309
	.long	.L310
	.long	.L311
	.long	.L312
	.long	.L313
	.long	.L314
	.long	.L315
	.long	.L316
	.long	.L317
	.long	.L318
	.long	.L319
	.long	.L320
	.long	.L321
	.long	.L322
	.long	.L323
	.long	.L324
	.long	.L325
	.long	.L326
	.long	.L327
	.long	.L328
	.long	.L329
	.long	.L330
	.long	.L331
	.long	.L332
	.long	.L333
	.long	.L334
	.long	.L335
	.long	.L336
	.long	.L337
	.long	.L338
	.long	.L339
	.long	.L340
	.long	.L341
	.long	.L342
	.long	.L343
	.long	.L344
	.long	.L345
	.long	.L346
	.long	.L347
	.long	.L348
	.long	.L349
	.long	.L350
	.long	.L351
	.long	.L352
	.long	.L353
	.long	.L354
	.long	.L355
	.long	.L356
	.long	.L357
	.long	.L358
	.long	.L359
	.long	.L360
	.long	.L361
	.long	.L362
	.long	.L363
	.long	.L364
	.long	.L365
	.long	.L366
	.long	.L367
	.long	.L368
	.long	.L369
	.long	.L370
	.long	.L371
	.long	.L372
	.long	.L373
	.long	.L374
	.long	.L375
	.long	.L376
	.long	.L377
	.long	.L378
	.long	.L379
	.long	.L380
	.long	.L381
	.long	.L382
	.long	.L383
	.long	.L384
	.long	.L385
	.long	.L386
	.long	.L387
	.long	.L388
	.long	.L389
	.long	.L390
	.long	.L391
	.long	.L392
	.long	.L393
	.long	.L394
	.long	.L395
	.long	.L396
	.long	.L397
	.long	.L398
	.long	.L399
	.long	.L400
	.long	.L401
	.long	.L402
	.long	.L403
	.long	.L404
	.long	.L405
	.long	.L406
	.long	.L407
	.long	.L408
	.long	.L409
	.long	.L410
	.long	.L411
	.long	.L412
	.long	.L413
	.long	.L414
	.long	.L415
	.long	.L416
	.long	.L417
	.long	.L418
	.text
.L162:
/APP
/  598 "main.c" 1
	int 0

/  0 "" 2
/NO_APP
	jmp	.L161
.L163:
/APP
/  599 "main.c" 1
	int 1

/  0 "" 2
/NO_APP
	jmp	.L161
.L165:
/APP
/  600 "main.c" 1
	int 2

/  0 "" 2
/NO_APP
	jmp	.L161
.L166:
/APP
/  601 "main.c" 1
	int 3

/  0 "" 2
/NO_APP
	jmp	.L161
.L167:
/APP
/  602 "main.c" 1
	int 4

/  0 "" 2
/NO_APP
	jmp	.L161
.L168:
/APP
/  603 "main.c" 1
	int 5

/  0 "" 2
/NO_APP
	jmp	.L161
.L169:
/APP
/  604 "main.c" 1
	int 6

/  0 "" 2
/NO_APP
	jmp	.L161
.L170:
/APP
/  605 "main.c" 1
	int 7

/  0 "" 2
/NO_APP
	jmp	.L161
.L171:
/APP
/  606 "main.c" 1
	int 8

/  0 "" 2
/NO_APP
	jmp	.L161
.L172:
/APP
/  607 "main.c" 1
	int 9

/  0 "" 2
/NO_APP
	jmp	.L161
.L173:
/APP
/  608 "main.c" 1
	int 10

/  0 "" 2
/NO_APP
	jmp	.L161
.L174:
/APP
/  609 "main.c" 1
	int 11

/  0 "" 2
/NO_APP
	jmp	.L161
.L175:
/APP
/  610 "main.c" 1
	int 12

/  0 "" 2
/NO_APP
	jmp	.L161
.L176:
/APP
/  611 "main.c" 1
	int 13

/  0 "" 2
/NO_APP
	jmp	.L161
.L177:
/APP
/  612 "main.c" 1
	int 14

/  0 "" 2
/NO_APP
	jmp	.L161
.L178:
/APP
/  613 "main.c" 1
	int 15

/  0 "" 2
/NO_APP
	jmp	.L161
.L179:
/APP
/  614 "main.c" 1
	int 16

/  0 "" 2
/NO_APP
	jmp	.L161
.L180:
/APP
/  615 "main.c" 1
	int 17

/  0 "" 2
/NO_APP
	jmp	.L161
.L181:
/APP
/  616 "main.c" 1
	int 18

/  0 "" 2
/NO_APP
	jmp	.L161
.L182:
/APP
/  617 "main.c" 1
	int 19

/  0 "" 2
/NO_APP
	jmp	.L161
.L183:
/APP
/  618 "main.c" 1
	int 20

/  0 "" 2
/NO_APP
	jmp	.L161
.L184:
/APP
/  619 "main.c" 1
	int 21

/  0 "" 2
/NO_APP
	jmp	.L161
.L185:
/APP
/  620 "main.c" 1
	int 22

/  0 "" 2
/NO_APP
	jmp	.L161
.L186:
/APP
/  621 "main.c" 1
	int 23

/  0 "" 2
/NO_APP
	jmp	.L161
.L187:
/APP
/  622 "main.c" 1
	int 24

/  0 "" 2
/NO_APP
	jmp	.L161
.L188:
/APP
/  623 "main.c" 1
	int 25

/  0 "" 2
/NO_APP
	jmp	.L161
.L189:
/APP
/  624 "main.c" 1
	int 26

/  0 "" 2
/NO_APP
	jmp	.L161
.L190:
/APP
/  625 "main.c" 1
	int 27

/  0 "" 2
/NO_APP
	jmp	.L161
.L191:
/APP
/  626 "main.c" 1
	int 28

/  0 "" 2
/NO_APP
	jmp	.L161
.L192:
/APP
/  627 "main.c" 1
	int 29

/  0 "" 2
/NO_APP
	jmp	.L161
.L193:
/APP
/  628 "main.c" 1
	int 30

/  0 "" 2
/NO_APP
	jmp	.L161
.L194:
/APP
/  629 "main.c" 1
	int 31

/  0 "" 2
/NO_APP
	jmp	.L161
.L195:
/APP
/  630 "main.c" 1
	int 32

/  0 "" 2
/NO_APP
	jmp	.L161
.L196:
/APP
/  631 "main.c" 1
	int 33

/  0 "" 2
/NO_APP
	jmp	.L161
.L197:
/APP
/  632 "main.c" 1
	int 34

/  0 "" 2
/NO_APP
	jmp	.L161
.L198:
/APP
/  633 "main.c" 1
	int 35

/  0 "" 2
/NO_APP
	jmp	.L161
.L199:
/APP
/  634 "main.c" 1
	int 36

/  0 "" 2
/NO_APP
	jmp	.L161
.L200:
/APP
/  635 "main.c" 1
	int 37

/  0 "" 2
/NO_APP
	jmp	.L161
.L201:
/APP
/  636 "main.c" 1
	int 38

/  0 "" 2
/NO_APP
	jmp	.L161
.L202:
/APP
/  637 "main.c" 1
	int 39

/  0 "" 2
/NO_APP
	jmp	.L161
.L203:
/APP
/  638 "main.c" 1
	int 40

/  0 "" 2
/NO_APP
	jmp	.L161
.L204:
/APP
/  639 "main.c" 1
	int 41

/  0 "" 2
/NO_APP
	jmp	.L161
.L205:
/APP
/  640 "main.c" 1
	int 42

/  0 "" 2
/NO_APP
	jmp	.L161
.L206:
/APP
/  641 "main.c" 1
	int 43

/  0 "" 2
/NO_APP
	jmp	.L161
.L207:
/APP
/  642 "main.c" 1
	int 44

/  0 "" 2
/NO_APP
	jmp	.L161
.L208:
/APP
/  643 "main.c" 1
	int 45

/  0 "" 2
/NO_APP
	jmp	.L161
.L209:
/APP
/  644 "main.c" 1
	int 46

/  0 "" 2
/NO_APP
	jmp	.L161
.L210:
/APP
/  645 "main.c" 1
	int 47

/  0 "" 2
/NO_APP
	jmp	.L161
.L211:
/APP
/  646 "main.c" 1
	int 48

/  0 "" 2
/NO_APP
	jmp	.L161
.L212:
/APP
/  647 "main.c" 1
	int 49

/  0 "" 2
/NO_APP
	jmp	.L161
.L213:
/APP
/  648 "main.c" 1
	int 50

/  0 "" 2
/NO_APP
	jmp	.L161
.L214:
/APP
/  649 "main.c" 1
	int 51

/  0 "" 2
/NO_APP
	jmp	.L161
.L215:
/APP
/  650 "main.c" 1
	int 52

/  0 "" 2
/NO_APP
	jmp	.L161
.L216:
/APP
/  651 "main.c" 1
	int 53

/  0 "" 2
/NO_APP
	jmp	.L161
.L217:
/APP
/  652 "main.c" 1
	int 54

/  0 "" 2
/NO_APP
	jmp	.L161
.L218:
/APP
/  653 "main.c" 1
	int 55

/  0 "" 2
/NO_APP
	jmp	.L161
.L219:
/APP
/  654 "main.c" 1
	int 56

/  0 "" 2
/NO_APP
	jmp	.L161
.L220:
/APP
/  655 "main.c" 1
	int 57

/  0 "" 2
/NO_APP
	jmp	.L161
.L221:
/APP
/  656 "main.c" 1
	int 58

/  0 "" 2
/NO_APP
	jmp	.L161
.L222:
/APP
/  657 "main.c" 1
	int 59

/  0 "" 2
/NO_APP
	jmp	.L161
.L223:
/APP
/  658 "main.c" 1
	int 60

/  0 "" 2
/NO_APP
	jmp	.L161
.L224:
/APP
/  659 "main.c" 1
	int 61

/  0 "" 2
/NO_APP
	jmp	.L161
.L225:
/APP
/  660 "main.c" 1
	int 62

/  0 "" 2
/NO_APP
	jmp	.L161
.L226:
/APP
/  661 "main.c" 1
	int 63

/  0 "" 2
/NO_APP
	jmp	.L161
.L227:
/APP
/  662 "main.c" 1
	int 64

/  0 "" 2
/NO_APP
	jmp	.L161
.L228:
/APP
/  663 "main.c" 1
	int 65

/  0 "" 2
/NO_APP
	jmp	.L161
.L229:
/APP
/  664 "main.c" 1
	int 66

/  0 "" 2
/NO_APP
	jmp	.L161
.L230:
/APP
/  665 "main.c" 1
	int 67

/  0 "" 2
/NO_APP
	jmp	.L161
.L231:
/APP
/  666 "main.c" 1
	int 68

/  0 "" 2
/NO_APP
	jmp	.L161
.L232:
/APP
/  667 "main.c" 1
	int 69

/  0 "" 2
/NO_APP
	jmp	.L161
.L233:
/APP
/  668 "main.c" 1
	int 70

/  0 "" 2
/NO_APP
	jmp	.L161
.L234:
/APP
/  669 "main.c" 1
	int 71

/  0 "" 2
/NO_APP
	jmp	.L161
.L235:
/APP
/  670 "main.c" 1
	int 72

/  0 "" 2
/NO_APP
	jmp	.L161
.L236:
/APP
/  671 "main.c" 1
	int 73

/  0 "" 2
/NO_APP
	jmp	.L161
.L237:
/APP
/  672 "main.c" 1
	int 74

/  0 "" 2
/NO_APP
	jmp	.L161
.L238:
/APP
/  673 "main.c" 1
	int 75

/  0 "" 2
/NO_APP
	jmp	.L161
.L239:
/APP
/  674 "main.c" 1
	int 76

/  0 "" 2
/NO_APP
	jmp	.L161
.L240:
/APP
/  675 "main.c" 1
	int 77

/  0 "" 2
/NO_APP
	jmp	.L161
.L241:
/APP
/  676 "main.c" 1
	int 78

/  0 "" 2
/NO_APP
	jmp	.L161
.L242:
/APP
/  677 "main.c" 1
	int 79

/  0 "" 2
/NO_APP
	jmp	.L161
.L243:
/APP
/  678 "main.c" 1
	int 80

/  0 "" 2
/NO_APP
	jmp	.L161
.L244:
/APP
/  679 "main.c" 1
	int 81

/  0 "" 2
/NO_APP
	jmp	.L161
.L245:
/APP
/  680 "main.c" 1
	int 82

/  0 "" 2
/NO_APP
	jmp	.L161
.L246:
/APP
/  681 "main.c" 1
	int 83

/  0 "" 2
/NO_APP
	jmp	.L161
.L247:
/APP
/  682 "main.c" 1
	int 84

/  0 "" 2
/NO_APP
	jmp	.L161
.L248:
/APP
/  683 "main.c" 1
	int 85

/  0 "" 2
/NO_APP
	jmp	.L161
.L249:
/APP
/  684 "main.c" 1
	int 86

/  0 "" 2
/NO_APP
	jmp	.L161
.L250:
/APP
/  685 "main.c" 1
	int 87

/  0 "" 2
/NO_APP
	jmp	.L161
.L251:
/APP
/  686 "main.c" 1
	int 88

/  0 "" 2
/NO_APP
	jmp	.L161
.L252:
/APP
/  687 "main.c" 1
	int 89

/  0 "" 2
/NO_APP
	jmp	.L161
.L253:
/APP
/  688 "main.c" 1
	int 90

/  0 "" 2
/NO_APP
	jmp	.L161
.L254:
/APP
/  689 "main.c" 1
	int 91

/  0 "" 2
/NO_APP
	jmp	.L161
.L255:
/APP
/  690 "main.c" 1
	int 92

/  0 "" 2
/NO_APP
	jmp	.L161
.L256:
/APP
/  691 "main.c" 1
	int 93

/  0 "" 2
/NO_APP
	jmp	.L161
.L257:
/APP
/  692 "main.c" 1
	int 94

/  0 "" 2
/NO_APP
	jmp	.L161
.L258:
/APP
/  693 "main.c" 1
	int 95

/  0 "" 2
/NO_APP
	jmp	.L161
.L259:
/APP
/  694 "main.c" 1
	int 96

/  0 "" 2
/NO_APP
	jmp	.L161
.L260:
/APP
/  695 "main.c" 1
	int 97

/  0 "" 2
/NO_APP
	jmp	.L161
.L261:
/APP
/  696 "main.c" 1
	int 98

/  0 "" 2
/NO_APP
	jmp	.L161
.L262:
/APP
/  697 "main.c" 1
	int 99

/  0 "" 2
/NO_APP
	jmp	.L161
.L263:
/APP
/  698 "main.c" 1
	int 100

/  0 "" 2
/NO_APP
	jmp	.L161
.L264:
/APP
/  699 "main.c" 1
	int 101

/  0 "" 2
/NO_APP
	jmp	.L161
.L265:
/APP
/  700 "main.c" 1
	int 102

/  0 "" 2
/NO_APP
	jmp	.L161
.L266:
/APP
/  701 "main.c" 1
	int 103

/  0 "" 2
/NO_APP
	jmp	.L161
.L267:
/APP
/  702 "main.c" 1
	int 104

/  0 "" 2
/NO_APP
	jmp	.L161
.L268:
/APP
/  703 "main.c" 1
	int 105

/  0 "" 2
/NO_APP
	jmp	.L161
.L269:
/APP
/  704 "main.c" 1
	int 106

/  0 "" 2
/NO_APP
	jmp	.L161
.L270:
/APP
/  705 "main.c" 1
	int 107

/  0 "" 2
/NO_APP
	jmp	.L161
.L271:
/APP
/  706 "main.c" 1
	int 108

/  0 "" 2
/NO_APP
	jmp	.L161
.L272:
/APP
/  707 "main.c" 1
	int 109

/  0 "" 2
/NO_APP
	jmp	.L161
.L273:
/APP
/  708 "main.c" 1
	int 110

/  0 "" 2
/NO_APP
	jmp	.L161
.L274:
/APP
/  709 "main.c" 1
	int 111

/  0 "" 2
/NO_APP
	jmp	.L161
.L275:
/APP
/  710 "main.c" 1
	int 112

/  0 "" 2
/NO_APP
	jmp	.L161
.L276:
/APP
/  711 "main.c" 1
	int 113

/  0 "" 2
/NO_APP
	jmp	.L161
.L277:
/APP
/  712 "main.c" 1
	int 114

/  0 "" 2
/NO_APP
	jmp	.L161
.L278:
/APP
/  713 "main.c" 1
	int 115

/  0 "" 2
/NO_APP
	jmp	.L161
.L279:
/APP
/  714 "main.c" 1
	int 116

/  0 "" 2
/NO_APP
	jmp	.L161
.L280:
/APP
/  715 "main.c" 1
	int 117

/  0 "" 2
/NO_APP
	jmp	.L161
.L281:
/APP
/  716 "main.c" 1
	int 118

/  0 "" 2
/NO_APP
	jmp	.L161
.L282:
/APP
/  717 "main.c" 1
	int 119

/  0 "" 2
/NO_APP
	jmp	.L161
.L283:
/APP
/  718 "main.c" 1
	int 120

/  0 "" 2
/NO_APP
	jmp	.L161
.L284:
/APP
/  719 "main.c" 1
	int 121

/  0 "" 2
/NO_APP
	jmp	.L161
.L285:
/APP
/  720 "main.c" 1
	int 122

/  0 "" 2
/NO_APP
	jmp	.L161
.L286:
/APP
/  721 "main.c" 1
	int 123

/  0 "" 2
/NO_APP
	jmp	.L161
.L287:
/APP
/  722 "main.c" 1
	int 124

/  0 "" 2
/NO_APP
	jmp	.L161
.L288:
/APP
/  723 "main.c" 1
	int 125

/  0 "" 2
/NO_APP
	jmp	.L161
.L289:
/APP
/  724 "main.c" 1
	int 126

/  0 "" 2
/NO_APP
	jmp	.L161
.L290:
/APP
/  725 "main.c" 1
	int 127

/  0 "" 2
/NO_APP
	jmp	.L161
.L291:
/APP
/  726 "main.c" 1
	int 128

/  0 "" 2
/NO_APP
	jmp	.L161
.L292:
/APP
/  727 "main.c" 1
	int 129

/  0 "" 2
/NO_APP
	jmp	.L161
.L293:
/APP
/  728 "main.c" 1
	int 130

/  0 "" 2
/NO_APP
	jmp	.L161
.L294:
/APP
/  729 "main.c" 1
	int 131

/  0 "" 2
/NO_APP
	jmp	.L161
.L295:
/APP
/  730 "main.c" 1
	int 132

/  0 "" 2
/NO_APP
	jmp	.L161
.L296:
/APP
/  731 "main.c" 1
	int 133

/  0 "" 2
/NO_APP
	jmp	.L161
.L297:
/APP
/  732 "main.c" 1
	int 134

/  0 "" 2
/NO_APP
	jmp	.L161
.L298:
/APP
/  733 "main.c" 1
	int 135

/  0 "" 2
/NO_APP
	jmp	.L161
.L299:
/APP
/  734 "main.c" 1
	int 136

/  0 "" 2
/NO_APP
	jmp	.L161
.L300:
/APP
/  735 "main.c" 1
	int 137

/  0 "" 2
/NO_APP
	jmp	.L161
.L301:
/APP
/  736 "main.c" 1
	int 138

/  0 "" 2
/NO_APP
	jmp	.L161
.L302:
/APP
/  737 "main.c" 1
	int 139

/  0 "" 2
/NO_APP
	jmp	.L161
.L303:
/APP
/  738 "main.c" 1
	int 140

/  0 "" 2
/NO_APP
	jmp	.L161
.L304:
/APP
/  739 "main.c" 1
	int 141

/  0 "" 2
/NO_APP
	jmp	.L161
.L305:
/APP
/  740 "main.c" 1
	int 142

/  0 "" 2
/NO_APP
	jmp	.L161
.L306:
/APP
/  741 "main.c" 1
	int 143

/  0 "" 2
/NO_APP
	jmp	.L161
.L307:
/APP
/  742 "main.c" 1
	int 144

/  0 "" 2
/NO_APP
	jmp	.L161
.L308:
/APP
/  743 "main.c" 1
	int 145

/  0 "" 2
/NO_APP
	jmp	.L161
.L309:
/APP
/  744 "main.c" 1
	int 146

/  0 "" 2
/NO_APP
	jmp	.L161
.L310:
/APP
/  745 "main.c" 1
	int 147

/  0 "" 2
/NO_APP
	jmp	.L161
.L311:
/APP
/  746 "main.c" 1
	int 148

/  0 "" 2
/NO_APP
	jmp	.L161
.L312:
/APP
/  747 "main.c" 1
	int 149

/  0 "" 2
/NO_APP
	jmp	.L161
.L313:
/APP
/  748 "main.c" 1
	int 150

/  0 "" 2
/NO_APP
	jmp	.L161
.L314:
/APP
/  749 "main.c" 1
	int 151

/  0 "" 2
/NO_APP
	jmp	.L161
.L315:
/APP
/  750 "main.c" 1
	int 152

/  0 "" 2
/NO_APP
	jmp	.L161
.L316:
/APP
/  751 "main.c" 1
	int 153

/  0 "" 2
/NO_APP
	jmp	.L161
.L317:
/APP
/  752 "main.c" 1
	int 154

/  0 "" 2
/NO_APP
	jmp	.L161
.L318:
/APP
/  753 "main.c" 1
	int 155

/  0 "" 2
/NO_APP
	jmp	.L161
.L319:
/APP
/  754 "main.c" 1
	int 156

/  0 "" 2
/NO_APP
	jmp	.L161
.L320:
/APP
/  755 "main.c" 1
	int 157

/  0 "" 2
/NO_APP
	jmp	.L161
.L321:
/APP
/  756 "main.c" 1
	int 158

/  0 "" 2
/NO_APP
	jmp	.L161
.L322:
/APP
/  757 "main.c" 1
	int 159

/  0 "" 2
/NO_APP
	jmp	.L161
.L323:
/APP
/  758 "main.c" 1
	int 160

/  0 "" 2
/NO_APP
	jmp	.L161
.L324:
/APP
/  759 "main.c" 1
	int 161

/  0 "" 2
/NO_APP
	jmp	.L161
.L325:
/APP
/  760 "main.c" 1
	int 162

/  0 "" 2
/NO_APP
	jmp	.L161
.L326:
/APP
/  761 "main.c" 1
	int 163

/  0 "" 2
/NO_APP
	jmp	.L161
.L327:
/APP
/  762 "main.c" 1
	int 164

/  0 "" 2
/NO_APP
	jmp	.L161
.L328:
/APP
/  763 "main.c" 1
	int 165

/  0 "" 2
/NO_APP
	jmp	.L161
.L329:
/APP
/  764 "main.c" 1
	int 166

/  0 "" 2
/NO_APP
	jmp	.L161
.L330:
/APP
/  765 "main.c" 1
	int 167

/  0 "" 2
/NO_APP
	jmp	.L161
.L331:
/APP
/  766 "main.c" 1
	int 168

/  0 "" 2
/NO_APP
	jmp	.L161
.L332:
/APP
/  767 "main.c" 1
	int 169

/  0 "" 2
/NO_APP
	jmp	.L161
.L333:
/APP
/  768 "main.c" 1
	int 170

/  0 "" 2
/NO_APP
	jmp	.L161
.L334:
/APP
/  769 "main.c" 1
	int 171

/  0 "" 2
/NO_APP
	jmp	.L161
.L335:
/APP
/  770 "main.c" 1
	int 172

/  0 "" 2
/NO_APP
	jmp	.L161
.L336:
/APP
/  771 "main.c" 1
	int 173

/  0 "" 2
/NO_APP
	jmp	.L161
.L337:
/APP
/  772 "main.c" 1
	int 174

/  0 "" 2
/NO_APP
	jmp	.L161
.L338:
/APP
/  773 "main.c" 1
	int 175

/  0 "" 2
/NO_APP
	jmp	.L161
.L339:
/APP
/  774 "main.c" 1
	int 176

/  0 "" 2
/NO_APP
	jmp	.L161
.L340:
/APP
/  775 "main.c" 1
	int 177

/  0 "" 2
/NO_APP
	jmp	.L161
.L341:
/APP
/  776 "main.c" 1
	int 178

/  0 "" 2
/NO_APP
	jmp	.L161
.L342:
/APP
/  777 "main.c" 1
	int 179

/  0 "" 2
/NO_APP
	jmp	.L161
.L343:
/APP
/  778 "main.c" 1
	int 180

/  0 "" 2
/NO_APP
	jmp	.L161
.L344:
/APP
/  779 "main.c" 1
	int 181

/  0 "" 2
/NO_APP
	jmp	.L161
.L345:
/APP
/  780 "main.c" 1
	int 182

/  0 "" 2
/NO_APP
	jmp	.L161
.L346:
/APP
/  781 "main.c" 1
	int 183

/  0 "" 2
/NO_APP
	jmp	.L161
.L347:
/APP
/  782 "main.c" 1
	int 184

/  0 "" 2
/NO_APP
	jmp	.L161
.L348:
/APP
/  783 "main.c" 1
	int 185

/  0 "" 2
/NO_APP
	jmp	.L161
.L349:
/APP
/  784 "main.c" 1
	int 186

/  0 "" 2
/NO_APP
	jmp	.L161
.L350:
/APP
/  785 "main.c" 1
	int 187

/  0 "" 2
/NO_APP
	jmp	.L161
.L351:
/APP
/  786 "main.c" 1
	int 188

/  0 "" 2
/NO_APP
	jmp	.L161
.L352:
/APP
/  787 "main.c" 1
	int 189

/  0 "" 2
/NO_APP
	jmp	.L161
.L353:
/APP
/  788 "main.c" 1
	int 190

/  0 "" 2
/NO_APP
	jmp	.L161
.L354:
/APP
/  789 "main.c" 1
	int 191

/  0 "" 2
/NO_APP
	jmp	.L161
.L355:
/APP
/  790 "main.c" 1
	int 192

/  0 "" 2
/NO_APP
	jmp	.L161
.L356:
/APP
/  791 "main.c" 1
	int 193

/  0 "" 2
/NO_APP
	jmp	.L161
.L357:
/APP
/  792 "main.c" 1
	int 194

/  0 "" 2
/NO_APP
	jmp	.L161
.L358:
/APP
/  793 "main.c" 1
	int 195

/  0 "" 2
/NO_APP
	jmp	.L161
.L359:
/APP
/  794 "main.c" 1
	int 196

/  0 "" 2
/NO_APP
	jmp	.L161
.L360:
/APP
/  795 "main.c" 1
	int 197

/  0 "" 2
/NO_APP
	jmp	.L161
.L361:
/APP
/  796 "main.c" 1
	int 198

/  0 "" 2
/NO_APP
	jmp	.L161
.L362:
/APP
/  797 "main.c" 1
	int 199

/  0 "" 2
/NO_APP
	jmp	.L161
.L363:
/APP
/  798 "main.c" 1
	int 200

/  0 "" 2
/NO_APP
	jmp	.L161
.L364:
/APP
/  799 "main.c" 1
	int 201

/  0 "" 2
/NO_APP
	jmp	.L161
.L365:
/APP
/  800 "main.c" 1
	int 202

/  0 "" 2
/NO_APP
	jmp	.L161
.L366:
/APP
/  801 "main.c" 1
	int 203

/  0 "" 2
/NO_APP
	jmp	.L161
.L367:
/APP
/  802 "main.c" 1
	int 204

/  0 "" 2
/NO_APP
	jmp	.L161
.L368:
/APP
/  803 "main.c" 1
	int 205

/  0 "" 2
/NO_APP
	jmp	.L161
.L369:
/APP
/  804 "main.c" 1
	int 206

/  0 "" 2
/NO_APP
	jmp	.L161
.L370:
/APP
/  805 "main.c" 1
	int 207

/  0 "" 2
/NO_APP
	jmp	.L161
.L371:
/APP
/  806 "main.c" 1
	int 208

/  0 "" 2
/NO_APP
	jmp	.L161
.L372:
/APP
/  807 "main.c" 1
	int 209

/  0 "" 2
/NO_APP
	jmp	.L161
.L373:
/APP
/  808 "main.c" 1
	int 210

/  0 "" 2
/NO_APP
	jmp	.L161
.L374:
/APP
/  809 "main.c" 1
	int 211

/  0 "" 2
/NO_APP
	jmp	.L161
.L375:
/APP
/  810 "main.c" 1
	int 212

/  0 "" 2
/NO_APP
	jmp	.L161
.L376:
/APP
/  811 "main.c" 1
	int 213

/  0 "" 2
/NO_APP
	jmp	.L161
.L377:
/APP
/  812 "main.c" 1
	int 214

/  0 "" 2
/NO_APP
	jmp	.L161
.L378:
/APP
/  813 "main.c" 1
	int 215

/  0 "" 2
/NO_APP
	jmp	.L161
.L379:
/APP
/  814 "main.c" 1
	int 216

/  0 "" 2
/NO_APP
	jmp	.L161
.L380:
/APP
/  815 "main.c" 1
	int 217

/  0 "" 2
/NO_APP
	jmp	.L161
.L381:
/APP
/  816 "main.c" 1
	int 218

/  0 "" 2
/NO_APP
	jmp	.L161
.L382:
/APP
/  817 "main.c" 1
	int 219

/  0 "" 2
/NO_APP
	jmp	.L161
.L383:
/APP
/  818 "main.c" 1
	int 220

/  0 "" 2
/NO_APP
	jmp	.L161
.L384:
/APP
/  819 "main.c" 1
	int 221

/  0 "" 2
/NO_APP
	jmp	.L161
.L385:
/APP
/  820 "main.c" 1
	int 222

/  0 "" 2
/NO_APP
	jmp	.L161
.L386:
/APP
/  821 "main.c" 1
	int 223

/  0 "" 2
/NO_APP
	jmp	.L161
.L387:
/APP
/  822 "main.c" 1
	int 224

/  0 "" 2
/NO_APP
	jmp	.L161
.L388:
/APP
/  823 "main.c" 1
	int 225

/  0 "" 2
/NO_APP
	jmp	.L161
.L389:
/APP
/  824 "main.c" 1
	int 226

/  0 "" 2
/NO_APP
	jmp	.L161
.L390:
/APP
/  825 "main.c" 1
	int 227

/  0 "" 2
/NO_APP
	jmp	.L161
.L391:
/APP
/  826 "main.c" 1
	int 228

/  0 "" 2
/NO_APP
	jmp	.L161
.L392:
/APP
/  827 "main.c" 1
	int 229

/  0 "" 2
/NO_APP
	jmp	.L161
.L393:
/APP
/  828 "main.c" 1
	int 230

/  0 "" 2
/NO_APP
	jmp	.L161
.L394:
/APP
/  829 "main.c" 1
	int 231

/  0 "" 2
/NO_APP
	jmp	.L161
.L395:
/APP
/  830 "main.c" 1
	int 232

/  0 "" 2
/NO_APP
	jmp	.L161
.L396:
/APP
/  831 "main.c" 1
	int 233

/  0 "" 2
/NO_APP
	jmp	.L161
.L397:
/APP
/  832 "main.c" 1
	int 234

/  0 "" 2
/NO_APP
	jmp	.L161
.L398:
/APP
/  833 "main.c" 1
	int 235

/  0 "" 2
/NO_APP
	jmp	.L161
.L399:
/APP
/  834 "main.c" 1
	int 236

/  0 "" 2
/NO_APP
	jmp	.L161
.L400:
/APP
/  835 "main.c" 1
	int 237

/  0 "" 2
/NO_APP
	jmp	.L161
.L401:
/APP
/  836 "main.c" 1
	int 238

/  0 "" 2
/NO_APP
	jmp	.L161
.L402:
/APP
/  837 "main.c" 1
	int 239

/  0 "" 2
/NO_APP
	jmp	.L161
.L403:
/APP
/  838 "main.c" 1
	int 240

/  0 "" 2
/NO_APP
	jmp	.L161
.L404:
/APP
/  839 "main.c" 1
	int 241

/  0 "" 2
/NO_APP
	jmp	.L161
.L405:
/APP
/  840 "main.c" 1
	int 242

/  0 "" 2
/NO_APP
	jmp	.L161
.L406:
/APP
/  841 "main.c" 1
	int 243

/  0 "" 2
/NO_APP
	jmp	.L161
.L407:
/APP
/  842 "main.c" 1
	int 244

/  0 "" 2
/NO_APP
	jmp	.L161
.L408:
/APP
/  843 "main.c" 1
	int 245

/  0 "" 2
/NO_APP
	jmp	.L161
.L409:
/APP
/  844 "main.c" 1
	int 246

/  0 "" 2
/NO_APP
	jmp	.L161
.L410:
/APP
/  845 "main.c" 1
	int 247

/  0 "" 2
/NO_APP
	jmp	.L161
.L411:
/APP
/  846 "main.c" 1
	int 248

/  0 "" 2
/NO_APP
	jmp	.L161
.L412:
/APP
/  847 "main.c" 1
	int 249

/  0 "" 2
/NO_APP
	jmp	.L161
.L413:
/APP
/  848 "main.c" 1
	int 250

/  0 "" 2
/NO_APP
	jmp	.L161
.L414:
/APP
/  849 "main.c" 1
	int 251

/  0 "" 2
/NO_APP
	jmp	.L161
.L415:
/APP
/  850 "main.c" 1
	int 252

/  0 "" 2
/NO_APP
	jmp	.L161
.L416:
/APP
/  851 "main.c" 1
	int 253

/  0 "" 2
/NO_APP
	jmp	.L161
.L417:
/APP
/  852 "main.c" 1
	int 254

/  0 "" 2
/NO_APP
	jmp	.L161
.L418:
/APP
/  853 "main.c" 1
	int 255

/  0 "" 2
/NO_APP
	nop
.L161:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	IssueInterrupt, .-IssueInterrupt
	.globl	ShiftDisplayUpOneLine
	.type	ShiftDisplayUpOneLine, @function
ShiftDisplayUpOneLine:
.LFB6:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	mov	DWORD PTR [ebp-8], 753664
	mov	DWORD PTR [ebp-4], 0
	jmp	.L421
.L422:
	mov	eax, DWORD PTR [ebp-4]
	lea	edx, [eax+eax]
	mov	eax, DWORD PTR [ebp-8]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-4]
	add	eax, 80
	lea	ecx, [eax+eax]
	mov	eax, DWORD PTR [ebp-8]
	add	eax, ecx
	movzx	eax, WORD PTR [eax]
	mov	WORD PTR [edx], ax
	add	DWORD PTR [ebp-4], 1
.L421:
	cmp	DWORD PTR [ebp-4], 1919
	jbe	.L422
	mov	DWORD PTR [ebp-4], 1999
	jmp	.L423
.L424:
	mov	eax, DWORD PTR [ebp-4]
	lea	edx, [eax+eax]
	mov	eax, DWORD PTR [ebp-8]
	add	eax, edx
	mov	WORD PTR [eax], 0
	sub	DWORD PTR [ebp-4], 1
.L423:
	cmp	DWORD PTR [ebp-4], 1920
	ja	.L424
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	ShiftDisplayUpOneLine, .-ShiftDisplayUpOneLine
	.globl	Print
	.type	Print, @function
Print:
.LFB7:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 24
	.cfi_offset 3, -12
	mov	DWORD PTR [ebp-16], 753664
	mov	DWORD PTR [ebp-8], 0
	jmp	.L426
.L436:
	mov	eax, DWORD PTR CurrentLocation.2059
	cmp	eax, 2000
	jne	.L427
	call	ShiftDisplayUpOneLine
	mov	eax, DWORD PTR CurrentLocation.2059
	sub	eax, 80
	mov	DWORD PTR CurrentLocation.2059, eax
.L427:
	mov	edx, DWORD PTR [ebp-8]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	cmp	al, 10
	jne	.L428
	mov	ebx, DWORD PTR CurrentLocation.2059
	mov	ecx, DWORD PTR CurrentLocation.2059
	mov	edx, -858993459
	mov	eax, ecx
	mul	edx
	shr	edx, 6
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 4
	sub	ecx, eax
	mov	edx, ecx
	mov	eax, ebx
	sub	eax, edx
	add	eax, 80
	mov	DWORD PTR CurrentLocation.2059, eax
	jmp	.L429
.L428:
	mov	edx, DWORD PTR [ebp-8]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	cmp	al, 9
	jne	.L430
	mov	DWORD PTR [ebp-12], 0
	jmp	.L431
.L433:
	mov	eax, DWORD PTR CurrentLocation.2059
	cmp	eax, 2000
	jne	.L432
	call	ShiftDisplayUpOneLine
	mov	eax, DWORD PTR CurrentLocation.2059
	sub	eax, 80
	mov	DWORD PTR CurrentLocation.2059, eax
.L432:
	mov	eax, DWORD PTR CurrentLocation.2059
	lea	edx, [eax+1]
	mov	DWORD PTR CurrentLocation.2059, edx
	lea	edx, [eax+eax]
	mov	eax, DWORD PTR [ebp-16]
	add	eax, edx
	mov	WORD PTR [eax], 544
	add	DWORD PTR [ebp-12], 1
.L431:
	cmp	DWORD PTR [ebp-12], 3
	jle	.L433
	jmp	.L429
.L430:
	mov	edx, DWORD PTR [ebp-8]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	cmp	al, 8
	jne	.L434
	mov	eax, DWORD PTR CurrentLocation.2059
	test	eax, eax
	je	.L429
	mov	eax, DWORD PTR CurrentLocation.2059
	sub	eax, 1
	mov	DWORD PTR CurrentLocation.2059, eax
	mov	eax, DWORD PTR CurrentLocation.2059
	lea	edx, [eax+eax]
	mov	eax, DWORD PTR [ebp-16]
	add	eax, edx
	mov	WORD PTR [eax], 544
	jmp	.L429
.L434:
	mov	eax, DWORD PTR CurrentLocation.2059
	lea	edx, [eax+1]
	mov	DWORD PTR CurrentLocation.2059, edx
	lea	edx, [eax+eax]
	mov	eax, DWORD PTR [ebp-16]
	add	edx, eax
	mov	ecx, DWORD PTR [ebp-8]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, ecx
	movzx	eax, BYTE PTR [eax]
	cbw
	or	ah, 2
	mov	WORD PTR [edx], ax
.L429:
	mov	DWORD PTR [esp+4], 14
	mov	DWORD PTR [esp], 980
	call	outb
	mov	eax, DWORD PTR CurrentLocation.2059
	shr	eax, 8
	movzx	eax, al
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], 981
	call	outb
	mov	DWORD PTR [esp+4], 15
	mov	DWORD PTR [esp], 980
	call	outb
	mov	eax, DWORD PTR CurrentLocation.2059
	movzx	eax, al
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], 981
	call	outb
	add	DWORD PTR [ebp-8], 1
.L426:
	mov	edx, DWORD PTR [ebp-8]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	test	al, al
	jne	.L436
	add	esp, 24
	pop	ebx
	.cfi_restore 3
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	Print, .-Print
	.section	.rodata
.LC0:
	.string	"\n"
	.text
	.globl	PrintLine
	.type	PrintLine, @function
PrintLine:
.LFB8:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 4
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	Print
	mov	DWORD PTR [esp], OFFSET FLAT:.LC0
	call	Print
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	PrintLine, .-PrintLine
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 1080
	mov	DWORD PTR [ebp-4], 7
	mov	DWORD PTR [ebp-12], 4
	mov	DWORD PTR [ebp-16], 1024
	mov	DWORD PTR [ebp-20], 0
	mov	eax, DWORD PTR [ebp-12]
	imul	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [ebp-24], eax
	mov	DWORD PTR [ebp-8], 0
	mov	eax, OFFSET FLAT:Page_Table1
	add	eax, 1073741824
	mov	DWORD PTR [ebp-28], eax
	mov	eax, OFFSET FLAT:Page_Directory
	add	eax, 1073741824
	mov	DWORD PTR [ebp-32], eax
	jmp	.L439
.L440:
	mov	eax, DWORD PTR [ebp-8]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp-28]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-4]
	mov	DWORD PTR [edx], eax
	add	DWORD PTR [ebp-8], 1
	add	DWORD PTR [ebp-4], 4096
.L439:
	mov	eax, DWORD PTR [ebp-20]
	mov	edx, DWORD PTR [ebp-24]
	add	eax, edx
	cmp	eax, DWORD PTR [ebp-8]
	ja	.L440
	mov	DWORD PTR [ebp-4], 7
	mov	DWORD PTR [ebp-8], 786432
	mov	DWORD PTR [ebp-20], 786432
	jmp	.L441
.L442:
	mov	eax, DWORD PTR [ebp-8]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp-28]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-4]
	mov	DWORD PTR [edx], eax
	add	DWORD PTR [ebp-8], 1
	add	DWORD PTR [ebp-4], 4096
.L441:
	mov	eax, DWORD PTR [ebp-20]
	mov	edx, DWORD PTR [ebp-24]
	add	eax, edx
	cmp	eax, DWORD PTR [ebp-8]
	ja	.L442
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [ebp-4], eax
	or	DWORD PTR [ebp-4], 7
	mov	DWORD PTR [ebp-36], 1024
	mov	DWORD PTR [ebp-8], 0
	jmp	.L443
.L444:
	mov	eax, DWORD PTR [ebp-8]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp-32]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-4]
	mov	DWORD PTR [edx], eax
	add	DWORD PTR [ebp-8], 1
	add	DWORD PTR [ebp-4], 4096
.L443:
	mov	eax, DWORD PTR [ebp-8]
	cmp	eax, DWORD PTR [ebp-36]
	jb	.L444
/APP
/  979 "main.c" 1
	lea ECX, [Page_Directory - 0xC0000000]
mov CR3, ECX

/  0 "" 2
/  986 "main.c" 1
	mov ECX, CR0
or ECX, 0x80000000
mov CR0, ECX

/  0 "" 2
/  996 "main.c" 1
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
	mov	DWORD PTR [ebp-40], eax
	mov	DWORD PTR [ebp-44], OFFSET FLAT:CommonInterruptHandler0
	mov	eax, DWORD PTR [ebp-44]
	mov	edx, eax
	mov	eax, DWORD PTR [ebp-40]
	mov	WORD PTR [eax], dx
	mov	eax, DWORD PTR [ebp-44]
	shr	eax, 16
	mov	edx, eax
	mov	eax, DWORD PTR [ebp-40]
	mov	WORD PTR [eax+6], dx
	mov	eax, DWORD PTR [ebp-40]
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-48], OFFSET FLAT:CommonInterruptHandler1
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+8]
	mov	eax, DWORD PTR [ebp-48]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+8]
	mov	eax, DWORD PTR [ebp-48]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 8
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 8
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 8
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 8
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 8
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 8
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-52], OFFSET FLAT:CommonInterruptHandler2
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+16]
	mov	eax, DWORD PTR [ebp-52]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+16]
	mov	eax, DWORD PTR [ebp-52]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 16
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 16
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 16
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 16
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 16
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 16
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-56], OFFSET FLAT:CommonInterruptHandler3
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+24]
	mov	eax, DWORD PTR [ebp-56]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+24]
	mov	eax, DWORD PTR [ebp-56]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 24
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 24
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 24
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 24
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 24
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 24
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-60], OFFSET FLAT:CommonInterruptHandler4
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+32]
	mov	eax, DWORD PTR [ebp-60]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+32]
	mov	eax, DWORD PTR [ebp-60]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 32
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 32
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 32
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 32
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 32
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 32
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-64], OFFSET FLAT:CommonInterruptHandler5
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+40]
	mov	eax, DWORD PTR [ebp-64]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+40]
	mov	eax, DWORD PTR [ebp-64]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 40
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 40
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 40
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 40
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 40
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 40
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-68], OFFSET FLAT:CommonInterruptHandler6
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+48]
	mov	eax, DWORD PTR [ebp-68]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+48]
	mov	eax, DWORD PTR [ebp-68]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 48
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 48
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 48
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 48
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 48
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 48
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-72], OFFSET FLAT:CommonInterruptHandler7
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+56]
	mov	eax, DWORD PTR [ebp-72]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+56]
	mov	eax, DWORD PTR [ebp-72]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 56
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 56
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 56
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 56
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 56
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 56
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-76], OFFSET FLAT:CommonInterruptHandler8
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+64]
	mov	eax, DWORD PTR [ebp-76]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+64]
	mov	eax, DWORD PTR [ebp-76]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 64
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 64
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 64
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 64
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 64
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 64
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-80], OFFSET FLAT:CommonInterruptHandler9
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+72]
	mov	eax, DWORD PTR [ebp-80]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+72]
	mov	eax, DWORD PTR [ebp-80]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 72
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 72
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 72
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 72
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 72
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 72
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-84], OFFSET FLAT:CommonInterruptHandler10
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+80]
	mov	eax, DWORD PTR [ebp-84]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+80]
	mov	eax, DWORD PTR [ebp-84]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 80
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 80
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 80
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 80
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 80
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 80
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-88], OFFSET FLAT:CommonInterruptHandler11
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+88]
	mov	eax, DWORD PTR [ebp-88]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+88]
	mov	eax, DWORD PTR [ebp-88]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 88
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 88
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 88
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 88
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 88
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 88
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-92], OFFSET FLAT:CommonInterruptHandler12
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+96]
	mov	eax, DWORD PTR [ebp-92]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+96]
	mov	eax, DWORD PTR [ebp-92]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 96
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 96
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 96
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 96
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 96
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 96
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-96], OFFSET FLAT:CommonInterruptHandler13
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+104]
	mov	eax, DWORD PTR [ebp-96]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+104]
	mov	eax, DWORD PTR [ebp-96]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 104
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 104
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 104
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 104
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 104
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 104
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-100], OFFSET FLAT:CommonInterruptHandler14
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+112]
	mov	eax, DWORD PTR [ebp-100]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+112]
	mov	eax, DWORD PTR [ebp-100]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 112
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 112
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 112
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 112
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 112
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 112
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-104], OFFSET FLAT:CommonInterruptHandler15
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+120]
	mov	eax, DWORD PTR [ebp-104]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+120]
	mov	eax, DWORD PTR [ebp-104]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 120
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 120
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 120
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 120
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 120
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 120
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-108], OFFSET FLAT:CommonInterruptHandler16
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+128]
	mov	eax, DWORD PTR [ebp-108]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+128]
	mov	eax, DWORD PTR [ebp-108]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	sub	eax, -128
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	sub	eax, -128
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	sub	eax, -128
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	sub	eax, -128
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	sub	eax, -128
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	sub	eax, -128
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-112], OFFSET FLAT:CommonInterruptHandler17
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+136]
	mov	eax, DWORD PTR [ebp-112]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+136]
	mov	eax, DWORD PTR [ebp-112]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 136
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 136
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 136
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 136
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 136
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 136
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-116], OFFSET FLAT:CommonInterruptHandler18
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+144]
	mov	eax, DWORD PTR [ebp-116]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+144]
	mov	eax, DWORD PTR [ebp-116]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 144
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 144
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 144
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 144
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 144
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 144
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-120], OFFSET FLAT:CommonInterruptHandler19
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+152]
	mov	eax, DWORD PTR [ebp-120]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+152]
	mov	eax, DWORD PTR [ebp-120]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 152
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 152
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 152
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 152
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 152
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 152
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-124], OFFSET FLAT:CommonInterruptHandler20
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+160]
	mov	eax, DWORD PTR [ebp-124]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+160]
	mov	eax, DWORD PTR [ebp-124]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 160
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 160
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 160
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 160
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 160
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 160
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-128], OFFSET FLAT:CommonInterruptHandler21
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+168]
	mov	eax, DWORD PTR [ebp-128]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+168]
	mov	eax, DWORD PTR [ebp-128]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 168
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 168
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 168
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 168
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 168
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 168
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-132], OFFSET FLAT:CommonInterruptHandler22
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+176]
	mov	eax, DWORD PTR [ebp-132]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+176]
	mov	eax, DWORD PTR [ebp-132]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 176
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 176
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 176
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 176
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 176
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 176
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-136], OFFSET FLAT:CommonInterruptHandler23
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+184]
	mov	eax, DWORD PTR [ebp-136]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+184]
	mov	eax, DWORD PTR [ebp-136]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 184
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 184
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 184
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 184
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 184
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 184
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-140], OFFSET FLAT:CommonInterruptHandler24
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+192]
	mov	eax, DWORD PTR [ebp-140]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+192]
	mov	eax, DWORD PTR [ebp-140]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 192
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 192
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 192
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 192
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 192
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 192
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-144], OFFSET FLAT:CommonInterruptHandler25
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+200]
	mov	eax, DWORD PTR [ebp-144]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+200]
	mov	eax, DWORD PTR [ebp-144]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 200
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 200
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 200
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 200
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 200
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 200
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-148], OFFSET FLAT:CommonInterruptHandler26
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+208]
	mov	eax, DWORD PTR [ebp-148]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+208]
	mov	eax, DWORD PTR [ebp-148]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 208
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 208
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 208
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 208
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 208
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 208
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-152], OFFSET FLAT:CommonInterruptHandler27
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+216]
	mov	eax, DWORD PTR [ebp-152]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+216]
	mov	eax, DWORD PTR [ebp-152]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 216
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 216
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 216
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 216
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 216
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 216
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-156], OFFSET FLAT:CommonInterruptHandler28
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+224]
	mov	eax, DWORD PTR [ebp-156]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+224]
	mov	eax, DWORD PTR [ebp-156]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 224
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 224
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 224
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 224
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 224
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 224
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-160], OFFSET FLAT:CommonInterruptHandler29
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+232]
	mov	eax, DWORD PTR [ebp-160]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+232]
	mov	eax, DWORD PTR [ebp-160]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 232
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 232
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 232
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 232
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 232
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 232
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-164], OFFSET FLAT:CommonInterruptHandler30
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+240]
	mov	eax, DWORD PTR [ebp-164]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+240]
	mov	eax, DWORD PTR [ebp-164]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 240
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 240
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 240
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 240
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 240
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 240
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-168], OFFSET FLAT:CommonInterruptHandler31
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+248]
	mov	eax, DWORD PTR [ebp-168]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+248]
	mov	eax, DWORD PTR [ebp-168]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 248
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 248
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 248
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 248
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 248
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 248
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-172], OFFSET FLAT:CommonInterruptHandler32
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+256]
	mov	eax, DWORD PTR [ebp-172]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+256]
	mov	eax, DWORD PTR [ebp-172]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 256
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 256
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 256
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 256
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 256
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 256
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-176], OFFSET FLAT:CommonInterruptHandler33
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+264]
	mov	eax, DWORD PTR [ebp-176]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+264]
	mov	eax, DWORD PTR [ebp-176]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 264
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 264
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 264
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 264
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 264
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 264
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-180], OFFSET FLAT:CommonInterruptHandler34
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+272]
	mov	eax, DWORD PTR [ebp-180]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+272]
	mov	eax, DWORD PTR [ebp-180]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 272
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 272
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 272
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 272
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 272
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 272
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-184], OFFSET FLAT:CommonInterruptHandler35
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+280]
	mov	eax, DWORD PTR [ebp-184]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+280]
	mov	eax, DWORD PTR [ebp-184]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 280
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 280
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 280
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 280
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 280
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 280
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-188], OFFSET FLAT:CommonInterruptHandler36
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+288]
	mov	eax, DWORD PTR [ebp-188]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+288]
	mov	eax, DWORD PTR [ebp-188]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 288
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 288
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 288
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 288
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 288
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 288
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-192], OFFSET FLAT:CommonInterruptHandler37
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+296]
	mov	eax, DWORD PTR [ebp-192]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+296]
	mov	eax, DWORD PTR [ebp-192]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 296
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 296
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 296
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 296
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 296
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 296
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-196], OFFSET FLAT:CommonInterruptHandler38
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+304]
	mov	eax, DWORD PTR [ebp-196]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+304]
	mov	eax, DWORD PTR [ebp-196]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 304
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 304
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 304
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 304
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 304
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 304
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-200], OFFSET FLAT:CommonInterruptHandler39
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+312]
	mov	eax, DWORD PTR [ebp-200]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+312]
	mov	eax, DWORD PTR [ebp-200]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 312
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 312
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 312
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 312
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 312
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 312
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-204], OFFSET FLAT:CommonInterruptHandler40
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+320]
	mov	eax, DWORD PTR [ebp-204]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+320]
	mov	eax, DWORD PTR [ebp-204]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 320
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 320
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 320
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 320
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 320
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 320
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-208], OFFSET FLAT:CommonInterruptHandler41
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+328]
	mov	eax, DWORD PTR [ebp-208]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+328]
	mov	eax, DWORD PTR [ebp-208]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 328
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 328
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 328
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 328
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 328
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 328
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-212], OFFSET FLAT:CommonInterruptHandler42
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+336]
	mov	eax, DWORD PTR [ebp-212]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+336]
	mov	eax, DWORD PTR [ebp-212]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 336
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 336
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 336
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 336
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 336
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 336
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-216], OFFSET FLAT:CommonInterruptHandler43
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+344]
	mov	eax, DWORD PTR [ebp-216]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+344]
	mov	eax, DWORD PTR [ebp-216]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 344
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 344
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 344
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 344
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 344
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 344
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-220], OFFSET FLAT:CommonInterruptHandler44
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+352]
	mov	eax, DWORD PTR [ebp-220]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+352]
	mov	eax, DWORD PTR [ebp-220]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 352
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 352
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 352
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 352
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 352
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 352
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-224], OFFSET FLAT:CommonInterruptHandler45
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+360]
	mov	eax, DWORD PTR [ebp-224]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+360]
	mov	eax, DWORD PTR [ebp-224]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 360
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 360
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 360
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 360
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 360
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 360
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-228], OFFSET FLAT:CommonInterruptHandler46
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+368]
	mov	eax, DWORD PTR [ebp-228]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+368]
	mov	eax, DWORD PTR [ebp-228]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 368
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 368
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 368
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 368
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 368
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 368
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-232], OFFSET FLAT:CommonInterruptHandler47
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+376]
	mov	eax, DWORD PTR [ebp-232]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+376]
	mov	eax, DWORD PTR [ebp-232]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 376
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 376
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 376
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 376
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 376
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 376
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-236], OFFSET FLAT:CommonInterruptHandler48
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+384]
	mov	eax, DWORD PTR [ebp-236]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+384]
	mov	eax, DWORD PTR [ebp-236]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 384
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 384
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 384
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 384
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 384
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 384
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-240], OFFSET FLAT:CommonInterruptHandler49
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+392]
	mov	eax, DWORD PTR [ebp-240]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+392]
	mov	eax, DWORD PTR [ebp-240]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 392
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 392
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 392
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 392
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 392
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 392
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-244], OFFSET FLAT:CommonInterruptHandler50
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+400]
	mov	eax, DWORD PTR [ebp-244]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+400]
	mov	eax, DWORD PTR [ebp-244]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 400
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 400
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 400
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 400
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 400
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 400
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-248], OFFSET FLAT:CommonInterruptHandler51
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+408]
	mov	eax, DWORD PTR [ebp-248]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+408]
	mov	eax, DWORD PTR [ebp-248]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 408
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 408
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 408
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 408
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 408
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 408
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-252], OFFSET FLAT:CommonInterruptHandler52
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+416]
	mov	eax, DWORD PTR [ebp-252]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+416]
	mov	eax, DWORD PTR [ebp-252]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 416
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 416
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 416
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 416
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 416
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 416
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-256], OFFSET FLAT:CommonInterruptHandler53
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+424]
	mov	eax, DWORD PTR [ebp-256]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+424]
	mov	eax, DWORD PTR [ebp-256]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 424
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 424
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 424
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 424
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 424
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 424
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-260], OFFSET FLAT:CommonInterruptHandler54
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+432]
	mov	eax, DWORD PTR [ebp-260]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+432]
	mov	eax, DWORD PTR [ebp-260]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 432
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 432
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 432
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 432
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 432
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 432
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-264], OFFSET FLAT:CommonInterruptHandler55
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+440]
	mov	eax, DWORD PTR [ebp-264]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+440]
	mov	eax, DWORD PTR [ebp-264]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 440
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 440
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 440
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 440
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 440
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 440
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-268], OFFSET FLAT:CommonInterruptHandler56
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+448]
	mov	eax, DWORD PTR [ebp-268]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+448]
	mov	eax, DWORD PTR [ebp-268]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 448
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 448
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 448
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 448
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 448
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 448
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-272], OFFSET FLAT:CommonInterruptHandler57
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+456]
	mov	eax, DWORD PTR [ebp-272]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+456]
	mov	eax, DWORD PTR [ebp-272]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 456
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 456
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 456
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 456
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 456
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 456
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-276], OFFSET FLAT:CommonInterruptHandler58
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+464]
	mov	eax, DWORD PTR [ebp-276]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+464]
	mov	eax, DWORD PTR [ebp-276]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 464
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 464
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 464
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 464
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 464
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 464
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-280], OFFSET FLAT:CommonInterruptHandler59
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+472]
	mov	eax, DWORD PTR [ebp-280]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+472]
	mov	eax, DWORD PTR [ebp-280]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 472
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 472
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 472
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 472
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 472
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 472
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-284], OFFSET FLAT:CommonInterruptHandler60
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+480]
	mov	eax, DWORD PTR [ebp-284]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+480]
	mov	eax, DWORD PTR [ebp-284]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 480
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 480
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 480
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 480
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 480
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 480
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-288], OFFSET FLAT:CommonInterruptHandler61
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+488]
	mov	eax, DWORD PTR [ebp-288]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+488]
	mov	eax, DWORD PTR [ebp-288]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 488
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 488
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 488
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 488
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 488
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 488
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-292], OFFSET FLAT:CommonInterruptHandler62
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+496]
	mov	eax, DWORD PTR [ebp-292]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+496]
	mov	eax, DWORD PTR [ebp-292]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 496
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 496
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 496
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 496
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 496
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 496
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-296], OFFSET FLAT:CommonInterruptHandler63
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+504]
	mov	eax, DWORD PTR [ebp-296]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+504]
	mov	eax, DWORD PTR [ebp-296]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 504
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 504
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 504
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 504
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 504
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 504
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-300], OFFSET FLAT:CommonInterruptHandler64
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+512]
	mov	eax, DWORD PTR [ebp-300]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+512]
	mov	eax, DWORD PTR [ebp-300]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 512
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 512
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 512
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 512
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 512
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 512
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-304], OFFSET FLAT:CommonInterruptHandler65
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+520]
	mov	eax, DWORD PTR [ebp-304]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+520]
	mov	eax, DWORD PTR [ebp-304]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 520
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 520
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 520
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 520
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 520
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 520
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-308], OFFSET FLAT:CommonInterruptHandler66
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+528]
	mov	eax, DWORD PTR [ebp-308]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+528]
	mov	eax, DWORD PTR [ebp-308]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 528
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 528
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 528
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 528
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 528
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 528
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-312], OFFSET FLAT:CommonInterruptHandler67
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+536]
	mov	eax, DWORD PTR [ebp-312]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+536]
	mov	eax, DWORD PTR [ebp-312]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 536
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 536
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 536
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 536
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 536
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 536
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-316], OFFSET FLAT:CommonInterruptHandler68
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+544]
	mov	eax, DWORD PTR [ebp-316]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+544]
	mov	eax, DWORD PTR [ebp-316]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 544
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 544
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 544
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 544
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 544
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 544
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-320], OFFSET FLAT:CommonInterruptHandler69
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+552]
	mov	eax, DWORD PTR [ebp-320]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+552]
	mov	eax, DWORD PTR [ebp-320]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 552
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 552
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 552
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 552
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 552
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 552
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-324], OFFSET FLAT:CommonInterruptHandler70
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+560]
	mov	eax, DWORD PTR [ebp-324]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+560]
	mov	eax, DWORD PTR [ebp-324]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 560
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 560
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 560
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 560
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 560
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 560
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-328], OFFSET FLAT:CommonInterruptHandler71
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+568]
	mov	eax, DWORD PTR [ebp-328]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+568]
	mov	eax, DWORD PTR [ebp-328]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 568
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 568
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 568
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 568
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 568
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 568
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-332], OFFSET FLAT:CommonInterruptHandler72
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+576]
	mov	eax, DWORD PTR [ebp-332]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+576]
	mov	eax, DWORD PTR [ebp-332]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 576
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 576
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 576
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 576
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 576
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 576
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-336], OFFSET FLAT:CommonInterruptHandler73
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+584]
	mov	eax, DWORD PTR [ebp-336]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+584]
	mov	eax, DWORD PTR [ebp-336]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 584
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 584
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 584
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 584
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 584
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 584
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-340], OFFSET FLAT:CommonInterruptHandler74
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+592]
	mov	eax, DWORD PTR [ebp-340]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+592]
	mov	eax, DWORD PTR [ebp-340]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 592
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 592
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 592
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 592
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 592
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 592
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-344], OFFSET FLAT:CommonInterruptHandler75
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+600]
	mov	eax, DWORD PTR [ebp-344]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+600]
	mov	eax, DWORD PTR [ebp-344]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 600
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 600
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 600
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 600
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 600
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 600
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-348], OFFSET FLAT:CommonInterruptHandler76
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+608]
	mov	eax, DWORD PTR [ebp-348]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+608]
	mov	eax, DWORD PTR [ebp-348]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 608
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 608
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 608
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 608
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 608
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 608
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-352], OFFSET FLAT:CommonInterruptHandler77
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+616]
	mov	eax, DWORD PTR [ebp-352]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+616]
	mov	eax, DWORD PTR [ebp-352]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 616
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 616
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 616
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 616
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 616
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 616
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-356], OFFSET FLAT:CommonInterruptHandler78
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+624]
	mov	eax, DWORD PTR [ebp-356]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+624]
	mov	eax, DWORD PTR [ebp-356]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 624
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 624
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 624
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 624
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 624
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 624
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-360], OFFSET FLAT:CommonInterruptHandler79
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+632]
	mov	eax, DWORD PTR [ebp-360]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+632]
	mov	eax, DWORD PTR [ebp-360]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 632
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 632
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 632
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 632
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 632
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 632
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-364], OFFSET FLAT:CommonInterruptHandler80
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+640]
	mov	eax, DWORD PTR [ebp-364]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+640]
	mov	eax, DWORD PTR [ebp-364]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 640
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 640
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 640
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 640
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 640
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 640
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-368], OFFSET FLAT:CommonInterruptHandler81
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+648]
	mov	eax, DWORD PTR [ebp-368]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+648]
	mov	eax, DWORD PTR [ebp-368]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 648
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 648
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 648
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 648
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 648
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 648
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-372], OFFSET FLAT:CommonInterruptHandler82
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+656]
	mov	eax, DWORD PTR [ebp-372]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+656]
	mov	eax, DWORD PTR [ebp-372]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 656
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 656
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 656
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 656
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 656
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 656
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-376], OFFSET FLAT:CommonInterruptHandler83
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+664]
	mov	eax, DWORD PTR [ebp-376]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+664]
	mov	eax, DWORD PTR [ebp-376]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 664
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 664
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 664
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 664
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 664
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 664
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-380], OFFSET FLAT:CommonInterruptHandler84
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+672]
	mov	eax, DWORD PTR [ebp-380]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+672]
	mov	eax, DWORD PTR [ebp-380]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 672
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 672
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 672
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 672
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 672
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 672
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-384], OFFSET FLAT:CommonInterruptHandler85
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+680]
	mov	eax, DWORD PTR [ebp-384]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+680]
	mov	eax, DWORD PTR [ebp-384]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 680
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 680
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 680
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 680
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 680
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 680
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-388], OFFSET FLAT:CommonInterruptHandler86
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+688]
	mov	eax, DWORD PTR [ebp-388]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+688]
	mov	eax, DWORD PTR [ebp-388]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 688
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 688
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 688
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 688
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 688
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 688
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-392], OFFSET FLAT:CommonInterruptHandler87
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+696]
	mov	eax, DWORD PTR [ebp-392]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+696]
	mov	eax, DWORD PTR [ebp-392]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 696
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 696
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 696
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 696
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 696
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 696
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-396], OFFSET FLAT:CommonInterruptHandler88
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+704]
	mov	eax, DWORD PTR [ebp-396]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+704]
	mov	eax, DWORD PTR [ebp-396]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 704
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 704
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 704
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 704
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 704
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 704
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-400], OFFSET FLAT:CommonInterruptHandler89
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+712]
	mov	eax, DWORD PTR [ebp-400]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+712]
	mov	eax, DWORD PTR [ebp-400]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 712
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 712
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 712
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 712
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 712
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 712
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-404], OFFSET FLAT:CommonInterruptHandler90
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+720]
	mov	eax, DWORD PTR [ebp-404]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+720]
	mov	eax, DWORD PTR [ebp-404]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 720
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 720
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 720
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 720
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 720
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 720
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-408], OFFSET FLAT:CommonInterruptHandler91
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+728]
	mov	eax, DWORD PTR [ebp-408]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+728]
	mov	eax, DWORD PTR [ebp-408]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 728
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 728
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 728
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 728
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 728
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 728
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-412], OFFSET FLAT:CommonInterruptHandler92
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+736]
	mov	eax, DWORD PTR [ebp-412]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+736]
	mov	eax, DWORD PTR [ebp-412]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 736
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 736
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 736
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 736
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 736
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 736
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-416], OFFSET FLAT:CommonInterruptHandler93
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+744]
	mov	eax, DWORD PTR [ebp-416]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+744]
	mov	eax, DWORD PTR [ebp-416]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 744
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 744
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 744
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 744
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 744
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 744
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-420], OFFSET FLAT:CommonInterruptHandler94
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+752]
	mov	eax, DWORD PTR [ebp-420]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+752]
	mov	eax, DWORD PTR [ebp-420]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 752
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 752
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 752
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 752
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 752
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 752
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-424], OFFSET FLAT:CommonInterruptHandler95
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+760]
	mov	eax, DWORD PTR [ebp-424]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+760]
	mov	eax, DWORD PTR [ebp-424]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 760
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 760
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 760
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 760
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 760
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 760
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-428], OFFSET FLAT:CommonInterruptHandler96
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+768]
	mov	eax, DWORD PTR [ebp-428]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+768]
	mov	eax, DWORD PTR [ebp-428]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 768
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 768
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 768
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 768
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 768
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 768
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-432], OFFSET FLAT:CommonInterruptHandler97
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+776]
	mov	eax, DWORD PTR [ebp-432]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+776]
	mov	eax, DWORD PTR [ebp-432]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 776
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 776
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 776
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 776
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 776
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 776
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-436], OFFSET FLAT:CommonInterruptHandler98
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+784]
	mov	eax, DWORD PTR [ebp-436]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+784]
	mov	eax, DWORD PTR [ebp-436]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 784
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 784
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 784
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 784
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 784
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 784
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-440], OFFSET FLAT:CommonInterruptHandler99
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+792]
	mov	eax, DWORD PTR [ebp-440]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+792]
	mov	eax, DWORD PTR [ebp-440]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 792
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 792
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 792
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 792
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 792
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 792
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-444], OFFSET FLAT:CommonInterruptHandler100
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+800]
	mov	eax, DWORD PTR [ebp-444]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+800]
	mov	eax, DWORD PTR [ebp-444]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 800
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 800
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 800
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 800
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 800
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 800
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-448], OFFSET FLAT:CommonInterruptHandler101
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+808]
	mov	eax, DWORD PTR [ebp-448]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+808]
	mov	eax, DWORD PTR [ebp-448]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 808
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 808
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 808
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 808
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 808
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 808
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-452], OFFSET FLAT:CommonInterruptHandler102
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+816]
	mov	eax, DWORD PTR [ebp-452]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+816]
	mov	eax, DWORD PTR [ebp-452]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 816
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 816
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 816
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 816
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 816
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 816
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-456], OFFSET FLAT:CommonInterruptHandler103
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+824]
	mov	eax, DWORD PTR [ebp-456]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+824]
	mov	eax, DWORD PTR [ebp-456]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 824
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 824
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 824
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 824
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 824
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 824
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-460], OFFSET FLAT:CommonInterruptHandler104
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+832]
	mov	eax, DWORD PTR [ebp-460]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+832]
	mov	eax, DWORD PTR [ebp-460]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 832
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 832
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 832
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 832
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 832
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 832
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-464], OFFSET FLAT:CommonInterruptHandler105
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+840]
	mov	eax, DWORD PTR [ebp-464]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+840]
	mov	eax, DWORD PTR [ebp-464]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 840
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 840
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 840
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 840
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 840
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 840
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-468], OFFSET FLAT:CommonInterruptHandler106
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+848]
	mov	eax, DWORD PTR [ebp-468]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+848]
	mov	eax, DWORD PTR [ebp-468]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 848
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 848
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 848
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 848
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 848
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 848
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-472], OFFSET FLAT:CommonInterruptHandler107
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+856]
	mov	eax, DWORD PTR [ebp-472]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+856]
	mov	eax, DWORD PTR [ebp-472]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 856
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 856
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 856
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 856
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 856
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 856
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-476], OFFSET FLAT:CommonInterruptHandler108
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+864]
	mov	eax, DWORD PTR [ebp-476]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+864]
	mov	eax, DWORD PTR [ebp-476]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 864
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 864
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 864
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 864
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 864
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 864
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-480], OFFSET FLAT:CommonInterruptHandler109
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+872]
	mov	eax, DWORD PTR [ebp-480]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+872]
	mov	eax, DWORD PTR [ebp-480]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 872
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 872
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 872
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 872
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 872
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 872
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-484], OFFSET FLAT:CommonInterruptHandler110
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+880]
	mov	eax, DWORD PTR [ebp-484]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+880]
	mov	eax, DWORD PTR [ebp-484]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 880
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 880
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 880
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 880
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 880
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 880
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-488], OFFSET FLAT:CommonInterruptHandler111
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+888]
	mov	eax, DWORD PTR [ebp-488]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+888]
	mov	eax, DWORD PTR [ebp-488]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 888
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 888
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 888
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 888
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 888
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 888
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-492], OFFSET FLAT:CommonInterruptHandler112
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+896]
	mov	eax, DWORD PTR [ebp-492]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+896]
	mov	eax, DWORD PTR [ebp-492]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 896
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 896
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 896
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 896
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 896
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 896
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-496], OFFSET FLAT:CommonInterruptHandler113
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+904]
	mov	eax, DWORD PTR [ebp-496]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+904]
	mov	eax, DWORD PTR [ebp-496]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 904
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 904
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 904
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 904
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 904
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 904
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-500], OFFSET FLAT:CommonInterruptHandler114
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+912]
	mov	eax, DWORD PTR [ebp-500]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+912]
	mov	eax, DWORD PTR [ebp-500]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 912
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 912
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 912
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 912
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 912
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 912
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-504], OFFSET FLAT:CommonInterruptHandler115
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+920]
	mov	eax, DWORD PTR [ebp-504]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+920]
	mov	eax, DWORD PTR [ebp-504]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 920
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 920
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 920
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 920
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 920
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 920
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-508], OFFSET FLAT:CommonInterruptHandler116
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+928]
	mov	eax, DWORD PTR [ebp-508]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+928]
	mov	eax, DWORD PTR [ebp-508]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 928
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 928
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 928
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 928
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 928
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 928
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-512], OFFSET FLAT:CommonInterruptHandler117
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+936]
	mov	eax, DWORD PTR [ebp-512]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+936]
	mov	eax, DWORD PTR [ebp-512]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 936
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 936
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 936
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 936
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 936
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 936
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-516], OFFSET FLAT:CommonInterruptHandler118
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+944]
	mov	eax, DWORD PTR [ebp-516]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+944]
	mov	eax, DWORD PTR [ebp-516]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 944
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 944
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 944
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 944
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 944
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 944
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-520], OFFSET FLAT:CommonInterruptHandler119
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+952]
	mov	eax, DWORD PTR [ebp-520]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+952]
	mov	eax, DWORD PTR [ebp-520]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 952
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 952
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 952
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 952
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 952
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 952
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-524], OFFSET FLAT:CommonInterruptHandler120
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+960]
	mov	eax, DWORD PTR [ebp-524]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+960]
	mov	eax, DWORD PTR [ebp-524]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 960
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 960
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 960
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 960
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 960
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 960
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-528], OFFSET FLAT:CommonInterruptHandler121
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+968]
	mov	eax, DWORD PTR [ebp-528]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+968]
	mov	eax, DWORD PTR [ebp-528]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 968
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 968
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 968
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 968
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 968
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 968
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-532], OFFSET FLAT:CommonInterruptHandler122
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+976]
	mov	eax, DWORD PTR [ebp-532]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+976]
	mov	eax, DWORD PTR [ebp-532]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 976
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 976
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 976
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 976
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 976
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 976
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-536], OFFSET FLAT:CommonInterruptHandler123
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+984]
	mov	eax, DWORD PTR [ebp-536]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+984]
	mov	eax, DWORD PTR [ebp-536]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 984
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 984
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 984
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 984
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 984
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 984
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-540], OFFSET FLAT:CommonInterruptHandler124
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+992]
	mov	eax, DWORD PTR [ebp-540]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+992]
	mov	eax, DWORD PTR [ebp-540]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 992
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 992
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 992
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 992
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 992
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 992
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-544], OFFSET FLAT:CommonInterruptHandler125
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1000]
	mov	eax, DWORD PTR [ebp-544]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1000]
	mov	eax, DWORD PTR [ebp-544]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1000
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1000
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1000
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1000
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1000
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1000
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-548], OFFSET FLAT:CommonInterruptHandler126
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1008]
	mov	eax, DWORD PTR [ebp-548]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1008]
	mov	eax, DWORD PTR [ebp-548]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1008
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1008
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1008
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1008
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1008
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1008
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-552], OFFSET FLAT:CommonInterruptHandler127
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1016]
	mov	eax, DWORD PTR [ebp-552]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1016]
	mov	eax, DWORD PTR [ebp-552]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1016
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1016
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1016
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1016
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1016
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1016
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-556], OFFSET FLAT:CommonInterruptHandler128
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1024]
	mov	eax, DWORD PTR [ebp-556]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1024]
	mov	eax, DWORD PTR [ebp-556]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1024
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1024
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1024
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1024
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1024
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1024
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-560], OFFSET FLAT:CommonInterruptHandler129
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1032]
	mov	eax, DWORD PTR [ebp-560]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1032]
	mov	eax, DWORD PTR [ebp-560]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1032
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1032
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1032
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1032
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1032
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1032
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-564], OFFSET FLAT:CommonInterruptHandler130
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1040]
	mov	eax, DWORD PTR [ebp-564]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1040]
	mov	eax, DWORD PTR [ebp-564]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1040
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1040
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1040
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1040
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1040
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1040
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-568], OFFSET FLAT:CommonInterruptHandler131
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1048]
	mov	eax, DWORD PTR [ebp-568]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1048]
	mov	eax, DWORD PTR [ebp-568]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1048
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1048
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1048
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1048
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1048
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1048
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-572], OFFSET FLAT:CommonInterruptHandler132
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1056]
	mov	eax, DWORD PTR [ebp-572]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1056]
	mov	eax, DWORD PTR [ebp-572]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1056
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1056
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1056
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1056
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1056
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1056
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-576], OFFSET FLAT:CommonInterruptHandler133
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1064]
	mov	eax, DWORD PTR [ebp-576]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1064]
	mov	eax, DWORD PTR [ebp-576]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1064
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1064
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1064
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1064
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1064
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1064
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-580], OFFSET FLAT:CommonInterruptHandler134
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1072]
	mov	eax, DWORD PTR [ebp-580]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1072]
	mov	eax, DWORD PTR [ebp-580]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1072
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1072
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1072
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1072
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1072
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1072
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-584], OFFSET FLAT:CommonInterruptHandler135
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1080]
	mov	eax, DWORD PTR [ebp-584]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1080]
	mov	eax, DWORD PTR [ebp-584]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1080
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1080
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1080
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1080
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1080
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1080
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-588], OFFSET FLAT:CommonInterruptHandler136
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1088]
	mov	eax, DWORD PTR [ebp-588]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1088]
	mov	eax, DWORD PTR [ebp-588]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1088
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1088
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1088
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1088
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1088
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1088
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-592], OFFSET FLAT:CommonInterruptHandler137
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1096]
	mov	eax, DWORD PTR [ebp-592]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1096]
	mov	eax, DWORD PTR [ebp-592]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1096
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1096
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1096
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1096
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1096
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1096
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-596], OFFSET FLAT:CommonInterruptHandler138
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1104]
	mov	eax, DWORD PTR [ebp-596]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1104]
	mov	eax, DWORD PTR [ebp-596]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1104
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1104
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1104
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1104
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1104
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1104
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-600], OFFSET FLAT:CommonInterruptHandler139
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1112]
	mov	eax, DWORD PTR [ebp-600]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1112]
	mov	eax, DWORD PTR [ebp-600]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1112
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1112
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1112
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1112
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1112
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1112
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-604], OFFSET FLAT:CommonInterruptHandler140
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1120]
	mov	eax, DWORD PTR [ebp-604]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1120]
	mov	eax, DWORD PTR [ebp-604]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1120
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1120
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1120
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1120
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1120
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1120
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-608], OFFSET FLAT:CommonInterruptHandler141
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1128]
	mov	eax, DWORD PTR [ebp-608]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1128]
	mov	eax, DWORD PTR [ebp-608]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1128
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1128
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1128
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1128
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1128
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1128
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-612], OFFSET FLAT:CommonInterruptHandler142
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1136]
	mov	eax, DWORD PTR [ebp-612]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1136]
	mov	eax, DWORD PTR [ebp-612]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1136
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1136
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1136
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1136
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1136
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1136
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-616], OFFSET FLAT:CommonInterruptHandler143
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1144]
	mov	eax, DWORD PTR [ebp-616]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1144]
	mov	eax, DWORD PTR [ebp-616]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1144
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1144
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1144
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1144
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1144
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1144
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-620], OFFSET FLAT:CommonInterruptHandler144
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1152]
	mov	eax, DWORD PTR [ebp-620]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1152]
	mov	eax, DWORD PTR [ebp-620]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1152
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1152
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1152
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1152
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1152
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1152
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-624], OFFSET FLAT:CommonInterruptHandler145
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1160]
	mov	eax, DWORD PTR [ebp-624]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1160]
	mov	eax, DWORD PTR [ebp-624]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1160
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1160
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1160
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1160
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1160
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1160
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-628], OFFSET FLAT:CommonInterruptHandler146
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1168]
	mov	eax, DWORD PTR [ebp-628]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1168]
	mov	eax, DWORD PTR [ebp-628]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1168
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1168
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1168
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1168
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1168
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1168
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-632], OFFSET FLAT:CommonInterruptHandler147
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1176]
	mov	eax, DWORD PTR [ebp-632]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1176]
	mov	eax, DWORD PTR [ebp-632]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1176
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1176
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1176
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1176
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1176
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1176
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-636], OFFSET FLAT:CommonInterruptHandler148
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1184]
	mov	eax, DWORD PTR [ebp-636]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1184]
	mov	eax, DWORD PTR [ebp-636]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1184
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1184
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1184
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1184
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1184
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1184
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-640], OFFSET FLAT:CommonInterruptHandler149
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1192]
	mov	eax, DWORD PTR [ebp-640]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1192]
	mov	eax, DWORD PTR [ebp-640]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1192
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1192
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1192
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1192
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1192
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1192
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-644], OFFSET FLAT:CommonInterruptHandler150
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1200]
	mov	eax, DWORD PTR [ebp-644]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1200]
	mov	eax, DWORD PTR [ebp-644]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1200
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1200
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1200
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1200
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1200
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1200
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-648], OFFSET FLAT:CommonInterruptHandler151
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1208]
	mov	eax, DWORD PTR [ebp-648]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1208]
	mov	eax, DWORD PTR [ebp-648]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1208
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1208
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1208
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1208
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1208
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1208
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-652], OFFSET FLAT:CommonInterruptHandler152
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1216]
	mov	eax, DWORD PTR [ebp-652]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1216]
	mov	eax, DWORD PTR [ebp-652]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1216
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1216
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1216
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1216
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1216
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1216
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-656], OFFSET FLAT:CommonInterruptHandler153
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1224]
	mov	eax, DWORD PTR [ebp-656]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1224]
	mov	eax, DWORD PTR [ebp-656]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1224
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1224
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1224
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1224
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1224
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1224
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-660], OFFSET FLAT:CommonInterruptHandler154
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1232]
	mov	eax, DWORD PTR [ebp-660]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1232]
	mov	eax, DWORD PTR [ebp-660]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1232
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1232
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1232
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1232
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1232
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1232
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-664], OFFSET FLAT:CommonInterruptHandler155
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1240]
	mov	eax, DWORD PTR [ebp-664]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1240]
	mov	eax, DWORD PTR [ebp-664]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1240
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1240
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1240
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1240
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1240
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1240
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-668], OFFSET FLAT:CommonInterruptHandler156
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1248]
	mov	eax, DWORD PTR [ebp-668]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1248]
	mov	eax, DWORD PTR [ebp-668]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1248
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1248
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1248
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1248
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1248
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1248
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-672], OFFSET FLAT:CommonInterruptHandler157
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1256]
	mov	eax, DWORD PTR [ebp-672]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1256]
	mov	eax, DWORD PTR [ebp-672]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1256
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1256
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1256
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1256
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1256
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1256
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-676], OFFSET FLAT:CommonInterruptHandler158
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1264]
	mov	eax, DWORD PTR [ebp-676]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1264]
	mov	eax, DWORD PTR [ebp-676]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1264
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1264
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1264
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1264
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1264
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1264
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-680], OFFSET FLAT:CommonInterruptHandler159
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1272]
	mov	eax, DWORD PTR [ebp-680]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1272]
	mov	eax, DWORD PTR [ebp-680]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1272
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1272
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1272
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1272
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1272
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1272
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-684], OFFSET FLAT:CommonInterruptHandler160
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1280]
	mov	eax, DWORD PTR [ebp-684]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1280]
	mov	eax, DWORD PTR [ebp-684]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1280
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1280
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1280
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1280
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1280
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1280
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-688], OFFSET FLAT:CommonInterruptHandler161
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1288]
	mov	eax, DWORD PTR [ebp-688]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1288]
	mov	eax, DWORD PTR [ebp-688]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1288
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1288
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1288
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1288
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1288
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1288
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-692], OFFSET FLAT:CommonInterruptHandler162
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1296]
	mov	eax, DWORD PTR [ebp-692]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1296]
	mov	eax, DWORD PTR [ebp-692]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1296
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1296
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1296
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1296
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1296
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1296
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-696], OFFSET FLAT:CommonInterruptHandler163
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1304]
	mov	eax, DWORD PTR [ebp-696]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1304]
	mov	eax, DWORD PTR [ebp-696]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1304
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1304
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1304
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1304
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1304
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1304
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-700], OFFSET FLAT:CommonInterruptHandler164
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1312]
	mov	eax, DWORD PTR [ebp-700]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1312]
	mov	eax, DWORD PTR [ebp-700]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1312
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1312
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1312
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1312
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1312
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1312
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-704], OFFSET FLAT:CommonInterruptHandler165
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1320]
	mov	eax, DWORD PTR [ebp-704]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1320]
	mov	eax, DWORD PTR [ebp-704]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1320
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1320
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1320
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1320
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1320
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1320
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-708], OFFSET FLAT:CommonInterruptHandler166
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1328]
	mov	eax, DWORD PTR [ebp-708]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1328]
	mov	eax, DWORD PTR [ebp-708]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1328
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1328
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1328
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1328
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1328
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1328
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-712], OFFSET FLAT:CommonInterruptHandler167
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1336]
	mov	eax, DWORD PTR [ebp-712]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1336]
	mov	eax, DWORD PTR [ebp-712]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1336
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1336
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1336
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1336
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1336
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1336
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-716], OFFSET FLAT:CommonInterruptHandler168
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1344]
	mov	eax, DWORD PTR [ebp-716]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1344]
	mov	eax, DWORD PTR [ebp-716]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1344
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1344
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1344
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1344
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1344
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1344
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-720], OFFSET FLAT:CommonInterruptHandler169
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1352]
	mov	eax, DWORD PTR [ebp-720]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1352]
	mov	eax, DWORD PTR [ebp-720]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1352
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1352
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1352
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1352
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1352
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1352
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-724], OFFSET FLAT:CommonInterruptHandler170
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1360]
	mov	eax, DWORD PTR [ebp-724]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1360]
	mov	eax, DWORD PTR [ebp-724]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1360
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1360
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1360
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1360
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1360
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1360
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-728], OFFSET FLAT:CommonInterruptHandler171
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1368]
	mov	eax, DWORD PTR [ebp-728]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1368]
	mov	eax, DWORD PTR [ebp-728]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1368
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1368
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1368
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1368
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1368
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1368
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-732], OFFSET FLAT:CommonInterruptHandler172
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1376]
	mov	eax, DWORD PTR [ebp-732]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1376]
	mov	eax, DWORD PTR [ebp-732]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1376
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1376
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1376
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1376
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1376
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1376
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-736], OFFSET FLAT:CommonInterruptHandler173
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1384]
	mov	eax, DWORD PTR [ebp-736]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1384]
	mov	eax, DWORD PTR [ebp-736]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1384
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1384
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1384
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1384
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1384
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1384
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-740], OFFSET FLAT:CommonInterruptHandler174
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1392]
	mov	eax, DWORD PTR [ebp-740]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1392]
	mov	eax, DWORD PTR [ebp-740]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1392
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1392
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1392
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1392
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1392
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1392
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-744], OFFSET FLAT:CommonInterruptHandler175
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1400]
	mov	eax, DWORD PTR [ebp-744]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1400]
	mov	eax, DWORD PTR [ebp-744]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1400
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1400
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1400
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1400
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1400
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1400
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-748], OFFSET FLAT:CommonInterruptHandler176
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1408]
	mov	eax, DWORD PTR [ebp-748]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1408]
	mov	eax, DWORD PTR [ebp-748]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1408
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1408
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1408
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1408
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1408
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1408
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-752], OFFSET FLAT:CommonInterruptHandler177
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1416]
	mov	eax, DWORD PTR [ebp-752]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1416]
	mov	eax, DWORD PTR [ebp-752]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1416
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1416
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1416
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1416
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1416
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1416
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-756], OFFSET FLAT:CommonInterruptHandler178
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1424]
	mov	eax, DWORD PTR [ebp-756]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1424]
	mov	eax, DWORD PTR [ebp-756]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1424
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1424
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1424
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1424
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1424
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1424
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-760], OFFSET FLAT:CommonInterruptHandler179
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1432]
	mov	eax, DWORD PTR [ebp-760]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1432]
	mov	eax, DWORD PTR [ebp-760]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1432
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1432
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1432
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1432
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1432
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1432
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-764], OFFSET FLAT:CommonInterruptHandler180
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1440]
	mov	eax, DWORD PTR [ebp-764]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1440]
	mov	eax, DWORD PTR [ebp-764]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1440
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1440
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1440
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1440
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1440
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1440
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-768], OFFSET FLAT:CommonInterruptHandler181
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1448]
	mov	eax, DWORD PTR [ebp-768]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1448]
	mov	eax, DWORD PTR [ebp-768]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1448
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1448
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1448
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1448
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1448
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1448
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-772], OFFSET FLAT:CommonInterruptHandler182
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1456]
	mov	eax, DWORD PTR [ebp-772]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1456]
	mov	eax, DWORD PTR [ebp-772]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1456
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1456
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1456
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1456
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1456
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1456
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-776], OFFSET FLAT:CommonInterruptHandler183
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1464]
	mov	eax, DWORD PTR [ebp-776]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1464]
	mov	eax, DWORD PTR [ebp-776]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1464
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1464
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1464
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1464
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1464
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1464
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-780], OFFSET FLAT:CommonInterruptHandler184
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1472]
	mov	eax, DWORD PTR [ebp-780]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1472]
	mov	eax, DWORD PTR [ebp-780]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1472
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1472
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1472
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1472
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1472
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1472
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-784], OFFSET FLAT:CommonInterruptHandler185
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1480]
	mov	eax, DWORD PTR [ebp-784]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1480]
	mov	eax, DWORD PTR [ebp-784]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1480
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1480
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1480
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1480
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1480
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1480
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-788], OFFSET FLAT:CommonInterruptHandler186
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1488]
	mov	eax, DWORD PTR [ebp-788]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1488]
	mov	eax, DWORD PTR [ebp-788]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1488
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1488
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1488
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1488
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1488
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1488
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-792], OFFSET FLAT:CommonInterruptHandler187
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1496]
	mov	eax, DWORD PTR [ebp-792]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1496]
	mov	eax, DWORD PTR [ebp-792]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1496
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1496
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1496
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1496
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1496
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1496
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-796], OFFSET FLAT:CommonInterruptHandler188
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1504]
	mov	eax, DWORD PTR [ebp-796]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1504]
	mov	eax, DWORD PTR [ebp-796]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1504
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1504
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1504
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1504
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1504
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1504
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-800], OFFSET FLAT:CommonInterruptHandler189
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1512]
	mov	eax, DWORD PTR [ebp-800]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1512]
	mov	eax, DWORD PTR [ebp-800]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1512
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1512
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1512
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1512
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1512
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1512
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-804], OFFSET FLAT:CommonInterruptHandler190
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1520]
	mov	eax, DWORD PTR [ebp-804]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1520]
	mov	eax, DWORD PTR [ebp-804]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1520
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1520
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1520
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1520
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1520
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1520
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-808], OFFSET FLAT:CommonInterruptHandler191
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1528]
	mov	eax, DWORD PTR [ebp-808]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1528]
	mov	eax, DWORD PTR [ebp-808]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1528
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1528
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1528
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1528
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1528
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1528
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-812], OFFSET FLAT:CommonInterruptHandler192
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1536]
	mov	eax, DWORD PTR [ebp-812]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1536]
	mov	eax, DWORD PTR [ebp-812]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1536
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1536
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1536
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1536
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1536
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1536
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-816], OFFSET FLAT:CommonInterruptHandler193
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1544]
	mov	eax, DWORD PTR [ebp-816]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1544]
	mov	eax, DWORD PTR [ebp-816]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1544
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1544
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1544
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1544
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1544
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1544
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-820], OFFSET FLAT:CommonInterruptHandler194
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1552]
	mov	eax, DWORD PTR [ebp-820]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1552]
	mov	eax, DWORD PTR [ebp-820]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1552
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1552
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1552
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1552
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1552
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1552
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-824], OFFSET FLAT:CommonInterruptHandler195
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1560]
	mov	eax, DWORD PTR [ebp-824]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1560]
	mov	eax, DWORD PTR [ebp-824]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1560
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1560
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1560
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1560
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1560
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1560
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-828], OFFSET FLAT:CommonInterruptHandler196
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1568]
	mov	eax, DWORD PTR [ebp-828]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1568]
	mov	eax, DWORD PTR [ebp-828]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1568
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1568
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1568
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1568
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1568
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1568
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-832], OFFSET FLAT:CommonInterruptHandler197
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1576]
	mov	eax, DWORD PTR [ebp-832]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1576]
	mov	eax, DWORD PTR [ebp-832]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1576
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1576
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1576
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1576
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1576
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1576
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-836], OFFSET FLAT:CommonInterruptHandler198
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1584]
	mov	eax, DWORD PTR [ebp-836]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1584]
	mov	eax, DWORD PTR [ebp-836]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1584
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1584
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1584
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1584
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1584
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1584
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-840], OFFSET FLAT:CommonInterruptHandler199
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1592]
	mov	eax, DWORD PTR [ebp-840]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1592]
	mov	eax, DWORD PTR [ebp-840]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1592
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1592
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1592
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1592
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1592
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1592
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-844], OFFSET FLAT:CommonInterruptHandler200
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1600]
	mov	eax, DWORD PTR [ebp-844]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1600]
	mov	eax, DWORD PTR [ebp-844]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1600
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1600
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1600
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1600
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1600
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1600
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-848], OFFSET FLAT:CommonInterruptHandler201
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1608]
	mov	eax, DWORD PTR [ebp-848]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1608]
	mov	eax, DWORD PTR [ebp-848]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1608
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1608
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1608
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1608
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1608
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1608
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-852], OFFSET FLAT:CommonInterruptHandler202
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1616]
	mov	eax, DWORD PTR [ebp-852]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1616]
	mov	eax, DWORD PTR [ebp-852]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1616
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1616
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1616
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1616
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1616
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1616
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-856], OFFSET FLAT:CommonInterruptHandler203
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1624]
	mov	eax, DWORD PTR [ebp-856]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1624]
	mov	eax, DWORD PTR [ebp-856]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1624
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1624
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1624
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1624
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1624
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1624
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-860], OFFSET FLAT:CommonInterruptHandler204
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1632]
	mov	eax, DWORD PTR [ebp-860]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1632]
	mov	eax, DWORD PTR [ebp-860]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1632
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1632
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1632
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1632
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1632
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1632
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-864], OFFSET FLAT:CommonInterruptHandler205
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1640]
	mov	eax, DWORD PTR [ebp-864]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1640]
	mov	eax, DWORD PTR [ebp-864]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1640
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1640
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1640
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1640
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1640
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1640
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-868], OFFSET FLAT:CommonInterruptHandler206
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1648]
	mov	eax, DWORD PTR [ebp-868]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1648]
	mov	eax, DWORD PTR [ebp-868]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1648
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1648
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1648
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1648
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1648
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1648
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-872], OFFSET FLAT:CommonInterruptHandler207
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1656]
	mov	eax, DWORD PTR [ebp-872]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1656]
	mov	eax, DWORD PTR [ebp-872]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1656
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1656
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1656
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1656
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1656
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1656
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-876], OFFSET FLAT:CommonInterruptHandler208
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1664]
	mov	eax, DWORD PTR [ebp-876]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1664]
	mov	eax, DWORD PTR [ebp-876]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1664
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1664
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1664
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1664
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1664
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1664
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-880], OFFSET FLAT:CommonInterruptHandler209
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1672]
	mov	eax, DWORD PTR [ebp-880]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1672]
	mov	eax, DWORD PTR [ebp-880]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1672
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1672
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1672
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1672
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1672
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1672
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-884], OFFSET FLAT:CommonInterruptHandler210
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1680]
	mov	eax, DWORD PTR [ebp-884]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1680]
	mov	eax, DWORD PTR [ebp-884]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1680
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1680
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1680
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1680
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1680
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1680
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-888], OFFSET FLAT:CommonInterruptHandler211
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1688]
	mov	eax, DWORD PTR [ebp-888]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1688]
	mov	eax, DWORD PTR [ebp-888]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1688
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1688
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1688
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1688
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1688
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1688
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-892], OFFSET FLAT:CommonInterruptHandler212
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1696]
	mov	eax, DWORD PTR [ebp-892]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1696]
	mov	eax, DWORD PTR [ebp-892]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1696
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1696
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1696
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1696
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1696
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1696
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-896], OFFSET FLAT:CommonInterruptHandler213
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1704]
	mov	eax, DWORD PTR [ebp-896]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1704]
	mov	eax, DWORD PTR [ebp-896]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1704
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1704
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1704
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1704
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1704
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1704
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-900], OFFSET FLAT:CommonInterruptHandler214
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1712]
	mov	eax, DWORD PTR [ebp-900]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1712]
	mov	eax, DWORD PTR [ebp-900]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1712
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1712
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1712
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1712
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1712
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1712
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-904], OFFSET FLAT:CommonInterruptHandler215
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1720]
	mov	eax, DWORD PTR [ebp-904]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1720]
	mov	eax, DWORD PTR [ebp-904]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1720
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1720
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1720
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1720
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1720
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1720
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-908], OFFSET FLAT:CommonInterruptHandler216
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1728]
	mov	eax, DWORD PTR [ebp-908]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1728]
	mov	eax, DWORD PTR [ebp-908]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1728
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1728
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1728
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1728
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1728
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1728
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-912], OFFSET FLAT:CommonInterruptHandler217
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1736]
	mov	eax, DWORD PTR [ebp-912]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1736]
	mov	eax, DWORD PTR [ebp-912]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1736
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1736
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1736
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1736
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1736
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1736
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-916], OFFSET FLAT:CommonInterruptHandler218
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1744]
	mov	eax, DWORD PTR [ebp-916]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1744]
	mov	eax, DWORD PTR [ebp-916]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1744
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1744
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1744
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1744
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1744
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1744
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-920], OFFSET FLAT:CommonInterruptHandler219
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1752]
	mov	eax, DWORD PTR [ebp-920]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1752]
	mov	eax, DWORD PTR [ebp-920]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1752
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1752
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1752
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1752
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1752
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1752
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-924], OFFSET FLAT:CommonInterruptHandler220
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1760]
	mov	eax, DWORD PTR [ebp-924]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1760]
	mov	eax, DWORD PTR [ebp-924]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1760
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1760
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1760
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1760
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1760
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1760
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-928], OFFSET FLAT:CommonInterruptHandler221
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1768]
	mov	eax, DWORD PTR [ebp-928]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1768]
	mov	eax, DWORD PTR [ebp-928]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1768
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1768
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1768
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1768
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1768
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1768
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-932], OFFSET FLAT:CommonInterruptHandler222
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1776]
	mov	eax, DWORD PTR [ebp-932]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1776]
	mov	eax, DWORD PTR [ebp-932]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1776
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1776
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1776
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1776
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1776
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1776
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-936], OFFSET FLAT:CommonInterruptHandler223
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1784]
	mov	eax, DWORD PTR [ebp-936]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1784]
	mov	eax, DWORD PTR [ebp-936]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1784
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1784
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1784
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1784
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1784
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1784
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-940], OFFSET FLAT:CommonInterruptHandler224
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1792]
	mov	eax, DWORD PTR [ebp-940]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1792]
	mov	eax, DWORD PTR [ebp-940]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1792
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1792
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1792
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1792
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1792
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1792
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-944], OFFSET FLAT:CommonInterruptHandler225
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1800]
	mov	eax, DWORD PTR [ebp-944]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1800]
	mov	eax, DWORD PTR [ebp-944]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1800
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1800
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1800
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1800
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1800
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1800
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-948], OFFSET FLAT:CommonInterruptHandler226
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1808]
	mov	eax, DWORD PTR [ebp-948]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1808]
	mov	eax, DWORD PTR [ebp-948]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1808
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1808
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1808
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1808
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1808
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1808
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-952], OFFSET FLAT:CommonInterruptHandler227
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1816]
	mov	eax, DWORD PTR [ebp-952]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1816]
	mov	eax, DWORD PTR [ebp-952]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1816
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1816
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1816
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1816
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1816
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1816
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-956], OFFSET FLAT:CommonInterruptHandler228
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1824]
	mov	eax, DWORD PTR [ebp-956]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1824]
	mov	eax, DWORD PTR [ebp-956]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1824
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1824
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1824
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1824
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1824
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1824
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-960], OFFSET FLAT:CommonInterruptHandler229
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1832]
	mov	eax, DWORD PTR [ebp-960]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1832]
	mov	eax, DWORD PTR [ebp-960]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1832
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1832
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1832
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1832
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1832
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1832
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-964], OFFSET FLAT:CommonInterruptHandler230
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1840]
	mov	eax, DWORD PTR [ebp-964]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1840]
	mov	eax, DWORD PTR [ebp-964]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1840
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1840
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1840
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1840
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1840
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1840
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-968], OFFSET FLAT:CommonInterruptHandler231
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1848]
	mov	eax, DWORD PTR [ebp-968]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1848]
	mov	eax, DWORD PTR [ebp-968]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1848
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1848
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1848
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1848
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1848
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1848
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-972], OFFSET FLAT:CommonInterruptHandler232
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1856]
	mov	eax, DWORD PTR [ebp-972]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1856]
	mov	eax, DWORD PTR [ebp-972]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1856
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1856
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1856
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1856
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1856
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1856
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-976], OFFSET FLAT:CommonInterruptHandler233
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1864]
	mov	eax, DWORD PTR [ebp-976]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1864]
	mov	eax, DWORD PTR [ebp-976]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1864
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1864
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1864
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1864
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1864
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1864
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-980], OFFSET FLAT:CommonInterruptHandler234
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1872]
	mov	eax, DWORD PTR [ebp-980]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1872]
	mov	eax, DWORD PTR [ebp-980]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1872
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1872
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1872
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1872
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1872
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1872
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-984], OFFSET FLAT:CommonInterruptHandler235
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1880]
	mov	eax, DWORD PTR [ebp-984]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1880]
	mov	eax, DWORD PTR [ebp-984]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1880
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1880
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1880
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1880
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1880
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1880
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-988], OFFSET FLAT:CommonInterruptHandler236
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1888]
	mov	eax, DWORD PTR [ebp-988]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1888]
	mov	eax, DWORD PTR [ebp-988]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1888
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1888
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1888
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1888
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1888
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1888
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-992], OFFSET FLAT:CommonInterruptHandler237
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1896]
	mov	eax, DWORD PTR [ebp-992]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1896]
	mov	eax, DWORD PTR [ebp-992]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1896
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1896
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1896
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1896
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1896
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1896
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-996], OFFSET FLAT:CommonInterruptHandler238
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1904]
	mov	eax, DWORD PTR [ebp-996]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1904]
	mov	eax, DWORD PTR [ebp-996]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1904
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1904
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1904
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1904
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1904
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1904
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1000], OFFSET FLAT:CommonInterruptHandler239
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1912]
	mov	eax, DWORD PTR [ebp-1000]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1912]
	mov	eax, DWORD PTR [ebp-1000]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1912
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1912
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1912
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1912
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1912
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1912
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1004], OFFSET FLAT:CommonInterruptHandler240
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1920]
	mov	eax, DWORD PTR [ebp-1004]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1920]
	mov	eax, DWORD PTR [ebp-1004]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1920
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1920
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1920
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1920
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1920
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1920
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1008], OFFSET FLAT:CommonInterruptHandler241
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1928]
	mov	eax, DWORD PTR [ebp-1008]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1928]
	mov	eax, DWORD PTR [ebp-1008]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1928
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1928
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1928
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1928
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1928
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1928
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1012], OFFSET FLAT:CommonInterruptHandler242
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1936]
	mov	eax, DWORD PTR [ebp-1012]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1936]
	mov	eax, DWORD PTR [ebp-1012]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1936
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1936
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1936
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1936
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1936
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1936
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1016], OFFSET FLAT:CommonInterruptHandler243
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1944]
	mov	eax, DWORD PTR [ebp-1016]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1944]
	mov	eax, DWORD PTR [ebp-1016]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1944
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1944
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1944
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1944
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1944
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1944
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1020], OFFSET FLAT:CommonInterruptHandler244
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1952]
	mov	eax, DWORD PTR [ebp-1020]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1952]
	mov	eax, DWORD PTR [ebp-1020]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1952
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1952
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1952
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1952
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1952
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1952
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1024], OFFSET FLAT:CommonInterruptHandler245
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1960]
	mov	eax, DWORD PTR [ebp-1024]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1960]
	mov	eax, DWORD PTR [ebp-1024]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1960
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1960
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1960
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1960
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1960
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1960
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1028], OFFSET FLAT:CommonInterruptHandler246
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1968]
	mov	eax, DWORD PTR [ebp-1028]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1968]
	mov	eax, DWORD PTR [ebp-1028]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1968
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1968
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1968
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1968
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1968
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1968
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1032], OFFSET FLAT:CommonInterruptHandler247
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1976]
	mov	eax, DWORD PTR [ebp-1032]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1976]
	mov	eax, DWORD PTR [ebp-1032]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1976
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1976
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1976
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1976
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1976
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1976
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1036], OFFSET FLAT:CommonInterruptHandler248
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1984]
	mov	eax, DWORD PTR [ebp-1036]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1984]
	mov	eax, DWORD PTR [ebp-1036]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1984
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1984
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1984
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1984
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1984
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1984
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1040], OFFSET FLAT:CommonInterruptHandler249
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1992]
	mov	eax, DWORD PTR [ebp-1040]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+1992]
	mov	eax, DWORD PTR [ebp-1040]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1992
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1992
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1992
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1992
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1992
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 1992
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1044], OFFSET FLAT:CommonInterruptHandler250
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+2000]
	mov	eax, DWORD PTR [ebp-1044]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+2000]
	mov	eax, DWORD PTR [ebp-1044]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2000
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2000
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2000
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2000
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2000
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2000
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1048], OFFSET FLAT:CommonInterruptHandler251
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+2008]
	mov	eax, DWORD PTR [ebp-1048]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+2008]
	mov	eax, DWORD PTR [ebp-1048]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2008
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2008
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2008
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2008
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2008
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2008
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1052], OFFSET FLAT:CommonInterruptHandler252
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+2016]
	mov	eax, DWORD PTR [ebp-1052]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+2016]
	mov	eax, DWORD PTR [ebp-1052]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2016
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2016
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2016
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2016
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2016
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2016
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1056], OFFSET FLAT:CommonInterruptHandler253
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+2024]
	mov	eax, DWORD PTR [ebp-1056]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+2024]
	mov	eax, DWORD PTR [ebp-1056]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2024
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2024
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2024
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2024
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2024
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2024
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1060], OFFSET FLAT:CommonInterruptHandler254
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+2032]
	mov	eax, DWORD PTR [ebp-1060]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+2032]
	mov	eax, DWORD PTR [ebp-1060]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2032
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2032
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2032
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2032
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2032
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2032
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	DWORD PTR [ebp-1064], OFFSET FLAT:CommonInterruptHandler255
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+2040]
	mov	eax, DWORD PTR [ebp-1064]
	mov	WORD PTR [edx], ax
	mov	eax, DWORD PTR [ebp-40]
	lea	edx, [eax+2040]
	mov	eax, DWORD PTR [ebp-1064]
	shr	eax, 16
	mov	WORD PTR [edx+6], ax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2040
	mov	WORD PTR [eax+2], 8
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2040
	mov	BYTE PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2040
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 14
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2040
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2040
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR [ebp-40]
	add	eax, 2040
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	mov	eax, DWORD PTR IDT_Pointer
	mov	DWORD PTR [ebp-1068], eax
	mov	eax, DWORD PTR [ebp-1068]
	mov	WORD PTR [eax], 2047
	mov	eax, DWORD PTR [ebp-1068]
	mov	edx, DWORD PTR [ebp-40]
	mov	DWORD PTR [eax+4], edx
/APP
/  1272 "main.c" 1
	lea EAX, [IDT_Pointer]
lidt [EAX]

/  0 "" 2
/NO_APP
	mov	DWORD PTR [esp+4], 17
	mov	DWORD PTR [esp], 32
	call	outb
	mov	DWORD PTR [esp+4], 17
	mov	DWORD PTR [esp], 160
	call	outb
	mov	DWORD PTR [esp+4], 32
	mov	DWORD PTR [esp], 33
	call	outb
	mov	DWORD PTR [esp+4], 40
	mov	DWORD PTR [esp], 161
	call	outb
	mov	DWORD PTR [esp+4], 4
	mov	DWORD PTR [esp], 33
	call	outb
	mov	DWORD PTR [esp+4], 2
	mov	DWORD PTR [esp], 161
	call	outb
	mov	DWORD PTR [esp+4], 1
	mov	DWORD PTR [esp], 33
	call	outb
	mov	DWORD PTR [esp+4], 1
	mov	DWORD PTR [esp], 161
	call	outb
	mov	DWORD PTR [esp+4], 255
	mov	DWORD PTR [esp], 33
	call	outb
	mov	DWORD PTR [esp+4], 255
	mov	DWORD PTR [esp], 161
	call	outb
/APP
/  1299 "main.c" 1
	sti
nop

/  0 "" 2
/  1304 "main.c" 1
	cli
nop

/  0 "" 2
/  1306 "main.c" 1
	in AL, 0x21
and AL, 0xFC
out 0x21, AL

/  0 "" 2
/NO_APP
	mov	DWORD PTR [esp+4], 52
	mov	DWORD PTR [esp], 67
	call	outb
	mov	DWORD PTR [esp+4], 255
	mov	DWORD PTR [esp], 64
	call	outb
	mov	DWORD PTR [esp+4], 255
	mov	DWORD PTR [esp], 64
	call	outb
/APP
/  1317 "main.c" 1
	sti
nop

/  0 "" 2
/NO_APP
.L445:
	jmp	.L445
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.local	shiftPressed.1668
	.comm	shiftPressed.1668,1,1
	.local	ctrlPressed.1669
	.comm	ctrlPressed.1669,1,1
	.local	altPressed.1670
	.comm	altPressed.1670,1,1
	.local	CurrentLocation.2059
	.comm	CurrentLocation.2059,4,4
	.ident	"GCC: (GNU) 4.8.2"
