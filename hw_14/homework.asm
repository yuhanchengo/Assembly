TITLE hw_8

INCLUDE Irvine32.inc


main          EQU start@0
Boxwidth = 5
Boxheight = 5

.data

boxTop BYTE 0DAh, (BoxWidth-2) DUP(0C4h), 0BFh 
boxBody BYTE 0B3h, (BoxWidth-2) DUP(' '), 0B3h
boxBottom BYTE 0C0h, (BoxWidth - 2) DUP(0C4h), 0D9h

outHandle DWORD 0
bytesWritten DWORD 0
xyPos COORD <10, 5>
count DWORD 0
cellsWritten DWORD ?

attributes0 WORD BoxWidth DUP(0Ah)
attributes1 WORD (BoxWidth-1) DUP(0Ch), 0Bh
attributes2 WORD BoxWidth DUP(0Eh)

.code
main PROC
INVOKE GetStdHandle, STD_OUTPUT_HANDLE
mov outHandle, eax
call clrscr

; section for top box
INVOKE WriteConsoleOutputAttribute, outHandle, ADDR attributes0, LENGTHOF boxTop, xyPos, cellsWritten
INVOKE WriteConsoleOutputCharacter,
	   outHandle,
	   ADDR boxTop, ; pointer to the top box line
	   LENGTHOF boxTop,  ; size of box line
	   xyPos,
	   count
	
inc xyPos.y ; increment y coordinate
mov ecx, Boxheight ; number of lines in body (for loop counter) 


; section for box body
L1: push ecx ; save counter 避免invoke 有使用到這個暫存器

	INVOKE WriteConsoleOutputAttribute,
	    outHandle,
		ADDR attributes1,
		LENGTHOF boxBody,
		xyPos,
		cellsWritten
	INVOKE WriteConsoleOutputCharacter,
		outHandle,
		ADDR boxBody,
		LENGTHOF boxBody,
		xyPos,
		count

	inc xyPos.y; move cursor to next line
	pop ecx; restore counter
	
	loop L1
	
; section for box bottom

	INVOKE WriteConsoleOutputAttribute,
		outHandle,
		ADDR attributes2,
		LENGTHOF boxBottom,
		xyPos,
		cellsWritten
		
	INVOKE WriteConsoleOutputCharacter,
		outHandle,
		ADDR boxBottom,
		LENGTHOF boxBottom,
		xyPos,
		count
		
	call WaitMsg
	call Clrscr
	exit
main ENDP
END main