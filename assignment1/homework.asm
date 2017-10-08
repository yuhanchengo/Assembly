TITLE Example of ASM                (asmExample.ASM)

; This program locates the cursor and displays the
; system time. It uses two Win32 API structures.
; Last update: 6/30/2005

INCLUDE Irvine32.inc

; Redefine external symbols for convenience
; Redifinition is necessary for using stdcall in .model directive 
; using "start" is because for linking to WinDbg.  added by Huang
 
main          EQU start@0

.data
	MyID WORD ?; 2 bytes, id = 1053
	Digit0 BYTE 01h; 1 byte, 0000 0001
	Digit1 BYTE 00h; 1 byte, 0000 0000
	Digit2 BYTE 05h; 1 byte, 0000 0101
	Digit3 BYTE 03h; 1 byte, 0000 0011

.code
main PROC
	mov eax, 00h; initialize eax
	mov ah, Digit0; ah = 01h, 1 byte 
	mov al, Digit2; al = 05h, 1 byte
	shl eax, 4; left shift eax for 4 bits, because four bits = 1 hex, so shifting four bits is equal to shifting 1 digits in hex
	add ah, Digit1; ah = 10+0 = 10
	add al, Digit3; al = 50+3 = 53
	mov MyID, ax; MyID = 1053
	
	exit
main ENDP
END main