ENTRY(_Kernel_Start)
OUTPUT_FORMAT(elf32-i386)

SECTIONS {
	. = 0x100000;

	.text : {
		*(.text);
	}
		
	. = ALIGN(0x1000);
	.bss : {
		*(.bss);
	}
}