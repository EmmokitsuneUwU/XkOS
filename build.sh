nasm -f bin boot.asm -o boot.bin && qemu-system-x86_64 -monitor stdio boot.bin
