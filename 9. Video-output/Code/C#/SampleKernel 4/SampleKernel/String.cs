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

namespace SampleKernel
{
    /// <summary>
    /// Replacement class for methods, properties and fields usually found on standard System.String type.
    /// Also contains utility methods for low-level string manipulation.
    /// </summary>
    [Drivers.Compiler.Attributes.StringClass]
    public class String : Object
    {
        /* If you add more fields here, remember to update the compiler and all the ASM files that depend on the string
           class structure ( i.e. do all the hard work! ;) )
         */

        /// <summary>
        /// The size of the fields in an string object that come before the actual string data.
        /// </summary>
        public const uint FieldsBytesSize = 8;

        /// <summary>
        /// The length of the string.
        /// </summary>
        public int length;

        /*   ----------- DO NOT CREATE A CONSTRUCTOR FOR THIS CLASS - IT WILL NEVER BE CALLED IF YOU DO ----------- */

        [Drivers.Compiler.Attributes.NoGC]
        [Drivers.Compiler.Attributes.NoDebug]
        public String()
        {
        }

        /// <summary>
        /// Gets the character at the specified index.
        /// </summary>
        /// <param name="index">The index of the character to get.</param>
        /// <returns>The character at the specified index.</returns>
        public unsafe char this[int index]
        {
            [Drivers.Compiler.Attributes.NoDebug]
            [Drivers.Compiler.Attributes.NoGC]
            get
            {
                byte* thisPtr = (byte*)Utilities.ObjectUtilities.GetHandle(this);
                thisPtr += 8; /*For fields inc. inherited*/
                return ((char*)thisPtr)[index];
            }
            [Drivers.Compiler.Attributes.NoDebug]
            [Drivers.Compiler.Attributes.NoGC]
            set
            {
                byte* thisPtr = (byte*)Utilities.ObjectUtilities.GetHandle(this);
                thisPtr += 8; /*For fields inc. inherited*/
                ((char*)thisPtr)[index] = value;
            }
        }

        /// <summary>
        /// Implicitly converts the specified value to an SampleKernel.String.
        /// </summary>
        /// <param name="x">The value to convert.</param>
        /// <returns>The SampleKernel.String value.</returns>
        [Drivers.Compiler.Attributes.NoDebug]
        [Drivers.Compiler.Attributes.NoGC]
        public static implicit operator SampleKernel.String(string x)
        {
            return (SampleKernel.String)(object)x;
        }
    }
}
