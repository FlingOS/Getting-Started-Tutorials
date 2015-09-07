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
        
        [Drivers.Compiler.Attributes.MainMethod]
        public static unsafe void Main()
        {
            byte BackgroundColour = 0x06; // Yellow
	        byte ForegroundColour = 0x0F; // White
	        byte Colour = (byte)(((BackgroundColour << 4) & 0xF0) | (ForegroundColour & 0x0F));
	        ushort* DisplayMemoryPtr = (ushort*)0xB8000;
	        uint DisplaySize = 2000; // = 80 * 25
	        uint i = 0;
	        while (i < DisplaySize)
	        {
		        DisplayMemoryPtr[i++] = (ushort)((((ushort)Colour) << 8) | 0x00);
	        }

	        i = 0x0F000000;
	        while (i-- > 0)
	        {
		        ;
	        }
        }
        [Drivers.Compiler.Attributes.CallStaticConstructorsMethod]
        public static void CallStaticConstructors()
        {
        }
    }
}