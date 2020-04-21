			section .text
			global _ft_strcpy

_ft_strcpy:
			xor rax, rax
			xor rcx, rcx
			jmp compare

cpy:
			mov al, BYTE[rsi + rcx]
			mov BYTE[rdi + rcx], al
			inc rcx
compare:
			cmp BYTE[rsi + rcx], 0
			jnz cpy
			mov rax, rdi
			ret