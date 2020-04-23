			section .text
			global _ft_read

;ssize_t rax	ft_read(int rdi, void *rsi, size_t rdx);
_ft_read :
			xor rax, rax
check_err :
			cmp rsi, 0				;check if buf != NULL -> return -1
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
			jmp read
read :
			mov rax, 0x2000003		;syscall READ
			syscall
			ret						;return rax == nb_octet_read
err :
			mov rax, -1
			ret