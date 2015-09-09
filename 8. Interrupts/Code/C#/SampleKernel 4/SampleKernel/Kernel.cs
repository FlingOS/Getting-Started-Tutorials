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
    [Drivers.Compiler.Attributes.PluggedClass]
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

            for (int i = 0; i < 256; i++)
            {
                uint HandlerPtr = GetInterruptHandlerPtr(i);

                IDT_Ptr[i].HandlerPtr_Low = (ushort)(HandlerPtr & 0x0000FFFF);
                IDT_Ptr[i].HandlerPtr_High = (ushort)((HandlerPtr >> 16) & 0x0000FFFF);
                IDT_Ptr[i].Selector = 0x8;
                IDT_Ptr[i].Reserved = 0x0;
                IDT_Ptr[i].Config = 0x8E; // GateType = 0xE, StorageSegment = 0x0, DPL = 0x0, Present = 0x1
            }

            IDT_Pointer_s* IDT_Ptr_Ptr = GetIDT_PointerPtr();
            IDT_Ptr_Ptr->TableSize = (ushort)((256 * sizeof(IDT_Entry_s)) - 1);
            IDT_Ptr_Ptr->IDT_Ptr = IDT_Ptr;

            LoadIDT();

            PICRemap();

            PITConfigure();

            while (true)
            {
                DisplayColour(0x0A /* Light green */, 0x0F /* White */);

                for (ushort i = 48; i < 256; i++)
                {
                    IssueInterrupt((byte)i);
                }
            }
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
        
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = @"ASM\LoadIDT")]
        private static void LoadIDT()
        {
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = @"ASM\PICRemap")]
        private static void PICRemap()
        {
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = @"ASM\PITConfigure")]
        private static void PITConfigure()
        {
        }

        #region Get Interrupt Handler Pointers

        private static uint GetInterruptHandlerPtr(int i)
        {
            switch (i)
            {
                #region 0-9
                case 0: return GetInterrupt0HandlerPtr();
                case 1: return GetInterrupt1HandlerPtr();
                case 2: return GetInterrupt2HandlerPtr();
                case 3: return GetInterrupt3HandlerPtr();
                case 4: return GetInterrupt4HandlerPtr();
                case 5: return GetInterrupt5HandlerPtr();
                case 6: return GetInterrupt6HandlerPtr();
                case 7: return GetInterrupt7HandlerPtr();
                case 8: return GetInterrupt8HandlerPtr();
                case 9: return GetInterrupt9HandlerPtr();
                #endregion

                #region 10-19
                case 10: return GetInterrupt10HandlerPtr();
                case 11: return GetInterrupt11HandlerPtr();
                case 12: return GetInterrupt12HandlerPtr();
                case 13: return GetInterrupt13HandlerPtr();
                case 14: return GetInterrupt14HandlerPtr();
                case 15: return GetInterrupt15HandlerPtr();
                case 16: return GetInterrupt16HandlerPtr();
                case 17: return GetInterrupt17HandlerPtr();
                case 18: return GetInterrupt18HandlerPtr();
                case 19: return GetInterrupt19HandlerPtr();
                #endregion

                #region 20-29
                case 20: return GetInterrupt20HandlerPtr();
                case 21: return GetInterrupt21HandlerPtr();
                case 22: return GetInterrupt22HandlerPtr();
                case 23: return GetInterrupt23HandlerPtr();
                case 24: return GetInterrupt24HandlerPtr();
                case 25: return GetInterrupt25HandlerPtr();
                case 26: return GetInterrupt26HandlerPtr();
                case 27: return GetInterrupt27HandlerPtr();
                case 28: return GetInterrupt28HandlerPtr();
                case 29: return GetInterrupt29HandlerPtr();
                #endregion

                #region 30-39
                case 30: return GetInterrupt30HandlerPtr();
                case 31: return GetInterrupt31HandlerPtr();
                case 32: return GetInterrupt32HandlerPtr();
                case 33: return GetInterrupt33HandlerPtr();
                case 34: return GetInterrupt34HandlerPtr();
                case 35: return GetInterrupt35HandlerPtr();
                case 36: return GetInterrupt36HandlerPtr();
                case 37: return GetInterrupt37HandlerPtr();
                case 38: return GetInterrupt38HandlerPtr();
                case 39: return GetInterrupt39HandlerPtr();
                #endregion

                #region 40-49
                case 40: return GetInterrupt40HandlerPtr();
                case 41: return GetInterrupt41HandlerPtr();
                case 42: return GetInterrupt42HandlerPtr();
                case 43: return GetInterrupt43HandlerPtr();
                case 44: return GetInterrupt44HandlerPtr();
                case 45: return GetInterrupt45HandlerPtr();
                case 46: return GetInterrupt46HandlerPtr();
                case 47: return GetInterrupt47HandlerPtr();
                case 48: return GetInterrupt48HandlerPtr();
                case 49: return GetInterrupt49HandlerPtr();
                #endregion

                #region 50-59
                case 50: return GetInterrupt50HandlerPtr();
                case 51: return GetInterrupt51HandlerPtr();
                case 52: return GetInterrupt52HandlerPtr();
                case 53: return GetInterrupt53HandlerPtr();
                case 54: return GetInterrupt54HandlerPtr();
                case 55: return GetInterrupt55HandlerPtr();
                case 56: return GetInterrupt56HandlerPtr();
                case 57: return GetInterrupt57HandlerPtr();
                case 58: return GetInterrupt58HandlerPtr();
                case 59: return GetInterrupt59HandlerPtr();
                #endregion

                #region 60-69
                case 60: return GetInterrupt60HandlerPtr();
                case 61: return GetInterrupt61HandlerPtr();
                case 62: return GetInterrupt62HandlerPtr();
                case 63: return GetInterrupt63HandlerPtr();
                case 64: return GetInterrupt64HandlerPtr();
                case 65: return GetInterrupt65HandlerPtr();
                case 66: return GetInterrupt66HandlerPtr();
                case 67: return GetInterrupt67HandlerPtr();
                case 68: return GetInterrupt68HandlerPtr();
                case 69: return GetInterrupt69HandlerPtr();
                #endregion

                #region 70-79
                case 70: return GetInterrupt70HandlerPtr();
                case 71: return GetInterrupt71HandlerPtr();
                case 72: return GetInterrupt72HandlerPtr();
                case 73: return GetInterrupt73HandlerPtr();
                case 74: return GetInterrupt74HandlerPtr();
                case 75: return GetInterrupt75HandlerPtr();
                case 76: return GetInterrupt76HandlerPtr();
                case 77: return GetInterrupt77HandlerPtr();
                case 78: return GetInterrupt78HandlerPtr();
                case 79: return GetInterrupt79HandlerPtr();
                #endregion

                #region 80-89
                case 80: return GetInterrupt80HandlerPtr();
                case 81: return GetInterrupt81HandlerPtr();
                case 82: return GetInterrupt82HandlerPtr();
                case 83: return GetInterrupt83HandlerPtr();
                case 84: return GetInterrupt84HandlerPtr();
                case 85: return GetInterrupt85HandlerPtr();
                case 86: return GetInterrupt86HandlerPtr();
                case 87: return GetInterrupt87HandlerPtr();
                case 88: return GetInterrupt88HandlerPtr();
                case 89: return GetInterrupt89HandlerPtr();
                #endregion

                #region 90-99
                case 90: return GetInterrupt90HandlerPtr();
                case 91: return GetInterrupt91HandlerPtr();
                case 92: return GetInterrupt92HandlerPtr();
                case 93: return GetInterrupt93HandlerPtr();
                case 94: return GetInterrupt94HandlerPtr();
                case 95: return GetInterrupt95HandlerPtr();
                case 96: return GetInterrupt96HandlerPtr();
                case 97: return GetInterrupt97HandlerPtr();
                case 98: return GetInterrupt98HandlerPtr();
                case 99: return GetInterrupt99HandlerPtr();
                #endregion

                #region 100-109
                case 100: return GetInterrupt100HandlerPtr();
                case 101: return GetInterrupt101HandlerPtr();
                case 102: return GetInterrupt102HandlerPtr();
                case 103: return GetInterrupt103HandlerPtr();
                case 104: return GetInterrupt104HandlerPtr();
                case 105: return GetInterrupt105HandlerPtr();
                case 106: return GetInterrupt106HandlerPtr();
                case 107: return GetInterrupt107HandlerPtr();
                case 108: return GetInterrupt108HandlerPtr();
                case 109: return GetInterrupt109HandlerPtr();
                #endregion

                #region 110-119
                case 110: return GetInterrupt110HandlerPtr();
                case 111: return GetInterrupt111HandlerPtr();
                case 112: return GetInterrupt112HandlerPtr();
                case 113: return GetInterrupt113HandlerPtr();
                case 114: return GetInterrupt114HandlerPtr();
                case 115: return GetInterrupt115HandlerPtr();
                case 116: return GetInterrupt116HandlerPtr();
                case 117: return GetInterrupt117HandlerPtr();
                case 118: return GetInterrupt118HandlerPtr();
                case 119: return GetInterrupt119HandlerPtr();
                #endregion

                #region 120-129
                case 120: return GetInterrupt120HandlerPtr();
                case 121: return GetInterrupt121HandlerPtr();
                case 122: return GetInterrupt122HandlerPtr();
                case 123: return GetInterrupt123HandlerPtr();
                case 124: return GetInterrupt124HandlerPtr();
                case 125: return GetInterrupt125HandlerPtr();
                case 126: return GetInterrupt126HandlerPtr();
                case 127: return GetInterrupt127HandlerPtr();
                case 128: return GetInterrupt128HandlerPtr();
                case 129: return GetInterrupt129HandlerPtr();
                #endregion

                #region 130-139
                case 130: return GetInterrupt130HandlerPtr();
                case 131: return GetInterrupt131HandlerPtr();
                case 132: return GetInterrupt132HandlerPtr();
                case 133: return GetInterrupt133HandlerPtr();
                case 134: return GetInterrupt134HandlerPtr();
                case 135: return GetInterrupt135HandlerPtr();
                case 136: return GetInterrupt136HandlerPtr();
                case 137: return GetInterrupt137HandlerPtr();
                case 138: return GetInterrupt138HandlerPtr();
                case 139: return GetInterrupt139HandlerPtr();
                #endregion

                #region 140-149
                case 140: return GetInterrupt140HandlerPtr();
                case 141: return GetInterrupt141HandlerPtr();
                case 142: return GetInterrupt142HandlerPtr();
                case 143: return GetInterrupt143HandlerPtr();
                case 144: return GetInterrupt144HandlerPtr();
                case 145: return GetInterrupt145HandlerPtr();
                case 146: return GetInterrupt146HandlerPtr();
                case 147: return GetInterrupt147HandlerPtr();
                case 148: return GetInterrupt148HandlerPtr();
                case 149: return GetInterrupt149HandlerPtr();
                #endregion

                #region 150-159
                case 150: return GetInterrupt150HandlerPtr();
                case 151: return GetInterrupt151HandlerPtr();
                case 152: return GetInterrupt152HandlerPtr();
                case 153: return GetInterrupt153HandlerPtr();
                case 154: return GetInterrupt154HandlerPtr();
                case 155: return GetInterrupt155HandlerPtr();
                case 156: return GetInterrupt156HandlerPtr();
                case 157: return GetInterrupt157HandlerPtr();
                case 158: return GetInterrupt158HandlerPtr();
                case 159: return GetInterrupt159HandlerPtr();
                #endregion

                #region 160-169
                case 160: return GetInterrupt160HandlerPtr();
                case 161: return GetInterrupt161HandlerPtr();
                case 162: return GetInterrupt162HandlerPtr();
                case 163: return GetInterrupt163HandlerPtr();
                case 164: return GetInterrupt164HandlerPtr();
                case 165: return GetInterrupt165HandlerPtr();
                case 166: return GetInterrupt166HandlerPtr();
                case 167: return GetInterrupt167HandlerPtr();
                case 168: return GetInterrupt168HandlerPtr();
                case 169: return GetInterrupt169HandlerPtr();
                #endregion

                #region 170-179
                case 170: return GetInterrupt170HandlerPtr();
                case 171: return GetInterrupt171HandlerPtr();
                case 172: return GetInterrupt172HandlerPtr();
                case 173: return GetInterrupt173HandlerPtr();
                case 174: return GetInterrupt174HandlerPtr();
                case 175: return GetInterrupt175HandlerPtr();
                case 176: return GetInterrupt176HandlerPtr();
                case 177: return GetInterrupt177HandlerPtr();
                case 178: return GetInterrupt178HandlerPtr();
                case 179: return GetInterrupt179HandlerPtr();
                #endregion

                #region 180-189
                case 180: return GetInterrupt180HandlerPtr();
                case 181: return GetInterrupt181HandlerPtr();
                case 182: return GetInterrupt182HandlerPtr();
                case 183: return GetInterrupt183HandlerPtr();
                case 184: return GetInterrupt184HandlerPtr();
                case 185: return GetInterrupt185HandlerPtr();
                case 186: return GetInterrupt186HandlerPtr();
                case 187: return GetInterrupt187HandlerPtr();
                case 188: return GetInterrupt188HandlerPtr();
                case 189: return GetInterrupt189HandlerPtr();
                #endregion

                #region 190-199
                case 190: return GetInterrupt190HandlerPtr();
                case 191: return GetInterrupt191HandlerPtr();
                case 192: return GetInterrupt192HandlerPtr();
                case 193: return GetInterrupt193HandlerPtr();
                case 194: return GetInterrupt194HandlerPtr();
                case 195: return GetInterrupt195HandlerPtr();
                case 196: return GetInterrupt196HandlerPtr();
                case 197: return GetInterrupt197HandlerPtr();
                case 198: return GetInterrupt198HandlerPtr();
                case 199: return GetInterrupt199HandlerPtr();
                #endregion

                #region 200-209
                case 200: return GetInterrupt200HandlerPtr();
                case 201: return GetInterrupt201HandlerPtr();
                case 202: return GetInterrupt202HandlerPtr();
                case 203: return GetInterrupt203HandlerPtr();
                case 204: return GetInterrupt204HandlerPtr();
                case 205: return GetInterrupt205HandlerPtr();
                case 206: return GetInterrupt206HandlerPtr();
                case 207: return GetInterrupt207HandlerPtr();
                case 208: return GetInterrupt208HandlerPtr();
                case 209: return GetInterrupt209HandlerPtr();
                #endregion

                #region 210-219
                case 210: return GetInterrupt210HandlerPtr();
                case 211: return GetInterrupt211HandlerPtr();
                case 212: return GetInterrupt212HandlerPtr();
                case 213: return GetInterrupt213HandlerPtr();
                case 214: return GetInterrupt214HandlerPtr();
                case 215: return GetInterrupt215HandlerPtr();
                case 216: return GetInterrupt216HandlerPtr();
                case 217: return GetInterrupt217HandlerPtr();
                case 218: return GetInterrupt218HandlerPtr();
                case 219: return GetInterrupt219HandlerPtr();
                #endregion

                #region 220-229
                case 220: return GetInterrupt220HandlerPtr();
                case 221: return GetInterrupt221HandlerPtr();
                case 222: return GetInterrupt222HandlerPtr();
                case 223: return GetInterrupt223HandlerPtr();
                case 224: return GetInterrupt224HandlerPtr();
                case 225: return GetInterrupt225HandlerPtr();
                case 226: return GetInterrupt226HandlerPtr();
                case 227: return GetInterrupt227HandlerPtr();
                case 228: return GetInterrupt228HandlerPtr();
                case 229: return GetInterrupt229HandlerPtr();
                #endregion

                #region 230-239
                case 230: return GetInterrupt230HandlerPtr();
                case 231: return GetInterrupt231HandlerPtr();
                case 232: return GetInterrupt232HandlerPtr();
                case 233: return GetInterrupt233HandlerPtr();
                case 234: return GetInterrupt234HandlerPtr();
                case 235: return GetInterrupt235HandlerPtr();
                case 236: return GetInterrupt236HandlerPtr();
                case 237: return GetInterrupt237HandlerPtr();
                case 238: return GetInterrupt238HandlerPtr();
                case 239: return GetInterrupt239HandlerPtr();
                #endregion

                #region 240-249
                case 240: return GetInterrupt240HandlerPtr();
                case 241: return GetInterrupt241HandlerPtr();
                case 242: return GetInterrupt242HandlerPtr();
                case 243: return GetInterrupt243HandlerPtr();
                case 244: return GetInterrupt244HandlerPtr();
                case 245: return GetInterrupt245HandlerPtr();
                case 246: return GetInterrupt246HandlerPtr();
                case 247: return GetInterrupt247HandlerPtr();
                case 248: return GetInterrupt248HandlerPtr();
                case 249: return GetInterrupt249HandlerPtr();
                #endregion

                #region 250-259
                case 250: return GetInterrupt250HandlerPtr();
                case 251: return GetInterrupt251HandlerPtr();
                case 252: return GetInterrupt252HandlerPtr();
                case 253: return GetInterrupt253HandlerPtr();
                case 254: return GetInterrupt254HandlerPtr();
                case 255: return GetInterrupt255HandlerPtr();
                #endregion

                default: return 0;
            }
        }

        #region 0-9

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = @"ASM\GetInterruptHandlerPtr")]
        private static unsafe uint GetInterrupt0HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt1HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt2HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt3HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt4HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt5HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt6HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt7HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt8HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt9HandlerPtr()
        {
            return 0;
        }

        #endregion

        #region 10-19

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt10HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt11HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt12HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt13HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt14HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt15HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt16HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt17HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt18HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt19HandlerPtr()
        {
            return 0;
        }

        #endregion

        #region 20-29

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt20HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt21HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt22HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt23HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt24HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt25HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt26HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt27HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt28HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt29HandlerPtr()
        {
            return 0;
        }

        #endregion

        #region 30-39

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt30HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt31HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt32HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt33HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt34HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt35HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt36HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt37HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt38HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt39HandlerPtr()
        {
            return 0;
        }

        #endregion

        #region 40-49

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt40HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt41HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt42HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt43HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt44HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt45HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt46HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt47HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt48HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt49HandlerPtr()
        {
            return 0;
        }

        #endregion

        #region 50-59

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt50HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt51HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt52HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt53HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt54HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt55HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt56HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt57HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt58HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt59HandlerPtr()
        {
            return 0;
        }

        #endregion

        #region 60-69

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt60HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt61HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt62HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt63HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt64HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt65HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt66HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt67HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt68HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt69HandlerPtr()
        {
            return 0;
        }

        #endregion

        #region 70-79

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt70HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt71HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt72HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt73HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt74HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt75HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt76HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt77HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt78HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt79HandlerPtr()
        {
            return 0;
        }

        #endregion

        #region 80-89

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt80HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt81HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt82HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt83HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt84HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt85HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt86HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt87HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt88HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt89HandlerPtr()
        {
            return 0;
        }

        #endregion

        #region 90-99

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt90HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt91HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt92HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt93HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt94HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt95HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt96HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt97HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt98HandlerPtr()
        {
            return 0;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt99HandlerPtr()
        {
            return 0;
        }

        #endregion

        #region 100-109

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt100HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt101HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt102HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt103HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt104HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt105HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt106HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt107HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt108HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt109HandlerPtr()
        {
            return 10;
        }

        #endregion

        #region 110-119

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt110HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt111HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt112HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt113HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt114HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt115HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt116HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt117HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt118HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt119HandlerPtr()
        {
            return 10;
        }

        #endregion

        #region 120-129

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt120HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt121HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt122HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt123HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt124HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt125HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt126HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt127HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt128HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt129HandlerPtr()
        {
            return 10;
        }

        #endregion

        #region 130-139

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt130HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt131HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt132HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt133HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt134HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt135HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt136HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt137HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt138HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt139HandlerPtr()
        {
            return 10;
        }

        #endregion

        #region 140-149

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt140HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt141HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt142HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt143HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt144HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt145HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt146HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt147HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt148HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt149HandlerPtr()
        {
            return 10;
        }

        #endregion

        #region 150-159

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt150HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt151HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt152HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt153HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt154HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt155HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt156HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt157HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt158HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt159HandlerPtr()
        {
            return 10;
        }

        #endregion

        #region 160-169

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt160HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt161HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt162HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt163HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt164HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt165HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt166HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt167HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt168HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt169HandlerPtr()
        {
            return 10;
        }

        #endregion

        #region 170-179

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt170HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt171HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt172HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt173HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt174HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt175HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt176HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt177HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt178HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt179HandlerPtr()
        {
            return 10;
        }

        #endregion

        #region 180-189

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt180HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt181HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt182HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt183HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt184HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt185HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt186HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt187HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt188HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt189HandlerPtr()
        {
            return 10;
        }

        #endregion

        #region 190-199

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt190HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt191HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt192HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt193HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt194HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt195HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt196HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt197HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt198HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt199HandlerPtr()
        {
            return 10;
        }

        #endregion

        #region 200-209

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt200HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt201HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt202HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt203HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt204HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt205HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt206HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt207HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt208HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt209HandlerPtr()
        {
            return 10;
        }

        #endregion

        #region 210-219

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt210HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt211HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt212HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt213HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt214HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt215HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt216HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt217HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt218HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt219HandlerPtr()
        {
            return 10;
        }

        #endregion

        #region 220-229

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt220HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt221HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt222HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt223HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt224HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt225HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt226HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt227HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt228HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt229HandlerPtr()
        {
            return 10;
        }

        #endregion

        #region 230-239

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt230HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt231HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt232HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt233HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt234HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt235HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt236HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt237HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt238HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt239HandlerPtr()
        {
            return 10;
        }

        #endregion

        #region 240-249

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt240HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt241HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt242HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt243HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt244HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt245HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt246HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt247HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt248HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt249HandlerPtr()
        {
            return 10;
        }

        #endregion

        #region 250-259

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt250HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt251HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt252HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt253HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt254HandlerPtr()
        {
            return 10;
        }
        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = null)]
        private static unsafe uint GetInterrupt255HandlerPtr()
        {
            return 10;
        }
        
        #endregion

        #endregion

        [Drivers.Compiler.Attributes.PluggedMethod(ASMFilePath = @"ASM\IssueInterrupt")]
        private static void IssueInterrupt(byte x)
        {
        }

        private static unsafe void DisplayColourArea(byte BackgroundColour, byte ForegroundColour, uint start, uint length)
        {
            byte Colour = (byte)(((BackgroundColour << 4) & 0xF0) | (ForegroundColour & 0x0F));
            ushort* DisplayMemoryPtr = (ushort*)0xB8000;
            uint DisplaySize = 2000; // = 80 * 25
            uint i = start;
            while (i < DisplaySize && i < start + length)
            {
                DisplayMemoryPtr[i++] = (ushort)((((ushort)Colour) << 8) | 0x00);
            }

            Delay();
        }
        private static void DisplayColour(byte BackgroundColour, byte ForegroundColour)
        {
	        DisplayColourArea(BackgroundColour, ForegroundColour, 0, 2000);
        }

        private static void Delay()
        {
            uint i = 0x00040000;
            while (i-- > 0)
            {
                ;
            }
        }

        public static void CommonInterruptHandler(uint handlerNum)
        {
            DisplayColourArea(0xF, 0xF, handlerNum, 1);
            Delay();
            DisplayColourArea(0x0, 0xF, handlerNum, 1);
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
