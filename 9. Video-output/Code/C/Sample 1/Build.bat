@echo OFF

echo Executing NASM...
Tools\NASM\nasm.exe -f elf -o Kernel.o Kernel.asm

echo Executing GCC...
..\..\..\..\CrossCompiler\bin\i686-elf-gcc -S main.c -nostartfiles -nostdlib -masm=intel

echo Executing GCC...
..\..\..\..\CrossCompiler\bin\i686-elf-gcc Kernel.o main.c -o Kernel.bin -T linker.ld -nostartfiles -nostdlib -masm=intel

echo Copying bin file...
copy /y Kernel.bin ISO\Kernel.bin

echo Generating ISO9660...
Tools\ISO9660Generator.exe 4 "%CD%\SampleKernel.iso" "%CD%\ISO\isolinux-debug.bin" true "%CD%\ISO"

echo Complete.
pause
@echo ON