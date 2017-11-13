TITLE hw_7

INCLUDE Irvine32.inc
.stack 4096
FindLargest PROTO aPtr: PTR SDWORD, arraySize: DWORD
main          EQU start@0
.data
Ex1Array SDWORD 106522072, 102401053, 104503002	
Ex2Array SDWORD -106522072, -102401053, -104503002
.code
main PROC
	Invoke FindLargest, ADDR Ex1Array, LENGTHOF Ex1Array
	call WriteInt; output to screen
	call Crlf; new line
	Invoke FindLargest, ADDR Ex2Array, LENGTHOF Ex2Array
	call WriteInt
	call Crlf
	call dumpRegs
	call WaitMsg
	Invoke ExitProcess, 0
main ENDP

FindLargest PROC, aPtr:PTR SDWORD, arraySize: DWORD
	mov esi, aPtr; move the address of array to esi
	mov ecx, arraySize; store arraySize to ecx
	mov edx, 0; intialize edx
	mov ebx, TYPE aPtr; save type of array to ebx for writeInt 
	L:
		mov eax, edx; move the current largest value to eax
		sub eax, [esi]; compare between the current largest value and the next value in the array
		jb L2; if eax is smaller than [esi], jump to L2
		add esi, SIZEOF SDWORD; point to next element
		loop L
		mov eax, edx ; move edx to eax so that WriteInt will output the value
		ret
	L2:
		mov edx, [esi]; change the current largest value to the element
		add esi, SIZEOF SDWORD 
		loop L
	
FindLargest ENDP
END main



