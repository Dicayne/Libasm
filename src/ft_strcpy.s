			section .text
			global _ft_strcpy

;char	*rax ft_strcpy(char *rdi, const char *rsi);
_ft_strcpy:
			xor rax, rax			;initialized rax and rcx to 0
			xor rcx, rcx
			jmp compare				;jump to compare layer

cpy:
			mov al, BYTE[rsi + rcx]	;stock rsi[rcx] in al
			mov BYTE[rdi + rcx], al	;stock al in rdi[rcx]
			inc rcx					;increment rcx
compare:
			cmp BYTE[rsi + rcx], 0	;check if rsi[rcx] != 0 -> jump to cpy layer
			jnz cpy
			mov rax, rdi			;stock rdi in rax
			ret						;return rax