TITLE ASM_practice_003	(p03.asm)

INCLUDE Irvine32.inc

main          EQU start@0
.data
	ninenine byte 9 DUP(?)

.code

main PROC
	mov cx, 9; because I have to go through nine times, so I set counter to be 9 (from 1 to 9)
	mov esi, OFFSET ninenine; store the address of ninenine to esi, so that esi become a pointer to ninenine
	mov ax, 0; ax is a register to store the value after each addition of 9
	L:; the first time, 9 will be saved to esi, and second time 18 will be saved to esi+1, and so on.
		add ax, 9; in the first loop, ax will become 9, due to 0 + 9, and the value of it will preserve through the nine loops
		mov [esi], ax; after getting the value in ax, save it to esi
		inc esi; since the result should be save in a subsequence of memory, we add esi by 1 at a time so that the pointer points to another address
	loop L
	
	exit
main ENDP
END main