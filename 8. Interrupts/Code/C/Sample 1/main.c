/*
FlingOS™ Getting Started tutorials
Copyright (C) 2015  Edward Nutting

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/

extern unsigned int Page_Table1[1024 * 1024];	// # of entries/page table * total # of page tables 
												//		actual size = 4194304 bytes = 4MiB, represents 4GiB in physical memory (size of unsigned int = 4 bytes)
												//		ie. each 4 byte entry represent 4 KiB in physical memory
extern unsigned int Page_Directory[1024 * 1];  	// # of pages tables * # of directory (4096 bytes = 4 KiB)
extern unsigned int IDT_Contents;
extern unsigned int IDT_Pointer;


#define KERNEL_VIRTUAL_BASE 0xC0000000					// Constant declaring base of Higher-half kernel (from Kernel.asm)		 
#define KERNEL_PAGE_TABLE (KERNEL_VIRTUAL_BASE >> 22)	// Constant declaring Page Table index in virtual memory (from Kernel.asm)

// Each IDT entry is 8 bytes long
typedef struct IDT_Entry_s
{
	unsigned short HandlerPtr_Low;		// 2 bytes
	unsigned short Selector;			// 2 bytes
	unsigned char Reserved;				// 1 byte
	unsigned char GateType		: 4;	// 4 bits
	unsigned char StorageSegment: 1;	// 1 bit
	unsigned char DPL			: 2;	// 2 bits
	unsigned char Present		: 1;	// 1 bit
	unsigned short HandlerPtr_High;		// 2 bytes
} IDT_Entry_t;

typedef struct IDT_Pointer_s
{
	unsigned short TableSize;
	IDT_Entry_t* IDT_Ptr;
} IDT_Pointer_t;

void Delay()
{
	unsigned int i = 99999999;
	while(i-- > 0) {}
}

void DisplayColour(unsigned char BackgroundColour, unsigned char ForegroundColour)
{
	unsigned char Colour;
	Colour = ((BackgroundColour << 4) & 0xF0) | (ForegroundColour & 0x0F);
	unsigned short* DisplayMemoryPtr = (unsigned short*)0xB8000; 
	unsigned int DisplaySize = 2000; 	// 2000 = 80 x 25 Characters - VGA Text-mode Display size
	unsigned int i = 0;
	while(i < DisplaySize)
	{
		DisplayMemoryPtr[i++] = (((unsigned short)Colour) << 8) | 0x00;
	}
	Delay();
}

extern void Interrupt17Handler();

void main() 
{			
	// DisplayColour and Delay methods cannot be used until virtual addressing is set up i.e. until PG bit of CR0 is on.
	// Use inline assembly colour method for debugging.
	// This is because until virtual addressing is set up, code is only accessible through physical addresses but method calls 
	// are based on virtual addresses (because of the link script).
	
	// Inline assembly colour method for debugging
	__asm__
	(
		"mov EAX, 0x2F\n"		
		"mov EBX, 0xB8000\n" 	
		"mov ECX, 2000\n"		
		".ColourOutput2:\n"
		"movb [EBX], 0\n"
		"movb [EBX+1], AL\n"
		"add EBX, 2\n"
		"loop .ColourOutput2\n"
		"mov ECX, 0x0F000000\n"
		".DelayLoop1:\n"
		"loop .DelayLoop1\n"
	);
	
	unsigned int PhysicalAddressAndFlags = 7; 	// ; 0b111 - Setting Page Table flags (Present: ON, Read/Write: ON, User/Supervisor: ON)
	unsigned int NoOfPageTables = 4; 			// 4 is arbitrary to cover 16MiB
	unsigned int EntriesPerPageTable = 1024;	// There is always 1024 pages (4KiB/Page)
	unsigned int StartPageTableEntryIndex = 0;
	unsigned int SizeOfPageTables = NoOfPageTables * EntriesPerPageTable;
	
	unsigned char BackgroundColourCode = 0x1; 	// One digit hexadecimal value: 0-F (0 = Black, 1 = Blue, 2 = Green, 3 = Aqua, 4 = Red, 
												// 		5 = Purple, 6 = Yellow, 7 = White, 8 = Grey, 9 = Light Blue, A = Light Green,
												//		B = Light Aqua, C = Light Red, D = Light Purple, E = Light Yellow, F = Bright White)	
	unsigned char ForegroundColourCode = 0xF;	// Same as for background
		
	unsigned int index = 0;
	
	unsigned int* Page_Table1_Physical = (unsigned int*)((unsigned int)Page_Table1 - KERNEL_VIRTUAL_BASE);
	unsigned int* Page_Directory_Physical = (unsigned int*)((unsigned int)Page_Directory - KERNEL_VIRTUAL_BASE);
	
	//Setting up identity mapping
	while(index < (SizeOfPageTables + StartPageTableEntryIndex))
	{
		Page_Table1_Physical[index] = PhysicalAddressAndFlags;
		index = index + 1;
		PhysicalAddressAndFlags = PhysicalAddressAndFlags + 4096;
	}
	
	PhysicalAddressAndFlags = 7;
	index = (KERNEL_PAGE_TABLE * 1024);
	StartPageTableEntryIndex = (KERNEL_PAGE_TABLE * 1024);
	
	while(index < (SizeOfPageTables + StartPageTableEntryIndex))
	{
		Page_Table1_Physical[index] = PhysicalAddressAndFlags;
		index = index + 1;
		PhysicalAddressAndFlags = PhysicalAddressAndFlags + 4096;
	}
	
	PhysicalAddressAndFlags = (unsigned int)&Page_Table1_Physical[0];
	PhysicalAddressAndFlags = PhysicalAddressAndFlags | 7;	//0b111 - Setting Page Table flags (Present: ON, Read/Write: ON, User/Supervisor: ON)
	
	unsigned int EntriesOfPageDirectory = 1024;
	index = 0; 	// Setting index to 0 to be used with Page Directory
	
	while(index < EntriesOfPageDirectory)
	{	
		Page_Directory_Physical[index] = PhysicalAddressAndFlags;
		index = index + 1;	// Move to next entry in Page Directory (4 bytes down)
		PhysicalAddressAndFlags = PhysicalAddressAndFlags + 4096; 	// Update physical address to which to set the next Page Directory entry to (4 KiB down)
	}
	   
	// Set virtual addressing via control register CR3 
	// high 20 bits is Page directory Base Register i.e physical address of first page directory entry
	__asm__ 
	(
		"lea ECX, [Page_Directory - 0xC0000000]\n" // 0xC0000000 = KERNEL_VIRTUAL_BASE
		"mov CR3, ECX\n"
	);	
	
	// Switch on paging via control register CR0
	__asm__ 
	(
		"mov ECX, CR0\n"
		"or ECX, 0x80000000\n"	// Set PG bit in CR0 to enable paging.
		"mov CR0, ECX\n"
	);

		// At only this point we are in physical higher-half mode

		// Jump to higher-half
		__asm__
		(
			"lea ECX, [StartInHigherHalf]\n"
			"jmp ECX\n"
			"StartInHigherHalf:\n"
			"nop\n"
		);
		
	BackgroundColourCode = 0xB;
	DisplayColour(BackgroundColourCode, ForegroundColourCode);	// DisplayColour can also be used for debugging
	; // END - Set Virtual Memory
	
	// BEGIN - Interrupt Descriptor Table setup
	
	// mov dword EBX, IDT_Contents ; Loading pointer to start of the table
	IDT_Entry_t* IDT_Ptr = (IDT_Entry_t*)IDT_Contents;
	unsigned int HandlerPtr = (unsigned int)&Interrupt17Handler;
	
	IDT_Ptr[17].HandlerPtr_Low = (unsigned short)(HandlerPtr & 0x0000FFFF);
	IDT_Ptr[17].HandlerPtr_High = (unsigned short)((HandlerPtr >> 16) & 0x0000FFFF);
	IDT_Ptr[17].Selector = 0x8;
	IDT_Ptr[17].Reserved = 0x0;
	IDT_Ptr[17].GateType = 0xE;
	IDT_Ptr[17].StorageSegment = 0x0;
	IDT_Ptr[17].DPL = 0x0;
	IDT_Ptr[17].Present = 0x1;
	
	IDT_Pointer_t* IDT_Ptr_Ptr = (IDT_Pointer_t*)IDT_Pointer;
	IDT_Ptr_Ptr->TableSize = (unsigned short)((256 * sizeof(IDT_Entry_t)) - 1);
	IDT_Ptr_Ptr->IDT_Ptr = IDT_Ptr;
	
	__asm__
	(
		"lea EAX, [IDT_Pointer]\n"
		"lidt [EAX]\n"
		"int 17\n"
	);
	// END - Interrupt descriptor Table setup
	
	DisplayColour(0x4, 0xF);
}