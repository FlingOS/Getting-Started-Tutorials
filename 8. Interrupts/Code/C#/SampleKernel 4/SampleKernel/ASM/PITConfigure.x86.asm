GLOBAL method_System_Void_RETEND_SampleKernel_Kernel_DECLEND_PITConfigure_NAMEEND___:function

method_System_Void_RETEND_SampleKernel_Kernel_DECLEND_PITConfigure_NAMEEND___:
push dword ebp
mov dword ebp, esp

	cli

	; Unmask (i.e. enable) the timer interrupt in the PIC
	in AL, 0x21
	and AL, 0xFE
	out 0x21, AL

	; Configure timer 0 of the PIT to be a slow rate generator
	mov AL, 0x34
	out 0x43, AL
	mov AL, 0xFF
	out 0x40, AL
	out 0x40, AL

	sti
	nop

pop dword ebp

ret