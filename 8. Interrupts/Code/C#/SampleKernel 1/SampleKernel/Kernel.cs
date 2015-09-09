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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleKernel
{
    public static class Kernel
    {
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = "ASM\\Kernel")]
        [Drivers.Compiler.Attributes.SequencePriority(Priority = long.MinValue)]
        public static void Boot()
        {
        }
        
        public static unsafe void InitPaging(uint* Page_Directory, uint* Page_Table1)
        {
            uint KERNEL_VIRTUAL_BASE = 0xC0000000;
            uint KERNEL_PAGE_TABLE = KERNEL_VIRTUAL_BASE >> 22;

            uint* Page_Table1_Physical = (uint*)((uint)Page_Table1 - KERNEL_VIRTUAL_BASE);
            uint* Page_Directory_Physical = (uint*)((uint)Page_Directory - KERNEL_VIRTUAL_BASE);

            uint PhysicalAddressAndFlags = 7;

            uint NoOfPageTables = 4; 			// 4 is arbitrary to cover 16MiB
            uint EntriesPerPageTable = 1024;	// There is always 1024 pages (4KiB/Page)
            uint StartPageTableEntryIndex = 0;
            uint SizeOfPageTables = NoOfPageTables * EntriesPerPageTable;
    
            uint index = 0;

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
	
	        PhysicalAddressAndFlags = (uint)&Page_Table1_Physical[0];
	        PhysicalAddressAndFlags = PhysicalAddressAndFlags | 7;	//0b111 - Setting Page Table flags (Present: ON, Read/Write: ON, User/Supervisor: ON)
	
	        uint EntriesOfPageDirectory = 1024;
	        index = 0; 	// Setting index to 0 to be used with Page Directory
	
	        while(index < EntriesOfPageDirectory)
	        {	
		        Page_Directory_Physical[index] = PhysicalAddressAndFlags;
		        index = index + 1;	// Move to next entry in Page Directory (4 bytes down)
		        PhysicalAddressAndFlags = PhysicalAddressAndFlags + 4096; 	// Update physical address to which to set the next Page Directory entry to (4 KiB down)
	        }
        }

        [Drivers.Compiler.Attributes.CallStaticConstructorsMethod]
        public static void CallStaticConstructors()
        {
        }
        
        [Drivers.Compiler.Attributes.MainMethod]
        public static unsafe void Main()
        {
            DisplayColour(0x06 /* Yellow */, 0x0F /* White */);	

            IDT_Entry_s* IDT_Ptr = GetIDT_ContentsPtr();
	        uint HandlerPtr = GetInterrupt17HandlerPtr();
	
	        IDT_Ptr[17].HandlerPtr_Low = (ushort)(HandlerPtr & 0x0000FFFF);
	        IDT_Ptr[17].HandlerPtr_High = (ushort)((HandlerPtr >> 16) & 0x0000FFFF);
	        IDT_Ptr[17].Selector = 0x8;
	        IDT_Ptr[17].Reserved = 0x0;
            IDT_Ptr[17].Config = 0x8E; // GateType = 0xE, StorageSegment = 0x0, DPL = 0x0, Present = 0x1
	
	        IDT_Pointer_s* IDT_Ptr_Ptr = GetIDT_PointerPtr();
	        IDT_Ptr_Ptr->TableSize = (ushort)((256 * sizeof(IDT_Entry_s)) - 1);
	        IDT_Ptr_Ptr->IDT_Ptr = IDT_Ptr;
	
            LoadIDT();

            DisplayColour(0x0A /* Light green */, 0x0F /* White */);
        }

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = @"ASM\GetIDT_ContentsPtr")]
        private static unsafe IDT_Entry_s* GetIDT_ContentsPtr()
        {
            return null;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = @"ASM\GetIDT_PointerPtr")]
        private static unsafe IDT_Pointer_s* GetIDT_PointerPtr()
        {
            return null;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = @"ASM\GetInterrupt17HandlerPtr")]
        private static unsafe uint GetInterrupt17HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = @"ASM\LoadIDT")]
        private static void LoadIDT()
        {
        }

        private static unsafe void DisplayColour(byte BackgroundColour, byte ForegroundColour)
        {
            byte Colour = (byte)(((BackgroundColour << 4) & 0xF0) | (ForegroundColour & 0x0F));
            ushort* DisplayMemoryPtr = (ushort*)0xB8000;
            uint DisplaySize = 2000; // = 80 * 25
            uint i = 0;
            while (i < DisplaySize)
            {
                DisplayMemoryPtr[i++] = (ushort)((((ushort)Colour) << 8) | 0x00);
            }

            Delay();
        }

        private static void Delay()
        {
            uint i = 0x03000000;
            while (i-- > 0)
            {
                ;
            }
        }
    }

    struct IDT_Entry_s
    {
	    public ushort HandlerPtr_Low;		// 2 bytes
        public ushort Selector;			// 2 bytes
        public byte Reserved;				// 1 byte
        public byte Config;                // 1 byte - various bit fields
        public ushort HandlerPtr_High;		// 2 bytes
    }

    unsafe struct IDT_Pointer_s
    {
        public ushort TableSize;
        public IDT_Entry_s* IDT_Ptr;
    }
}
