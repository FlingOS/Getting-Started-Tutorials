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

%macro GetHandlerPtr 1
GLOBAL method_System_UInt32_RETEND_SampleKernel_Kernel_DECLEND_GetInterrupt%{1}HandlerPtr_NAMEEND___:function
EXTERN CommonInterruptHandler%{1}

method_System_UInt32_RETEND_SampleKernel_Kernel_DECLEND_GetInterrupt%{1}HandlerPtr_NAMEEND___:
push dword EBP
mov dword EBP, ESP

mov dword [EBP+8], CommonInterruptHandler%{1}

pop dword EBP
ret
%endmacro
%assign HandlerNum 0
%rep 256
    GetHandlerPtr HandlerNum
    %assign HandlerNum HandlerNum+1
%endrep