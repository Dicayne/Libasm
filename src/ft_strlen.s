			section .text
			global _ft_strlen

;size_t rax	ft_strlen(const char *rdi);
_ft_strlen :
			xor rax, rax	; rax = return value, initialized 0
			jmp comp		; jump to comp layer
incr :
			inc rax			;increment rax
comp :
			cmp BYTE[rdi + rax], 0	;rdi = arg 1 ->str
			jnz incr				; if cmp != 0 str[rax] != \0 then jump to incr layer
			ret						; else return