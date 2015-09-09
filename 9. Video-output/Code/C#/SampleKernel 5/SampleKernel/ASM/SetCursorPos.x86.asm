GLOBAL method_System_Void_RETEND_SampleKernel_Kernel_DECLEND_SetCursorPos_NAMEEND__System_UInt16_:function

method_System_Void_RETEND_SampleKernel_Kernel_DECLEND_SetCursorPos_NAMEEND__System_UInt16_:
push dword ebp
mov dword ebp, esp

mov al, 14
mov dx, 0x3D4
out dx, al

mov word ax, [ebp+8]
xchg al, ah
mov dx, 0x3D5
out dx, al

mov al, 15
mov dx, 0x3D4
out dx, al

mov word ax, [ebp+8]
mov dx, 0x3D5
out dx, al

pop dword ebp

ret