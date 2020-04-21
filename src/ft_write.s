			section .text
			global _ft_write
_ft_write :
			mov rax, 0x2000004      ; write ; replace to mov rax, 0x1 on linux
			syscall
			ret