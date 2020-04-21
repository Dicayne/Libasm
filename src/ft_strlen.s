			section .text
			global _ft_strlen
_ft_strlen :
			xor rax, rax	; rax = valeur de retour, initialiser a 0
			jmp comp		; saut a la fonction comp
incr :
			inc rax			;incrmentation de rax et retour a la fonction comp
comp :
			cmp BYTE[rdi + rax], 0	;rdi = argument 1 ->str
			jnz incr				; si cmp str[rax] != 0 saut a la fonction incr
			ret						; sinon retourn la valeur de rax