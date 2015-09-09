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

#define DISPLAY_SIZE 2000 // 2000 = 80 x 25 Characters - VGA Text-mode Display size

#define outb(PORT, VALUE) \
__asm__\
(\
	"mov AL, " #VALUE "\n"\
	"outb " #PORT ", AL\n"\
);

#define STI \
__asm__\
( \
	"sti\n"\
	"nop\n"\
);

#define CLI \
__asm__\
( \
	"cli\n"\
	"nop\n"\
);

typedef struct IDT_Entry_s
{
	unsigned short HandlerPtr_Low;
	unsigned short Selector;
	unsigned char Reserved;
	unsigned char GateType		: 4;
	unsigned char StorageSegment: 1;
	unsigned char DPL			: 2;
	unsigned char Present		: 1;
	unsigned short HandlerPtr_High;
} IDT_Entry_t;

typedef struct IDT_Pointer_s
{
	unsigned short TableSize;
	IDT_Entry_t* IDT_Ptr;
} IDT_Pointer_t;

#define COMMON_INTERRUPT_HANDLER_EXTERN(i) extern void CommonInterruptHandler##i();

#define COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(i) \
{ \
	unsigned int HandlerPtr = (unsigned int)&CommonInterruptHandler##i;\
\
	IDT_Ptr[i].HandlerPtr_Low = (unsigned short)(HandlerPtr & 0x0000FFFF);\
	IDT_Ptr[i].HandlerPtr_High = (unsigned short)((HandlerPtr >> 16) & 0x0000FFFF);\
	IDT_Ptr[i].Selector = 0x8;\
	IDT_Ptr[i].Reserved = 0x0;\
	IDT_Ptr[i].GateType = 0xE;\
	IDT_Ptr[i].StorageSegment = 0x0;\
	IDT_Ptr[i].DPL = 0x0;\
	IDT_Ptr[i].Present = 0x1;\
}

COMMON_INTERRUPT_HANDLER_EXTERN(0)
COMMON_INTERRUPT_HANDLER_EXTERN(1)
COMMON_INTERRUPT_HANDLER_EXTERN(2)
COMMON_INTERRUPT_HANDLER_EXTERN(3)
COMMON_INTERRUPT_HANDLER_EXTERN(4)
COMMON_INTERRUPT_HANDLER_EXTERN(5)
COMMON_INTERRUPT_HANDLER_EXTERN(6)
COMMON_INTERRUPT_HANDLER_EXTERN(7)
COMMON_INTERRUPT_HANDLER_EXTERN(8)
COMMON_INTERRUPT_HANDLER_EXTERN(9)
COMMON_INTERRUPT_HANDLER_EXTERN(10)
COMMON_INTERRUPT_HANDLER_EXTERN(11)
COMMON_INTERRUPT_HANDLER_EXTERN(12)
COMMON_INTERRUPT_HANDLER_EXTERN(13)
COMMON_INTERRUPT_HANDLER_EXTERN(14)
COMMON_INTERRUPT_HANDLER_EXTERN(15)
COMMON_INTERRUPT_HANDLER_EXTERN(16)
COMMON_INTERRUPT_HANDLER_EXTERN(17)
COMMON_INTERRUPT_HANDLER_EXTERN(18)
COMMON_INTERRUPT_HANDLER_EXTERN(19)
COMMON_INTERRUPT_HANDLER_EXTERN(20)
COMMON_INTERRUPT_HANDLER_EXTERN(21)
COMMON_INTERRUPT_HANDLER_EXTERN(22)
COMMON_INTERRUPT_HANDLER_EXTERN(23)
COMMON_INTERRUPT_HANDLER_EXTERN(24)
COMMON_INTERRUPT_HANDLER_EXTERN(25)
COMMON_INTERRUPT_HANDLER_EXTERN(26)
COMMON_INTERRUPT_HANDLER_EXTERN(27)
COMMON_INTERRUPT_HANDLER_EXTERN(28)
COMMON_INTERRUPT_HANDLER_EXTERN(29)
COMMON_INTERRUPT_HANDLER_EXTERN(30)
COMMON_INTERRUPT_HANDLER_EXTERN(31)
COMMON_INTERRUPT_HANDLER_EXTERN(32)
COMMON_INTERRUPT_HANDLER_EXTERN(33)
COMMON_INTERRUPT_HANDLER_EXTERN(34)
COMMON_INTERRUPT_HANDLER_EXTERN(35)
COMMON_INTERRUPT_HANDLER_EXTERN(36)
COMMON_INTERRUPT_HANDLER_EXTERN(37)
COMMON_INTERRUPT_HANDLER_EXTERN(38)
COMMON_INTERRUPT_HANDLER_EXTERN(39)
COMMON_INTERRUPT_HANDLER_EXTERN(40)
COMMON_INTERRUPT_HANDLER_EXTERN(41)
COMMON_INTERRUPT_HANDLER_EXTERN(42)
COMMON_INTERRUPT_HANDLER_EXTERN(43)
COMMON_INTERRUPT_HANDLER_EXTERN(44)
COMMON_INTERRUPT_HANDLER_EXTERN(45)
COMMON_INTERRUPT_HANDLER_EXTERN(46)
COMMON_INTERRUPT_HANDLER_EXTERN(47)
COMMON_INTERRUPT_HANDLER_EXTERN(48)
COMMON_INTERRUPT_HANDLER_EXTERN(49)
COMMON_INTERRUPT_HANDLER_EXTERN(50)
COMMON_INTERRUPT_HANDLER_EXTERN(51)
COMMON_INTERRUPT_HANDLER_EXTERN(52)
COMMON_INTERRUPT_HANDLER_EXTERN(53)
COMMON_INTERRUPT_HANDLER_EXTERN(54)
COMMON_INTERRUPT_HANDLER_EXTERN(55)
COMMON_INTERRUPT_HANDLER_EXTERN(56)
COMMON_INTERRUPT_HANDLER_EXTERN(57)
COMMON_INTERRUPT_HANDLER_EXTERN(58)
COMMON_INTERRUPT_HANDLER_EXTERN(59)
COMMON_INTERRUPT_HANDLER_EXTERN(60)
COMMON_INTERRUPT_HANDLER_EXTERN(61)
COMMON_INTERRUPT_HANDLER_EXTERN(62)
COMMON_INTERRUPT_HANDLER_EXTERN(63)
COMMON_INTERRUPT_HANDLER_EXTERN(64)
COMMON_INTERRUPT_HANDLER_EXTERN(65)
COMMON_INTERRUPT_HANDLER_EXTERN(66)
COMMON_INTERRUPT_HANDLER_EXTERN(67)
COMMON_INTERRUPT_HANDLER_EXTERN(68)
COMMON_INTERRUPT_HANDLER_EXTERN(69)
COMMON_INTERRUPT_HANDLER_EXTERN(70)
COMMON_INTERRUPT_HANDLER_EXTERN(71)
COMMON_INTERRUPT_HANDLER_EXTERN(72)
COMMON_INTERRUPT_HANDLER_EXTERN(73)
COMMON_INTERRUPT_HANDLER_EXTERN(74)
COMMON_INTERRUPT_HANDLER_EXTERN(75)
COMMON_INTERRUPT_HANDLER_EXTERN(76)
COMMON_INTERRUPT_HANDLER_EXTERN(77)
COMMON_INTERRUPT_HANDLER_EXTERN(78)
COMMON_INTERRUPT_HANDLER_EXTERN(79)
COMMON_INTERRUPT_HANDLER_EXTERN(80)
COMMON_INTERRUPT_HANDLER_EXTERN(81)
COMMON_INTERRUPT_HANDLER_EXTERN(82)
COMMON_INTERRUPT_HANDLER_EXTERN(83)
COMMON_INTERRUPT_HANDLER_EXTERN(84)
COMMON_INTERRUPT_HANDLER_EXTERN(85)
COMMON_INTERRUPT_HANDLER_EXTERN(86)
COMMON_INTERRUPT_HANDLER_EXTERN(87)
COMMON_INTERRUPT_HANDLER_EXTERN(88)
COMMON_INTERRUPT_HANDLER_EXTERN(89)
COMMON_INTERRUPT_HANDLER_EXTERN(90)
COMMON_INTERRUPT_HANDLER_EXTERN(91)
COMMON_INTERRUPT_HANDLER_EXTERN(92)
COMMON_INTERRUPT_HANDLER_EXTERN(93)
COMMON_INTERRUPT_HANDLER_EXTERN(94)
COMMON_INTERRUPT_HANDLER_EXTERN(95)
COMMON_INTERRUPT_HANDLER_EXTERN(96)
COMMON_INTERRUPT_HANDLER_EXTERN(97)
COMMON_INTERRUPT_HANDLER_EXTERN(98)
COMMON_INTERRUPT_HANDLER_EXTERN(99)
COMMON_INTERRUPT_HANDLER_EXTERN(100)
COMMON_INTERRUPT_HANDLER_EXTERN(101)
COMMON_INTERRUPT_HANDLER_EXTERN(102)
COMMON_INTERRUPT_HANDLER_EXTERN(103)
COMMON_INTERRUPT_HANDLER_EXTERN(104)
COMMON_INTERRUPT_HANDLER_EXTERN(105)
COMMON_INTERRUPT_HANDLER_EXTERN(106)
COMMON_INTERRUPT_HANDLER_EXTERN(107)
COMMON_INTERRUPT_HANDLER_EXTERN(108)
COMMON_INTERRUPT_HANDLER_EXTERN(109)
COMMON_INTERRUPT_HANDLER_EXTERN(110)
COMMON_INTERRUPT_HANDLER_EXTERN(111)
COMMON_INTERRUPT_HANDLER_EXTERN(112)
COMMON_INTERRUPT_HANDLER_EXTERN(113)
COMMON_INTERRUPT_HANDLER_EXTERN(114)
COMMON_INTERRUPT_HANDLER_EXTERN(115)
COMMON_INTERRUPT_HANDLER_EXTERN(116)
COMMON_INTERRUPT_HANDLER_EXTERN(117)
COMMON_INTERRUPT_HANDLER_EXTERN(118)
COMMON_INTERRUPT_HANDLER_EXTERN(119)
COMMON_INTERRUPT_HANDLER_EXTERN(120)
COMMON_INTERRUPT_HANDLER_EXTERN(121)
COMMON_INTERRUPT_HANDLER_EXTERN(122)
COMMON_INTERRUPT_HANDLER_EXTERN(123)
COMMON_INTERRUPT_HANDLER_EXTERN(124)
COMMON_INTERRUPT_HANDLER_EXTERN(125)
COMMON_INTERRUPT_HANDLER_EXTERN(126)
COMMON_INTERRUPT_HANDLER_EXTERN(127)
COMMON_INTERRUPT_HANDLER_EXTERN(128)
COMMON_INTERRUPT_HANDLER_EXTERN(129)
COMMON_INTERRUPT_HANDLER_EXTERN(130)
COMMON_INTERRUPT_HANDLER_EXTERN(131)
COMMON_INTERRUPT_HANDLER_EXTERN(132)
COMMON_INTERRUPT_HANDLER_EXTERN(133)
COMMON_INTERRUPT_HANDLER_EXTERN(134)
COMMON_INTERRUPT_HANDLER_EXTERN(135)
COMMON_INTERRUPT_HANDLER_EXTERN(136)
COMMON_INTERRUPT_HANDLER_EXTERN(137)
COMMON_INTERRUPT_HANDLER_EXTERN(138)
COMMON_INTERRUPT_HANDLER_EXTERN(139)
COMMON_INTERRUPT_HANDLER_EXTERN(140)
COMMON_INTERRUPT_HANDLER_EXTERN(141)
COMMON_INTERRUPT_HANDLER_EXTERN(142)
COMMON_INTERRUPT_HANDLER_EXTERN(143)
COMMON_INTERRUPT_HANDLER_EXTERN(144)
COMMON_INTERRUPT_HANDLER_EXTERN(145)
COMMON_INTERRUPT_HANDLER_EXTERN(146)
COMMON_INTERRUPT_HANDLER_EXTERN(147)
COMMON_INTERRUPT_HANDLER_EXTERN(148)
COMMON_INTERRUPT_HANDLER_EXTERN(149)
COMMON_INTERRUPT_HANDLER_EXTERN(150)
COMMON_INTERRUPT_HANDLER_EXTERN(151)
COMMON_INTERRUPT_HANDLER_EXTERN(152)
COMMON_INTERRUPT_HANDLER_EXTERN(153)
COMMON_INTERRUPT_HANDLER_EXTERN(154)
COMMON_INTERRUPT_HANDLER_EXTERN(155)
COMMON_INTERRUPT_HANDLER_EXTERN(156)
COMMON_INTERRUPT_HANDLER_EXTERN(157)
COMMON_INTERRUPT_HANDLER_EXTERN(158)
COMMON_INTERRUPT_HANDLER_EXTERN(159)
COMMON_INTERRUPT_HANDLER_EXTERN(160)
COMMON_INTERRUPT_HANDLER_EXTERN(161)
COMMON_INTERRUPT_HANDLER_EXTERN(162)
COMMON_INTERRUPT_HANDLER_EXTERN(163)
COMMON_INTERRUPT_HANDLER_EXTERN(164)
COMMON_INTERRUPT_HANDLER_EXTERN(165)
COMMON_INTERRUPT_HANDLER_EXTERN(166)
COMMON_INTERRUPT_HANDLER_EXTERN(167)
COMMON_INTERRUPT_HANDLER_EXTERN(168)
COMMON_INTERRUPT_HANDLER_EXTERN(169)
COMMON_INTERRUPT_HANDLER_EXTERN(170)
COMMON_INTERRUPT_HANDLER_EXTERN(171)
COMMON_INTERRUPT_HANDLER_EXTERN(172)
COMMON_INTERRUPT_HANDLER_EXTERN(173)
COMMON_INTERRUPT_HANDLER_EXTERN(174)
COMMON_INTERRUPT_HANDLER_EXTERN(175)
COMMON_INTERRUPT_HANDLER_EXTERN(176)
COMMON_INTERRUPT_HANDLER_EXTERN(177)
COMMON_INTERRUPT_HANDLER_EXTERN(178)
COMMON_INTERRUPT_HANDLER_EXTERN(179)
COMMON_INTERRUPT_HANDLER_EXTERN(180)
COMMON_INTERRUPT_HANDLER_EXTERN(181)
COMMON_INTERRUPT_HANDLER_EXTERN(182)
COMMON_INTERRUPT_HANDLER_EXTERN(183)
COMMON_INTERRUPT_HANDLER_EXTERN(184)
COMMON_INTERRUPT_HANDLER_EXTERN(185)
COMMON_INTERRUPT_HANDLER_EXTERN(186)
COMMON_INTERRUPT_HANDLER_EXTERN(187)
COMMON_INTERRUPT_HANDLER_EXTERN(188)
COMMON_INTERRUPT_HANDLER_EXTERN(189)
COMMON_INTERRUPT_HANDLER_EXTERN(190)
COMMON_INTERRUPT_HANDLER_EXTERN(191)
COMMON_INTERRUPT_HANDLER_EXTERN(192)
COMMON_INTERRUPT_HANDLER_EXTERN(193)
COMMON_INTERRUPT_HANDLER_EXTERN(194)
COMMON_INTERRUPT_HANDLER_EXTERN(195)
COMMON_INTERRUPT_HANDLER_EXTERN(196)
COMMON_INTERRUPT_HANDLER_EXTERN(197)
COMMON_INTERRUPT_HANDLER_EXTERN(198)
COMMON_INTERRUPT_HANDLER_EXTERN(199)
COMMON_INTERRUPT_HANDLER_EXTERN(200)
COMMON_INTERRUPT_HANDLER_EXTERN(201)
COMMON_INTERRUPT_HANDLER_EXTERN(202)
COMMON_INTERRUPT_HANDLER_EXTERN(203)
COMMON_INTERRUPT_HANDLER_EXTERN(204)
COMMON_INTERRUPT_HANDLER_EXTERN(205)
COMMON_INTERRUPT_HANDLER_EXTERN(206)
COMMON_INTERRUPT_HANDLER_EXTERN(207)
COMMON_INTERRUPT_HANDLER_EXTERN(208)
COMMON_INTERRUPT_HANDLER_EXTERN(209)
COMMON_INTERRUPT_HANDLER_EXTERN(210)
COMMON_INTERRUPT_HANDLER_EXTERN(211)
COMMON_INTERRUPT_HANDLER_EXTERN(212)
COMMON_INTERRUPT_HANDLER_EXTERN(213)
COMMON_INTERRUPT_HANDLER_EXTERN(214)
COMMON_INTERRUPT_HANDLER_EXTERN(215)
COMMON_INTERRUPT_HANDLER_EXTERN(216)
COMMON_INTERRUPT_HANDLER_EXTERN(217)
COMMON_INTERRUPT_HANDLER_EXTERN(218)
COMMON_INTERRUPT_HANDLER_EXTERN(219)
COMMON_INTERRUPT_HANDLER_EXTERN(220)
COMMON_INTERRUPT_HANDLER_EXTERN(221)
COMMON_INTERRUPT_HANDLER_EXTERN(222)
COMMON_INTERRUPT_HANDLER_EXTERN(223)
COMMON_INTERRUPT_HANDLER_EXTERN(224)
COMMON_INTERRUPT_HANDLER_EXTERN(225)
COMMON_INTERRUPT_HANDLER_EXTERN(226)
COMMON_INTERRUPT_HANDLER_EXTERN(227)
COMMON_INTERRUPT_HANDLER_EXTERN(228)
COMMON_INTERRUPT_HANDLER_EXTERN(229)
COMMON_INTERRUPT_HANDLER_EXTERN(230)
COMMON_INTERRUPT_HANDLER_EXTERN(231)
COMMON_INTERRUPT_HANDLER_EXTERN(232)
COMMON_INTERRUPT_HANDLER_EXTERN(233)
COMMON_INTERRUPT_HANDLER_EXTERN(234)
COMMON_INTERRUPT_HANDLER_EXTERN(235)
COMMON_INTERRUPT_HANDLER_EXTERN(236)
COMMON_INTERRUPT_HANDLER_EXTERN(237)
COMMON_INTERRUPT_HANDLER_EXTERN(238)
COMMON_INTERRUPT_HANDLER_EXTERN(239)
COMMON_INTERRUPT_HANDLER_EXTERN(240)
COMMON_INTERRUPT_HANDLER_EXTERN(241)
COMMON_INTERRUPT_HANDLER_EXTERN(242)
COMMON_INTERRUPT_HANDLER_EXTERN(243)
COMMON_INTERRUPT_HANDLER_EXTERN(244)
COMMON_INTERRUPT_HANDLER_EXTERN(245)
COMMON_INTERRUPT_HANDLER_EXTERN(246)
COMMON_INTERRUPT_HANDLER_EXTERN(247)
COMMON_INTERRUPT_HANDLER_EXTERN(248)
COMMON_INTERRUPT_HANDLER_EXTERN(249)
COMMON_INTERRUPT_HANDLER_EXTERN(250)
COMMON_INTERRUPT_HANDLER_EXTERN(251)
COMMON_INTERRUPT_HANDLER_EXTERN(252)
COMMON_INTERRUPT_HANDLER_EXTERN(253)
COMMON_INTERRUPT_HANDLER_EXTERN(254)
COMMON_INTERRUPT_HANDLER_EXTERN(255)

void Delay()
{
	unsigned int i = 0x900000;
	while(i-- > 0) {}
}

void DisplayColourArea(unsigned char BackgroundColour, unsigned char ForegroundColour, unsigned int start, unsigned int length)
{
	unsigned char Colour;
	Colour = ((BackgroundColour << 4) & 0xF0) | (ForegroundColour & 0x0F);
	unsigned short* DisplayMemoryPtr = (unsigned short*)0xB8000; 
	unsigned int i = start;
	while(i < DISPLAY_SIZE && i < start + length)
	{
		DisplayMemoryPtr[i++] = (((unsigned short)Colour) << 8) | 0x00;
	}
}
void DisplayColour(unsigned char BackgroundColour, unsigned char ForegroundColour)
{
	DisplayColourArea(BackgroundColour, ForegroundColour, 0, DISPLAY_SIZE);
	Delay();
}

void CommonInterruptHandler(int handlerNum) {
	DisplayColourArea(0xF, 0xF, handlerNum, 1);
	Delay();
	DisplayColourArea(0x0, 0xF, handlerNum, 1);
	
	if(handlerNum >= 32 && handlerNum < 48)
	{		
		DisplayColourArea(0x4, 0xF, handlerNum, 1);
		
		if(handlerNum >= 40)
		{
			outb(0xA0, 0x20)
		}
		outb(0x20, 0x20)
	
		DisplayColourArea(0x5, 0xF, handlerNum, 1);
	}
}

void IssueInterrupt(unsigned char num) 
{
	switch(num)
	{
		case 0: __asm__ ("int 0\n" ); break;
		case 1: __asm__ ("int 1\n" ); break;
		case 2: __asm__ ("int 2\n" ); break;
		case 3: __asm__ ("int 3\n" ); break;
		case 4: __asm__ ("int 4\n" ); break;
		case 5: __asm__ ("int 5\n" ); break;
		case 6: __asm__ ("int 6\n" ); break;
		case 7: __asm__ ("int 7\n" ); break;
		case 8: __asm__ ("int 8\n" ); break;
		case 9: __asm__ ("int 9\n" ); break;
		case 10: __asm__ ("int 10\n" ); break;
		case 11: __asm__ ("int 11\n" ); break;
		case 12: __asm__ ("int 12\n" ); break;
		case 13: __asm__ ("int 13\n" ); break;
		case 14: __asm__ ("int 14\n" ); break;
		case 15: __asm__ ("int 15\n" ); break;
		case 16: __asm__ ("int 16\n" ); break;
		case 17: __asm__ ("int 17\n" ); break;
		case 18: __asm__ ("int 18\n" ); break;
		case 19: __asm__ ("int 19\n" ); break;
		case 20: __asm__ ("int 20\n" ); break;
		case 21: __asm__ ("int 21\n" ); break;
		case 22: __asm__ ("int 22\n" ); break;
		case 23: __asm__ ("int 23\n" ); break;
		case 24: __asm__ ("int 24\n" ); break;
		case 25: __asm__ ("int 25\n" ); break;
		case 26: __asm__ ("int 26\n" ); break;
		case 27: __asm__ ("int 27\n" ); break;
		case 28: __asm__ ("int 28\n" ); break;
		case 29: __asm__ ("int 29\n" ); break;
		case 30: __asm__ ("int 30\n" ); break;
		case 31: __asm__ ("int 31\n" ); break;
		case 32: __asm__ ("int 32\n" ); break;
		case 33: __asm__ ("int 33\n" ); break;
		case 34: __asm__ ("int 34\n" ); break;
		case 35: __asm__ ("int 35\n" ); break;
		case 36: __asm__ ("int 36\n" ); break;
		case 37: __asm__ ("int 37\n" ); break;
		case 38: __asm__ ("int 38\n" ); break;
		case 39: __asm__ ("int 39\n" ); break;
		case 40: __asm__ ("int 40\n" ); break;
		case 41: __asm__ ("int 41\n" ); break;
		case 42: __asm__ ("int 42\n" ); break;
		case 43: __asm__ ("int 43\n" ); break;
		case 44: __asm__ ("int 44\n" ); break;
		case 45: __asm__ ("int 45\n" ); break;
		case 46: __asm__ ("int 46\n" ); break;
		case 47: __asm__ ("int 47\n" ); break;
		case 48: __asm__ ("int 48\n" ); break;
		case 49: __asm__ ("int 49\n" ); break;
		case 50: __asm__ ("int 50\n" ); break;
		case 51: __asm__ ("int 51\n" ); break;
		case 52: __asm__ ("int 52\n" ); break;
		case 53: __asm__ ("int 53\n" ); break;
		case 54: __asm__ ("int 54\n" ); break;
		case 55: __asm__ ("int 55\n" ); break;
		case 56: __asm__ ("int 56\n" ); break;
		case 57: __asm__ ("int 57\n" ); break;
		case 58: __asm__ ("int 58\n" ); break;
		case 59: __asm__ ("int 59\n" ); break;
		case 60: __asm__ ("int 60\n" ); break;
		case 61: __asm__ ("int 61\n" ); break;
		case 62: __asm__ ("int 62\n" ); break;
		case 63: __asm__ ("int 63\n" ); break;
		case 64: __asm__ ("int 64\n" ); break;
		case 65: __asm__ ("int 65\n" ); break;
		case 66: __asm__ ("int 66\n" ); break;
		case 67: __asm__ ("int 67\n" ); break;
		case 68: __asm__ ("int 68\n" ); break;
		case 69: __asm__ ("int 69\n" ); break;
		case 70: __asm__ ("int 70\n" ); break;
		case 71: __asm__ ("int 71\n" ); break;
		case 72: __asm__ ("int 72\n" ); break;
		case 73: __asm__ ("int 73\n" ); break;
		case 74: __asm__ ("int 74\n" ); break;
		case 75: __asm__ ("int 75\n" ); break;
		case 76: __asm__ ("int 76\n" ); break;
		case 77: __asm__ ("int 77\n" ); break;
		case 78: __asm__ ("int 78\n" ); break;
		case 79: __asm__ ("int 79\n" ); break;
		case 80: __asm__ ("int 80\n" ); break;
		case 81: __asm__ ("int 81\n" ); break;
		case 82: __asm__ ("int 82\n" ); break;
		case 83: __asm__ ("int 83\n" ); break;
		case 84: __asm__ ("int 84\n" ); break;
		case 85: __asm__ ("int 85\n" ); break;
		case 86: __asm__ ("int 86\n" ); break;
		case 87: __asm__ ("int 87\n" ); break;
		case 88: __asm__ ("int 88\n" ); break;
		case 89: __asm__ ("int 89\n" ); break;
		case 90: __asm__ ("int 90\n" ); break;
		case 91: __asm__ ("int 91\n" ); break;
		case 92: __asm__ ("int 92\n" ); break;
		case 93: __asm__ ("int 93\n" ); break;
		case 94: __asm__ ("int 94\n" ); break;
		case 95: __asm__ ("int 95\n" ); break;
		case 96: __asm__ ("int 96\n" ); break;
		case 97: __asm__ ("int 97\n" ); break;
		case 98: __asm__ ("int 98\n" ); break;
		case 99: __asm__ ("int 99\n" ); break;
		case 100: __asm__ ("int 100\n" ); break;
		case 101: __asm__ ("int 101\n" ); break;
		case 102: __asm__ ("int 102\n" ); break;
		case 103: __asm__ ("int 103\n" ); break;
		case 104: __asm__ ("int 104\n" ); break;
		case 105: __asm__ ("int 105\n" ); break;
		case 106: __asm__ ("int 106\n" ); break;
		case 107: __asm__ ("int 107\n" ); break;
		case 108: __asm__ ("int 108\n" ); break;
		case 109: __asm__ ("int 109\n" ); break;
		case 110: __asm__ ("int 110\n" ); break;
		case 111: __asm__ ("int 111\n" ); break;
		case 112: __asm__ ("int 112\n" ); break;
		case 113: __asm__ ("int 113\n" ); break;
		case 114: __asm__ ("int 114\n" ); break;
		case 115: __asm__ ("int 115\n" ); break;
		case 116: __asm__ ("int 116\n" ); break;
		case 117: __asm__ ("int 117\n" ); break;
		case 118: __asm__ ("int 118\n" ); break;
		case 119: __asm__ ("int 119\n" ); break;
		case 120: __asm__ ("int 120\n" ); break;
		case 121: __asm__ ("int 121\n" ); break;
		case 122: __asm__ ("int 122\n" ); break;
		case 123: __asm__ ("int 123\n" ); break;
		case 124: __asm__ ("int 124\n" ); break;
		case 125: __asm__ ("int 125\n" ); break;
		case 126: __asm__ ("int 126\n" ); break;
		case 127: __asm__ ("int 127\n" ); break;
		case 128: __asm__ ("int 128\n" ); break;
		case 129: __asm__ ("int 129\n" ); break;
		case 130: __asm__ ("int 130\n" ); break;
		case 131: __asm__ ("int 131\n" ); break;
		case 132: __asm__ ("int 132\n" ); break;
		case 133: __asm__ ("int 133\n" ); break;
		case 134: __asm__ ("int 134\n" ); break;
		case 135: __asm__ ("int 135\n" ); break;
		case 136: __asm__ ("int 136\n" ); break;
		case 137: __asm__ ("int 137\n" ); break;
		case 138: __asm__ ("int 138\n" ); break;
		case 139: __asm__ ("int 139\n" ); break;
		case 140: __asm__ ("int 140\n" ); break;
		case 141: __asm__ ("int 141\n" ); break;
		case 142: __asm__ ("int 142\n" ); break;
		case 143: __asm__ ("int 143\n" ); break;
		case 144: __asm__ ("int 144\n" ); break;
		case 145: __asm__ ("int 145\n" ); break;
		case 146: __asm__ ("int 146\n" ); break;
		case 147: __asm__ ("int 147\n" ); break;
		case 148: __asm__ ("int 148\n" ); break;
		case 149: __asm__ ("int 149\n" ); break;
		case 150: __asm__ ("int 150\n" ); break;
		case 151: __asm__ ("int 151\n" ); break;
		case 152: __asm__ ("int 152\n" ); break;
		case 153: __asm__ ("int 153\n" ); break;
		case 154: __asm__ ("int 154\n" ); break;
		case 155: __asm__ ("int 155\n" ); break;
		case 156: __asm__ ("int 156\n" ); break;
		case 157: __asm__ ("int 157\n" ); break;
		case 158: __asm__ ("int 158\n" ); break;
		case 159: __asm__ ("int 159\n" ); break;
		case 160: __asm__ ("int 160\n" ); break;
		case 161: __asm__ ("int 161\n" ); break;
		case 162: __asm__ ("int 162\n" ); break;
		case 163: __asm__ ("int 163\n" ); break;
		case 164: __asm__ ("int 164\n" ); break;
		case 165: __asm__ ("int 165\n" ); break;
		case 166: __asm__ ("int 166\n" ); break;
		case 167: __asm__ ("int 167\n" ); break;
		case 168: __asm__ ("int 168\n" ); break;
		case 169: __asm__ ("int 169\n" ); break;
		case 170: __asm__ ("int 170\n" ); break;
		case 171: __asm__ ("int 171\n" ); break;
		case 172: __asm__ ("int 172\n" ); break;
		case 173: __asm__ ("int 173\n" ); break;
		case 174: __asm__ ("int 174\n" ); break;
		case 175: __asm__ ("int 175\n" ); break;
		case 176: __asm__ ("int 176\n" ); break;
		case 177: __asm__ ("int 177\n" ); break;
		case 178: __asm__ ("int 178\n" ); break;
		case 179: __asm__ ("int 179\n" ); break;
		case 180: __asm__ ("int 180\n" ); break;
		case 181: __asm__ ("int 181\n" ); break;
		case 182: __asm__ ("int 182\n" ); break;
		case 183: __asm__ ("int 183\n" ); break;
		case 184: __asm__ ("int 184\n" ); break;
		case 185: __asm__ ("int 185\n" ); break;
		case 186: __asm__ ("int 186\n" ); break;
		case 187: __asm__ ("int 187\n" ); break;
		case 188: __asm__ ("int 188\n" ); break;
		case 189: __asm__ ("int 189\n" ); break;
		case 190: __asm__ ("int 190\n" ); break;
		case 191: __asm__ ("int 191\n" ); break;
		case 192: __asm__ ("int 192\n" ); break;
		case 193: __asm__ ("int 193\n" ); break;
		case 194: __asm__ ("int 194\n" ); break;
		case 195: __asm__ ("int 195\n" ); break;
		case 196: __asm__ ("int 196\n" ); break;
		case 197: __asm__ ("int 197\n" ); break;
		case 198: __asm__ ("int 198\n" ); break;
		case 199: __asm__ ("int 199\n" ); break;
		case 200: __asm__ ("int 200\n" ); break;
		case 201: __asm__ ("int 201\n" ); break;
		case 202: __asm__ ("int 202\n" ); break;
		case 203: __asm__ ("int 203\n" ); break;
		case 204: __asm__ ("int 204\n" ); break;
		case 205: __asm__ ("int 205\n" ); break;
		case 206: __asm__ ("int 206\n" ); break;
		case 207: __asm__ ("int 207\n" ); break;
		case 208: __asm__ ("int 208\n" ); break;
		case 209: __asm__ ("int 209\n" ); break;
		case 210: __asm__ ("int 210\n" ); break;
		case 211: __asm__ ("int 211\n" ); break;
		case 212: __asm__ ("int 212\n" ); break;
		case 213: __asm__ ("int 213\n" ); break;
		case 214: __asm__ ("int 214\n" ); break;
		case 215: __asm__ ("int 215\n" ); break;
		case 216: __asm__ ("int 216\n" ); break;
		case 217: __asm__ ("int 217\n" ); break;
		case 218: __asm__ ("int 218\n" ); break;
		case 219: __asm__ ("int 219\n" ); break;
		case 220: __asm__ ("int 220\n" ); break;
		case 221: __asm__ ("int 221\n" ); break;
		case 222: __asm__ ("int 222\n" ); break;
		case 223: __asm__ ("int 223\n" ); break;
		case 224: __asm__ ("int 224\n" ); break;
		case 225: __asm__ ("int 225\n" ); break;
		case 226: __asm__ ("int 226\n" ); break;
		case 227: __asm__ ("int 227\n" ); break;
		case 228: __asm__ ("int 228\n" ); break;
		case 229: __asm__ ("int 229\n" ); break;
		case 230: __asm__ ("int 230\n" ); break;
		case 231: __asm__ ("int 231\n" ); break;
		case 232: __asm__ ("int 232\n" ); break;
		case 233: __asm__ ("int 233\n" ); break;
		case 234: __asm__ ("int 234\n" ); break;
		case 235: __asm__ ("int 235\n" ); break;
		case 236: __asm__ ("int 236\n" ); break;
		case 237: __asm__ ("int 237\n" ); break;
		case 238: __asm__ ("int 238\n" ); break;
		case 239: __asm__ ("int 239\n" ); break;
		case 240: __asm__ ("int 240\n" ); break;
		case 241: __asm__ ("int 241\n" ); break;
		case 242: __asm__ ("int 242\n" ); break;
		case 243: __asm__ ("int 243\n" ); break;
		case 244: __asm__ ("int 244\n" ); break;
		case 245: __asm__ ("int 245\n" ); break;
		case 246: __asm__ ("int 246\n" ); break;
		case 247: __asm__ ("int 247\n" ); break;
		case 248: __asm__ ("int 248\n" ); break;
		case 249: __asm__ ("int 249\n" ); break;
		case 250: __asm__ ("int 250\n" ); break;
		case 251: __asm__ ("int 251\n" ); break;
		case 252: __asm__ ("int 252\n" ); break;
		case 253: __asm__ ("int 253\n" ); break;
		case 254: __asm__ ("int 254\n" ); break;
		case 255: __asm__ ("int 255\n" ); break;
	}
}

void main() 
{			
	// DisplayColour and Delay methods cannot be used until virtual addressing is set up i.e. until PG bit of CR0 is on.
	// Use inline assembly colour method for debugging.
	// This is because until virtual addressing is set up, code is only accessible through physical addresses but method calls 
	// are based on virtual addresses (because of the link script).
	
	unsigned int PhysicalAddressAndFlags = 7; 	// ; 0b111 - Setting Page Table flags (Present: ON, Read/Write: ON, User/Supervisor: ON)
	unsigned int NoOfPageTables = 4; 			// 4 is arbitrary to cover 16MiB
	unsigned int EntriesPerPageTable = 1024;	// There is always 1024 pages (4KiB/Page)
	unsigned int StartPageTableEntryIndex = 0;
	unsigned int SizeOfPageTables = NoOfPageTables * EntriesPerPageTable;
	
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
		
	DisplayColour(0x3, 0xF);	// DisplayColour can also be used for debugging
	; // END - Set Virtual Memory
	
	// BEGIN - Interrupt Descriptor Table setup
	
	IDT_Entry_t* IDT_Ptr = (IDT_Entry_t*)IDT_Contents;
	
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(0)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(1)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(2)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(3)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(4)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(5)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(6)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(7)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(8)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(9)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(10)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(11)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(12)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(13)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(14)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(15)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(16)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(17)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(18)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(19)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(20)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(21)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(22)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(23)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(24)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(25)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(26)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(27)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(28)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(29)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(30)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(31)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(32)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(33)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(34)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(35)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(36)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(37)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(38)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(39)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(40)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(41)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(42)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(43)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(44)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(45)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(46)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(47)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(48)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(49)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(50)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(51)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(52)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(53)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(54)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(55)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(56)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(57)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(58)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(59)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(60)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(61)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(62)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(63)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(64)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(65)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(66)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(67)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(68)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(69)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(70)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(71)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(72)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(73)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(74)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(75)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(76)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(77)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(78)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(79)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(80)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(81)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(82)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(83)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(84)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(85)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(86)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(87)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(88)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(89)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(90)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(91)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(92)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(93)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(94)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(95)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(96)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(97)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(98)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(99)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(100)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(101)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(102)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(103)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(104)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(105)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(106)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(107)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(108)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(109)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(110)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(111)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(112)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(113)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(114)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(115)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(116)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(117)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(118)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(119)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(120)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(121)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(122)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(123)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(124)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(125)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(126)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(127)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(128)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(129)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(130)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(131)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(132)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(133)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(134)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(135)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(136)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(137)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(138)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(139)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(140)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(141)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(142)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(143)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(144)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(145)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(146)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(147)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(148)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(149)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(150)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(151)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(152)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(153)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(154)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(155)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(156)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(157)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(158)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(159)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(160)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(161)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(162)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(163)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(164)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(165)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(166)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(167)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(168)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(169)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(170)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(171)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(172)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(173)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(174)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(175)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(176)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(177)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(178)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(179)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(180)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(181)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(182)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(183)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(184)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(185)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(186)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(187)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(188)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(189)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(190)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(191)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(192)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(193)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(194)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(195)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(196)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(197)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(198)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(199)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(200)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(201)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(202)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(203)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(204)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(205)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(206)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(207)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(208)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(209)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(210)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(211)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(212)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(213)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(214)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(215)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(216)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(217)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(218)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(219)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(220)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(221)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(222)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(223)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(224)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(225)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(226)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(227)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(228)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(229)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(230)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(231)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(232)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(233)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(234)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(235)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(236)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(237)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(238)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(239)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(240)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(241)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(242)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(243)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(244)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(245)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(246)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(247)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(248)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(249)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(250)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(251)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(252)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(253)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(254)
	COMMON_INTERRUPT_HANDLER_SETUP_ENTRY(255)
	
	IDT_Pointer_t* IDT_Ptr_Ptr = (IDT_Pointer_t*)IDT_Pointer;
	IDT_Ptr_Ptr->TableSize = (unsigned short)((256 * sizeof(IDT_Entry_t)) - 1);
	IDT_Ptr_Ptr->IDT_Ptr = IDT_Ptr;
	
	__asm__
	(
		"lea EAX, [IDT_Pointer]\n"  // Load address of (/pointer to) IDT pointer structure
		"lidt [EAX]\n"						// Load IDT register with pointer to IDT pointer structure
	);
	
	// END - Interrupt descriptor Table setup
	
	// BEGIN - PIC setup and remap
	
	// Remap IRQs 0-7    to    ISRs 32-39
	// and   IRQs 8-15   to    ISRs 40-47
	outb(0x20, 0x11)
	outb(0xA0, 0x11)
	
	outb(0x21, 0x20)
	outb(0xA1, 0x28)
	
	outb(0x21, 0x04)
	outb(0xA1, 0x02)
	
	outb(0x21, 0x01)
	outb(0xA1, 0x01)
	
	outb(0x21, 0xFF)
	outb(0xA1, 0xFF)

	STI
		
	// END - PIC setup and remap
	
	// BEGIN - Configure PIT (The Timer)
	CLI
	
  // Unmask (i.e. enable) the timer interrupt in the PIC
	__asm__
	(
		"in AL, 0x21\n"
		"and AL, 0xFE\n"
		"out 0x21, AL\n"
	);
	
  // Configure timer 0 of the PIT to be a slow rate generator
	outb(0x43, 0x34)
	outb(0x40, 0xFF)
	outb(0x40, 0xFF)
	
	STI
	// END - Configure PIT (The Timer)
	
	// Issue some interrupts
	while(1) 
	{
		unsigned int i;
		for(i = 48; i < 255; i++)
		{
			IssueInterrupt((unsigned char)i);
		}
	}
	
	DisplayColour(0x4, 0xF);
}