void main() 
{
	unsigned char BackgroundColour = 0x06; // Yellow background - distinct colour from the assembly code
	unsigned char ForegroundColour = 0x00; // Black text
	unsigned char Colour = ((BackgroundColour << 4) & 0xF0) | (ForegroundColour & 0x0F); // Calculate combined colour value
	unsigned short* DisplayMemoryPtr = (unsigned short*)0xB8000; // Pointer to start of display memory
	unsigned int DisplaySize = 2000; // Number of characters cells to fill with colour = 80 * 25 = 2000
	unsigned int i = 0; // Start at first character of the display
	while (i < DisplaySize) // Loop through all characters
	{
		//	Set character cell to 0x6000 i.e. (Colour << 8) | NULL Character
		DisplayMemoryPtr[i++] = (((unsigned short)Colour) << 8) | 0x00; 
		// Note: NULL character means "no" character. It is invisible. Sometimes referred to as the NULL Terminator.
	}

	// Delay loop which allows us to see the outputted colour before returning to assembly code
	i = 0x0F000000;
	while (i--)
	{
		;
	}
}

