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

GLOBAL _Kernel_Start:function

SECTION .text

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

_Kernel_Start:
	
	cli ; Disable maskable interrupts (i.e. disable device interrupts e.g. the timer)

	; BEGIN - Set Screen Colour
	mov EAX, 0x2000  ; 0x20-- = Green bg, black text, 0x--00 = null (i.e. no) character 
	mov EBX, 0xB8000 ; 0xB8000 = Start of display memory
	mov ECX, 2000	 ; 80x25 characters
Print:
	mov word [EBX], AX
	add EBX, 2
	loop Print
	; END - Set Screen Colour
	
	; BEGIN - Switch to protected mode 
	mov dword EAX, CR0
	or EAX, 1
	mov dword CR0, EAX
	; END - Switch to protected mode
		
Halt:
	jmp Halt ; Infinite loop