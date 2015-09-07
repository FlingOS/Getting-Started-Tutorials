@echo OFF

echo Executing NASM...
Tools\NASM\nasm.exe -g -f elf -o Kernel.o Kernel.asm

echo Executing linker (ld)...
Tools\Cygwin\ld.exe -T linker.ld -o Kernel.bin Kernel.o

echo Copying bin file...
copy /y Kernel.bin ISO\Kernel.bin

echo Generating ISO9660...
Tools\ISO9660Generator.exe 4 "%CD%\SampleKernel.iso" "%CD%\ISO\isolinux-debug.bin" true "%CD%\ISO"

echo Complete.
pause
@echo ON