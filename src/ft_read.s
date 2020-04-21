			section .text
			global _ft_read

err :
			mov rax, -1
			ret
_ft_read :
			mov rax, rdi
			sub rax, -1
			cmp rax, 0
			jz err
			mov rax, 0x2000003
			syscall
			;cmp rax, rdx
			;jne err
			ret
