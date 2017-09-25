TITLE ASM_practice_003	(p03.asm)

INCLUDE Irvine32.inc

main          EQU start@0

.data
Val1 SBYTE 03h	; 3
Val2 SBYTE 02h	; 2
Val3 SBYTE 8fh	; -113
Rval SDWORD ?

.code
main PROC
	
	movsx eax, Val1; move a signed value Val1 to register eax, so that eax = 3d
	movsx edx, Val2; move a signed value Val2 to regsiter edx, so that edx = 2d
	add eax, edx; add edx to eax, so that we have Val1+ Val2 in register eax
	mov ecx, eax; since I'm going to multiply eax by 2 and 16 later, so I first copy eax to ecx
	shl ecx, 1; since I want the value in ecx to be multipled by 2, I do 1 position left shift 
	shl eax, 4; with 4 position left shift, I can get a 16 times the value of eax in eax now.
	sub eax, ecx; since I want (Val1+Val2)*14 so I have to decompose it to (Val1+Val2)*16-(Val1+Val2)*2, which is to subtract eax by ecx
	movsx ebx, Val3; move a signed value Val3 to register ebx, so that ebx = -113d
	sub ebx, eax; since we want Val3-(Val1+Val2)*14, we subtract ebx by eax
	neg ebx; since we want -(Val3-(Val1+Val2)*14), we negate the value in ebx
	mov Rval, ebx; after getting the final value in ebx, we store it in to memory, which is the value of Rval
	exit
main ENDP
END main
