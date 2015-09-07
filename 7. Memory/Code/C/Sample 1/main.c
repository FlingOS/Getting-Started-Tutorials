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
extern unsigned int Page_Directory[1024 * 1];  // # of pages tables * # of directory (4096 bytes = 4 KiB)

void Delay()
{
	unsigned int i = 999999999;
	while(i-- > 0) {}
}

// ; BEGIN - Set Screen Colour
void DisplayColour(unsigned char BackgroundColour, unsigned char ForegroundColour)
{
	// mov dword EAX, 0x5F		; Colour: 0x5- = Purple background, 0x-F = White foreground
	unsigned char Colour;
	Colour = ((BackgroundColour << 4) & 0xF0) | (ForegroundColour & 0x0F);
	
	// mov dword EBX, 0xB8000 	; Display Memory address
	unsigned short* DisplayMemoryPtr = (unsigned short*)753664; 	// = 0xB8000
	
	// mov dword ECX, 2000		; 80 x 25 Characters - VGA Text-mode Display size
	unsigned int DisplaySize = 2000;
	
	unsigned int i = 0;
	// .ColourOutput4:
	while(i < DisplaySize)
	{
		// mov byte [EBX], 0
		// mov byte [EBX+1], AL
		// add EBX, 2
		DisplayMemoryPtr[i++] = (((unsigned short)Colour) << 8) | 0x00;
	}
	// loop .ColourOutput4
	Delay();
}
//; END - Set Screen Colour

void main() 
{
	/* ; BEGIN - Set Virtual Memory
	   ; 1. Map virtual memory for physical address execution
	   lea EAX, [Page_Table1] */		//	We can just refer to Page_Table1 
	
	// mov EBX, 7 			; 0b111 - Setting Page Table flags (Present: ON, Read/Write: ON, User/Supervisor: ON)
	unsigned int PhysicalAddressAndFlags = 7;
	
	// mov ECX, (4 * 1024)	; # of Page Tables * # of Entries per Page Table
	unsigned int NoOfPageTables = 4; 			// 4 is arbitrary to cover 16MiB
	unsigned int EntriesPerPageTable = 1024;	// There is always 1024 pages (4KiB/Page)
	unsigned int SizeOfPageTables = NoOfPageTables * EntriesPerPageTable;
	
	unsigned char BackgroundColourCode = 0x1; 	// One digit hexadecimal value: 0-F (0 = Black, 1 = Blue, 2 = Green, 3 = Aqua, 4 = Red, 
												// 		5 = Purple, 6 = Yellow,
												//		7 = White, 8 = Grey, 9 = Light Blue, A = Light Green, B = Light Aqua, C = Light Red, 
												// 		D = Light Purple, E = Light Yellow, F = Bright White)
	unsigned char ForegroundColourCode = 0xF;
	
	// Call DisplayColour function
		
	unsigned int index = 0;
	
	// .Loop1:
	while(index < SizeOfPageTables)
	{
		// mov [EAX], EBX
		Page_Table1[index] = PhysicalAddressAndFlags;
		
		// add EAX, 4		; Move to next entry in Page Table (4 bytes down)	 
		// add EBX, 4096	; Update physical address to which to set the next Page Table entry to (4 KiB down)
		index = index + 1;
		PhysicalAddressAndFlags = PhysicalAddressAndFlags + 4096;
	}
	// loop .Loop1
	
	/* 
	   lea EDX, [Page_Directory] */	//	We can just refer to Page_Directory 
	
	// lea EBX, [Page_Table1]		//	We can just refer to Page_Table1 
	PhysicalAddressAndFlags = (unsigned int)&Page_Table1[0];
	// or EBX, 7		; 0b111 - Setting Page Directory flags (Present: ON, Read/Write: ON, User/Supervisor: ON)
	PhysicalAddressAndFlags = PhysicalAddressAndFlags | 7;
	
	// mov ECX, 1024	; # of Entries in the Page Directory
	unsigned int EntriesOfPageDirectory = 1024;
	
	index = 0; 	// Setting index to 0 to be used with Page Directory
	
	// .Loop3:
	while(index < EntriesOfPageDirectory)
	{	
		// mov [EDX], EBX
		Page_Directory[index] = PhysicalAddressAndFlags;
		
		// add EDX, 4		; Move to next entry in Page Directory (4 bytes down)
		// add EBX, 4096	; Update physical address to which to set the next Page Directory entry to (4 KiB down)
		index = index + 1;
		PhysicalAddressAndFlags = PhysicalAddressAndFlags + 4096;
	}
	// loop .Loop3
	
	/* ; 2. Set page directory
	   ; 		This requires us to load the physical address of the page directory
	   ; 		then move it into CR3

	   lea ECX, [Page_Directory]
	   mov CR3, ECX */
	   
	   __asm__ 
	   (
			"lea ECX, [Page_Directory]\n"
			"mov CR3, ECX\n"
	   );	
	
	DisplayColour(BackgroundColourCode, ForegroundColourCode);	// DisplayColour can also be used for debugging
	
	; /* 3. Switch on paging
	; 		This requires us to enable paging by setting CR0

	   mov ECX, CR0
	   or ECX, 0x80000000   ; Set PG bit in CR0 to enable paging.
	   mov CR0, ECX*/
	   
	   __asm__ 
	   (
			"mov ECX, CR0\n"
			"or ECX, 0x80000000\n"
			"mov CR0, ECX\n"
	   );
	
	BackgroundColourCode = 0x2;
	DisplayColour(BackgroundColourCode, ForegroundColourCode);	// DisplayColour can also be used for debugging
	
	; // END - Set Virtual Memory 
}