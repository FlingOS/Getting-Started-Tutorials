GLOBAL method_System_Void_RETEND_SampleKernel_Kernel_DECLEND_PICRemap_NAMEEND___:function

method_System_Void_RETEND_SampleKernel_Kernel_DECLEND_PICRemap_NAMEEND___:
push dword ebp
mov dword ebp, esp

	; Remap IRQs 0-7    to    ISRs 32-39
	; and   IRQs 8-15    to    ISRs 40-47

	cli					; Disable interrupts

    ; Interrupt Vectors 0x20 for IRQ 0 to 7 and 0x28 for IRQ 8 to 15
    mov al, 0x11        ; INIT command
    out 0x20, al        ; send INIT to PIC1
    out 0xA0, al        ; send INIT to PIC2

    mov al, 0x20        ; PIC1 interrupts start at 0x20
    out 0x21, al        ; send the port to PIC1 DATA
    mov al, 0x28        ; PIC2 interrupts start at 0x28
    out 0xA1, al        ; send the port to PIC2 DATA

    mov al, 0x04        ; MASTER code
    out 0x21, al        ; set PIC1 as MASTER
    mov al, 0x02        ; SLAVE code
    out 0xA1, al        ; set PIC2 as SLAVE

    dec al              ; al is now 1. This is the x86 mode code for both 8259 PIC chips
    out 0x21, al        ; set PIC1
    out 0xA1, al        ; set PIC2
	
	mov ax, 0xFFFF		; Set interrupt mask to disable all interrupts
    out 0x21, al        ; Set mask of PIC1_DATA
    xchg al, ah
    out 0xA1, al        ; Set mask of PIC2_DATA

	sti					; Enable interrupts
	nop					; Required - STI takes effect after the next instruction runs

pop dword ebp

ret