			section .text
			global _ft_write
			extern ___error

;ssize_t rax	ft_write(int rdi, const void *rsi, size_t rdx);
_ft_write :
			xor rax, rax
check_err :
			cmp rsi, 0				;check if str != NULL -> return -1
			je err
			push rsi				;save rsi
			push rdx				;save rdx
			xor rsi, rsi
			mov esi, 1				;cmd checker of fnctl, 1 = F_GETFD -> Return the fd flags
			mov rax, 0x200005c		;syscall FCNTL
			syscall
			pop rdx					;restore rdx
			pop rsi					;restore rsi
			cmp eax, 0				;compare the return of FCNTL
			jne err					;if != 0 -> return -1

			jmp write
write :
			mov rax, 0x2000004		;syscall WRITE
			syscall
			ret						;return rax == nb_octet_write
err :
			push rbp
			mov rbp, rsp
			mov rdx, rax			;save FNCTL return (error flag) in red
			call ___error			;call __error function to find errno adress and stock it in rax
			mov rsp, rbp
    		pop rbp
			mov [rax], rdx			;stock the error flag on the adress of rcx (errno)
			mov rax, -1				;set return -1
			ret