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
	mov	DWORD PTR [ebp-4], 99999999
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
	.globl	DisplayColour
	.type	DisplayColour, @function
DisplayColour:
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
	mov	DWORD PTR [ebp-16], 2000
	mov	DWORD PTR [ebp-4], 0
	jmp	.L4
.L5:
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
	mov	eax, DWORD PTR [ebp-4]
	cmp	eax, DWORD PTR [ebp-16]
	jb	.L5
	call	Delay
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	DisplayColour, .-DisplayColour
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 56
/APP
/  37 "main.c" 1
	mov EAX, 0x2F
mov EBX, 0xB8000
mov ECX, 2000
.ColourOutput2:
movb [EBX], 0
movb [EBX+1], AL
add EBX, 2
loop .ColourOutput2
mov ECX, 0x0F000000
.DelayLoop1:
loop .DelayLoop1

/  0 "" 2
/NO_APP
	mov	DWORD PTR [ebp-4], 7
	mov	DWORD PTR [ebp-12], 4
	mov	DWORD PTR [ebp-16], 1024
	mov	DWORD PTR [ebp-20], 0
	mov	eax, DWORD PTR [ebp-12]
	imul	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [ebp-24], eax
	mov	BYTE PTR [ebp-25], 1
	mov	BYTE PTR [ebp-26], 15
	mov	DWORD PTR [ebp-8], 0
	mov	eax, OFFSET FLAT:Page_Table1
	add	eax, 1073741824
	mov	DWORD PTR [ebp-32], eax
	mov	eax, OFFSET FLAT:Page_Directory
	add	eax, 1073741824
	mov	DWORD PTR [ebp-36], eax
	jmp	.L7
.L8:
	mov	eax, DWORD PTR [ebp-8]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp-32]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-4]
	mov	DWORD PTR [edx], eax
	add	DWORD PTR [ebp-8], 1
	add	DWORD PTR [ebp-4], 4096
.L7:
	mov	eax, DWORD PTR [ebp-20]
	mov	edx, DWORD PTR [ebp-24]
	add	eax, edx
	cmp	eax, DWORD PTR [ebp-8]
	ja	.L8
	mov	DWORD PTR [ebp-4], 7
	mov	DWORD PTR [ebp-8], 786432
	mov	DWORD PTR [ebp-20], 786432
	jmp	.L9
.L10:
	mov	eax, DWORD PTR [ebp-8]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp-32]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-4]
	mov	DWORD PTR [edx], eax
	add	DWORD PTR [ebp-8], 1
	add	DWORD PTR [ebp-4], 4096
.L9:
	mov	eax, DWORD PTR [ebp-20]
	mov	edx, DWORD PTR [ebp-24]
	add	eax, edx
	cmp	eax, DWORD PTR [ebp-8]
	ja	.L10
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [ebp-4], eax
	or	DWORD PTR [ebp-4], 7
	mov	DWORD PTR [ebp-40], 1024
	mov	DWORD PTR [ebp-8], 0
	jmp	.L11
.L12:
	mov	eax, DWORD PTR [ebp-8]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp-36]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-4]
	mov	DWORD PTR [edx], eax
	add	DWORD PTR [ebp-8], 1
	add	DWORD PTR [ebp-4], 4096
.L11:
	mov	eax, DWORD PTR [ebp-8]
	cmp	eax, DWORD PTR [ebp-40]
	jb	.L12
/APP
/  102 "main.c" 1
	lea ECX, [Page_Directory - 0xC0000000]
mov CR3, ECX

/  0 "" 2
/  109 "main.c" 1
	mov ECX, CR0
or ECX, 0x80000000
mov CR0, ECX

/  0 "" 2
/  119 "main.c" 1
	lea ECX, [StartInHigherHalf]
jmp ECX
StartInHigherHalf:
nop

/  0 "" 2
/NO_APP
	mov	BYTE PTR [ebp-25], 11
	movzx	edx, BYTE PTR [ebp-26]
	movzx	eax, BYTE PTR [ebp-25]
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	DisplayColour
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.2"
