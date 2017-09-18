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
	;some data

.code
main PROC
	MOV al, 00110101b ; last two digits of leader’s students ID in binary format
	MOV ah, 02 ; last two digits of member’s students ID in decimal format
	MOV ax, 41Dh ; last four digits of student’s ID in hexadecimal
	MOV dx, 0eeeah ; let the value of dx is eeea
	SUB dx, ax ; value of dx subtracting by ax
	exit
main ENDP
END main