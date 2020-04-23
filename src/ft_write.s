			section .text
			global _ft_write

;ssize_t rax	ft_write(int rdi, const void *rsi, size_t rdx);
_ft_write :
			xor rax, rax
check_err :
			cmp rsi, 0				;check if str != NULL -> return -1
			je err
			push rsi				;save rsi
			push rdx				;save rdx
			xor rsi, rsi
			mov rsi, 1				;cmd checker of fnctl, 1 = F_GETFD -> Return the fd flags
			mov rax, 0x200005c		;syscall FNCTL
			syscall
			cmp rax, 0				;compare the return of FNCTL
			jne err					;if != 0 -> return -1

			pop rdx					;restore rdx
			pop rsi					;restore rsi
			jmp write
write :
			mov rax, 0x2000004		;syscall WRITE
			syscall
			ret						;return rax == nb_octet_write
err :
			mov rax, -1
			ret