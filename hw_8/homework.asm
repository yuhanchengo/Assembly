TITLE hw_8

INCLUDE Irvine32.inc
.stack 4096
DifferentInputs PROTO v1:DWORD, v2:DWORD, v3:DWORD
main          EQU start@0
.data

.code
main PROC
	Invoke DifferentInputs, 2, 2, 3
	Invoke DifferentInputs, 2, 3, 2
	Invoke DifferentInputs, 3, 5, 5
	Invoke DifferentInputs, 2, 2, 2
	Invoke DifferentInputs, 104522064, 102401053, 104503002
	Invoke ExitProcess, 0
main ENDP
DifferentInputs PROC,
	v1:DWORD, v2:DWORD, v3:DWORD
	
	mov eax, v1; get v1
	cmp v2, eax; compare v1 and v2, if same then jump to Label_equal
	je Label_equal; 
	cmp v3, eax; compare v1 and v3, if same them jump to Label_equal
	je Label_equal
	mov eax, v2; get v2
	cmp eax, v3; compare v2 and v3, if same then jump to Label_equal 
	je Label_equal
	mov eax, 1; if v1 != v2 != v3 then jump to eax = 1 and exit
	jmp Exit_label

Label_equal:
	mov eax, 0; return false

Exit_label:
	call DumpRegs; print all registers value
	ret
DifferentInputs ENDP

END main



