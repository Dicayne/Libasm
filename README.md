# Libasm
The purpose of this Lib is an introdution to the assambly 64 nasm, intel syntax language

# Testing methode
## MACOS
```sh
$ make re
$ ./asm
```
## LINUX
Modifie :
```sh
%.o: %.s
	nasm -f macho64 $^
```
to :
```sh
%.o: %.s
	nasm -f elf64 $^
```
and then:
```sh
$ make re
$ ./asm
```
#### You can modified main.c as you want

# Some Sources

README -> https://github.com/grumbach/libftASM \
ASM basic introduction -> https://beta.hackndo.com/assembly-basics/ \
Intel introduction -> https://software.intel.com/en-us/articles/introduction-to-x64-assembly/ \
Syscall list -> https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master \
