TITLE assignment2

INCLUDE Irvine32.inc

; OBJECTIVE : use 0,1 to convert # and space to show the last digit of my studentID on the screen
main          EQU start@0

.data
; ChStrs: my student id last digit: 3
ChStrs BYTE "########"
	   BYTE "      ##"
	   BYTE "      ##"
	   BYTE "########"
	   BYTE "########"
	   BYTE "      ##"
	   BYTE "      ##"
	   BYTE "########"

BitStrs BYTE 8 dup(?) ; 

.code
change PROC USES cx
	mov cx, LENGTHOF ChStrs ; counter for L1 to go through the eight elements in a line
L1:
	mov dl, [esi]; put ChStrs's element in dl ('#' or ' ')
	cmp dl, ' '; compare dl and space
	je space; if is space then jump to space
	cmp dl, '#'; compare dl and '#'
	je hash; if is hash then jump to hash label
	
space:
	shl BitStrs[edi], 1; left shift a bit
	add BitStrs[edi], 0; add 0 to BitStrs's element because it's a space
	jmp next
hash:
	shl BitStrs[edi], 1; left shift a bit
	add BitStrs[edi], 1; add 1 to BitStrs's element because it's a hashtag
	jmp next
next:
	inc esi; increment esi to point to the next element
	loop L1
	ret
change ENDP

main PROC
	mov esi, OFFSET ChStrs; set esi to offset of ChStrs
	mov edi, 0; set edi to 0 to point to the first element in target BitStrs 
	mov cx, 8; call the procedure 8 times
	mov eax, 0; set eax to 0 because will call WriteBinB later
L1:
	call change
	mov al, BitStrs[edi] ; mov the BYTE element of BitStr to al
	mov ebx, TYPE BitStrs; mov the type of BitStr to ebx to tell WriteBinB how many bits to write
	call WriteBinB; output BitStrs to screen 
	call Crlf; newline 
	inc edi; increment edi to point to the next Byte in BitStrs 
	loop L1
	
	exit
main ENDP
END main