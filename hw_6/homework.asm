TITLE ASM_practice_003	(p03.asm)

INCLUDE Irvine32.inc

main          EQU start@0
.data
	myID DWORD 102401053d; Student ID of Leader in decimal
	size_ID = 9; size_ID is length of myID
	space byte 7 DUP(0)
	myID_result byte "102401053", 0; Student ID of leader in string

.code
convert MACRO myID, size_ID, myID_result;
	IFB <myID>
		EXITM
	ENDIF
	IFB <size_ID>
		EXITM
	ENDIF
	IFB <myID_result>
		EXITM
	ENDIF
	
	mov ecx, size_ID
	mov ebx, 10
	mov eax, myID
	
	L:
		;mov ebx, 10d; use two to check whether it's odd or not
		mov edx, 0; initialize edx
	 	div ebx; to get the last digit of myID in edx
		;push eax; we have to use eax for now
		and edx, 1
		;mov eax, edx; check if edx the last digit is odd or not
		;mov ebx, 02d; use ebx to divide by 2; if remainder is 1 then odd otherwise even
		;mov edx, 00h
		;div ebx; 
		;cmp edx, 0d; compare 0 with 1
		jnz L1; if odd jump to L1
		mov myID_result[ecx-1], 41h
		jmp L2; if even jump to L2
		;pop eax; restore the value of eax
		;loop L
	L1:
		mov myID_result[ecx-1], 42h
	L2:
		loop L
ENDM

main PROC
	mov eax, myID
	call WriteDec
	call Crlf; newline
	convert myID, size_ID, myID_result
	mov edx, offset myID_result
	call WriteString
	call Crlf
	call WaitMsg
	exit
main ENDP
END main