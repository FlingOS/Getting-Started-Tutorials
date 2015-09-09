GLOBAL method_System_Void_RETEND_SampleKernel_Kernel_DECLEND_IssueInterrupt_NAMEEND__System_Byte_:function

method_System_Void_RETEND_SampleKernel_Kernel_DECLEND_IssueInterrupt_NAMEEND__System_Byte_:
push dword ebp
mov dword ebp, esp

mov eax, [ebp+8]
%macro InterruptTestMacro 1
	cmp eax, %1
	jne .Next%1
	int %1
	.Next%1:
%endmacro
%assign interrupttestnum 0
%rep 255
	InterruptTestMacro interrupttestnum
	%assign interrupttestnum interrupttestnum+1
%endrep

pop dword ebp

ret