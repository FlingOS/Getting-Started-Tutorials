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

GLOBAL method_System_Void_RETEND_SampleKernel_Kernel_DECLEND_LoadIDT_NAMEEND___:function
EXTERN IDT_Pointer

method_System_Void_RETEND_SampleKernel_Kernel_DECLEND_LoadIDT_NAMEEND___:
push dword EBP
mov dword EBP, ESP

lea EAX, [IDT_Pointer]
lidt [EAX]
int 17

pop dword EBP
ret