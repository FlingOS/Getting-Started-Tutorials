; 
; FlingOS™ Getting Started tutorials
; Copyright (C) 2015  Edward Nutting
; 
; This program is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; either version 2 of the License, or
; (at your option) any later version.
; 
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
; 
; You should have received a copy of the GNU General Public License along
; with this program; if not, write to the Free Software Foundation, Inc.,
; 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
; 

BITS 32

GLOBAL IDT_Contents:data
GLOBAL IDT_Pointer:data
GLOBAL Interrupt17Handler:function
KERNEL_VIRTUAL_BASE equ 0xC0000000					; Constant declaring base of Higher-half kernel 
KERNEL_PAGE_TABLE equ (KERNEL_VIRTUAL_BASE >> 22)	; Constant declaring Page Table index in virtual memory

SECTION .text

GLOBAL Kernel_Start:function

EXTERN %KERNEL_CALL_STATIC_CONSTRUCTORS_METHOD%
EXTERN %KERNEL_MAIN_METHOD%
EXTERN method_System_Void_RETEND_SampleKernel_Kernel_DECLEND_InitPaging_NAMEEND__System_UInt32__System_UInt32__

; BEGIN - Multiboot Header
MultibootSignature dd 464367618
MultibootFlags dd 3
MultibootChecksum dd -464367621
MultibootGraphicsRuntime_VbeModeInfoAddr dd 2147483647
MultibootGraphicsRuntime_VbeControlInfoAddr dd 2147483647
MultibootGraphicsRuntime_VbeMode dd 2147483647
MultibootInfo_Memory_High dd 0
MultibootInfo_Memory_Low dd 0
; END - Multiboot Header

MultibootInfo_Structure dd 0

; BEGIN - Kernel stack space allocation
Kernel_Stack_End:
	TIMES 65535 db 0
Kernel_Stack_Start:
; END - Kernel stack space allocation

; BEGIN - GDT allocations
; This is the GDT table pre-filled with the entries we want
GDT_Contents:
; I have a suspicion that the order of the items in the GDT matters
;	Code and data selectors first then TSS
db 0, 0, 0, 0, 0, 0, 0, 0			; Offset: 0  - Null selector - required 
db 255, 255, 0, 0, 0, 0x9A, 0xCF, 0	; Offset: 8  - KM Code selector - covers the entire 4GiB address range
db 255, 255, 0, 0, 0, 0x92, 0xCF, 0	; Offset: 16 - KM Data selector - covers the entire 4GiB address range
db 255, 255, 0, 0, 0, 0xFA, 0xCF, 0	; Offset: 24 - UM Code selector - covers the entire 4GiB address range
db 255, 255, 0, 0, 0, 0xF2, 0xCF, 0	; Offset: 32 - UM Data selector - covers the entire 4GiB address range

;					   Size - Change iff adding/removing rows from GDT contents
;					   Size = Total bytes in GDT - 1
GDT_Pointer db 39, 0, 0, 0, 0, 0
; END - GDT allocations

; BEGIN - IDT allocations
IDT_Contents: TIMES 2048 db 0
IDT_Pointer db 0xFF, 0x7, 0, 0, 0, 0
; END - IDT allocations

Kernel_Start equ (_Kernel_Start - KERNEL_VIRTUAL_BASE)

_Kernel_Start:

	cli
	
	; MultiBoot compliant loader provides info in registers:
	; EBX=MultiBoot Info Structure Pointer
	; EAX=0x2BADBOO2
	
	; BEGIN - Multiboot Info
	mov dword ECX, 0x2BADB002
	cmp ECX, EAX
	jne (HandleNoMultiboot - KERNEL_VIRTUAL_BASE)
	
	mov dword [MultibootInfo_Structure - KERNEL_VIRTUAL_BASE], EBX
	add dword EBX, 0x4
	mov dword EAX, [EBX]
	mov dword [MultibootInfo_Memory_Low - KERNEL_VIRTUAL_BASE], EAX
	add dword EBX, 0x4
	mov dword EAX, [EBX]
	mov dword [MultibootInfo_Memory_High - KERNEL_VIRTUAL_BASE], EAX
	; END - Multiboot Info
	
	; BEGIN - Set Screen Colour
	mov dword EAX, 0x2F		; Colour: 0x2- = Green background, 0x-F = White foreground
	mov dword EBX, 0xB8000 	; Display Memory address
	mov dword ECX, 2000		; 80 x 25 Characters - VGA Text-mode Display size
	.ColourOutput:
	mov byte [EBX], 0
	mov byte [EBX+1], AL
	add EBX, 2
	loop .ColourOutput
	; END - Set Screen Colour
	
	; BEGIN - Switch to protected mode 
	mov dword EAX, CR0
	or EAX, 1
	mov dword CR0, EAX
	; END - Switch to protected mode
	
	; BEGIN - Set Screen Colour
	mov dword EAX, 0x3F		; Colour: 0x3- = Aqua background, 0x-F = White foreground
	mov dword EBX, 0xB8000 	; Display Memory address
	mov dword ECX, 2000		; 80 x 25 Characters - VGA Text-mode Display size
	.ColourOutput2:
	mov byte [EBX], 0
	mov byte [EBX+1], AL
	add EBX, 2
	loop .ColourOutput2
	; END - Set Screen Colour
	
	; BEGIN - Set stack pointer
	mov dword ESP, (Kernel_Stack_Start - KERNEL_VIRTUAL_BASE)
	; END - Set stack pointer
	
	; BEGIN - Set Screen Colour
	mov dword EAX, 0x4F		; Colour: 0x4- = Red background, 0x-F = White foreground
	mov dword EBX, 0xB8000 	; Display Memory address
	mov dword ECX, 2000		; 80 x 25 Characters - VGA Text-mode Display size
	.ColourOutput3:
	mov byte [EBX], 0
	mov byte [EBX+1], AL
	add EBX, 2
	loop .ColourOutput3
	; END - Set Screen Colour
	
	; BEGIN - Tell CPU about GDT
	mov dword [GDT_Pointer  - KERNEL_VIRTUAL_BASE + 2], (GDT_Contents - KERNEL_VIRTUAL_BASE)
	mov dword EAX, (GDT_Pointer - KERNEL_VIRTUAL_BASE)
	lgdt [EAX]
	
	; Set data segments
	mov dword EAX, 0x10
	mov word DS, EAX
	mov word ES, EAX
	mov word FS, EAX
	mov word GS, EAX
	mov word SS, EAX
	
	; Force reload of code segment
	jmp 8:(Boot_FlushCsGDT - KERNEL_VIRTUAL_BASE)
Boot_FlushCsGDT:
	; END - Tell CPU about GDT
	
	; BEGIN - Set Screen Colour
	mov dword EAX, 0x5F		; Colour: 0x5- = Purple background, 0x-F = White foreground
	mov dword EBX, 0xB8000 	; Display Memory address
	mov dword ECX, 2000		; 80 x 25 Characters - VGA Text-mode Display size
	.ColourOutput4:
	mov byte [EBX], 0
	mov byte [EBX+1], AL
	add EBX, 2
	loop .ColourOutput4
	; END - Set Screen Colour
	
	push dword Page_Directory
	push dword Page_Table1
	lea EAX, [method_System_Void_RETEND_SampleKernel_Kernel_DECLEND_InitPaging_NAMEEND__System_UInt32__System_UInt32__ - KERNEL_VIRTUAL_BASE]
	call EAX
	add ESP, 8
	
	lea ECX, [Page_Directory - KERNEL_VIRTUAL_BASE]
	mov CR3, ECX

	mov ECX, CR0
	or ECX, 0x80000000 ; Set PG bit in CR0 to enable paging.
	mov CR0, ECX

	lea ECX, [StartInHigherHalf]
	jmp ECX
StartInHigherHalf:
	nop
		
	call %KERNEL_CALL_STATIC_CONSTRUCTORS_METHOD%
	call %KERNEL_MAIN_METHOD%
	
	; BEGIN - Set Screen Colour
	mov dword EAX, 0x7F		; Colour: 0x7- = Grey background, 0x-F = White foreground
	mov dword EBX, 0xB8000 	; Display Memory address
	mov dword ECX, 2000		; 80 x 25 Characters - VGA Text-mode Display size
	.ColourOutput5:
	mov byte [EBX], 0
	mov byte [EBX+1], AL
	add EBX, 2
	loop .ColourOutput5
	; END - Set Screen Colour

	jmp Halt

EXTERN method_System_Void_RETEND_SampleKernel_Kernel_DECLEND_CommonInterruptHandler_NAMEEND__System_UInt32_

%macro InterruptHandlerMacro 1
GLOBAL CommonInterruptHandler%1:function
CommonInterruptHandler%1:
	pushad
	
	push dword %1
	call method_System_Void_RETEND_SampleKernel_Kernel_DECLEND_CommonInterruptHandler_NAMEEND__System_UInt32_
	add esp, 4
	


	popad
	
    IRet
%endmacro
%assign HandlerNum 0
%rep 256
    InterruptHandlerMacro HandlerNum
    %assign HandlerNum HandlerNum+1
%endrep
	
HandleNoMultiboot:
	; BEGIN - Set Screen Colour
	mov dword EAX, 0x4F		; Colour: 0x4- = Red background, 0x-F = White foreground
	mov dword EBX, 0xB8000 	; Display Memory address
	mov dword ECX, 2000		; 80 x 25 Characters - VGA Text-mode Display size
	.ColourOutput:
	mov byte [EBX], 0
	mov byte [EBX+1], AL
	add EBX, 2
	loop .ColourOutput
	; END - Set Screen Colour
	
Halt:
	cli			; Stop maskable interrupts
	hlt			; Halt the processor
	jmp Halt	; If non-maskable interrupt occurs, re-halt 
	
	
SECTION .bss

GLOBAL Page_Table1:data
GLOBAL Page_Directory:data

align 4096
Page_Table1: resb (1024 * 4 * 1024)	; Reserve uninitialised space for Page Table -  # of entries/page table * 4 bytes/entry * total # of page tables 
											; actual size = 4194304 bytes = 4MiB, represents 4GiB in physical memory
											; ie. each 4 byte entry represent 4 KiB in physical memory
Page_Directory: resb (1024 * 4 * 1) ; Reserve uninitialised space for Page Directory - # of pages tables * 4 bytes/entry * # of directory (4096 = 4 KiB)
