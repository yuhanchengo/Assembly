TITLE ASM_practice_003	(p03.asm)

INCLUDE Irvine32.inc

main          EQU start@0
.data
	myID BYTE 1,0,2,4,0,1,0,5,3
	sizeID = ($-myID); $ is the current address of assembler, so when using the current address to minus the address of variable myID, we get the length of myID
	myID_odd DWORD ?
	myID_even DWORD ?
	myID_result DWORD ?

.code

main PROC
	mov ecx, sizeID; set the iterations
	xor edx, edx; edx = 0 the number of odd numbers
	xor ebx, ebx; ebx = 0 the sum of even numbers
	xor esi, esi; esi = 0
L1:
	movzx eax, myID[esi]
	test eax, 1; check if last bit of eax is 1
	jnz L2; if not 0,which means its a odd number, then jump to L2
	add ebx, eax
	jmp L3; go to L3
L2:
	add edx, 1
L3:
	inc esi; move to next element
	loop L1

	mov myID_odd, edx; put the number of odd numbers into myID_odd
	mov myID_even, ebx; put the sum of even numbers into myID_even
	
	; multiplication of myID_odd and myID_even using addition and loop
	mov edx, myID_odd; move myID_odd to edx register
	mov ebx, myID_even; move myID_even to ebx register
	dec edx; because there is already an intial value in myID_even, so I do the decrement of edx once in advance
L:
	add ebx, myID_even; add myID_even to ebx
	dec edx
	jnz L

	mov myID_result, ebx; store the multiplication result to myID_result
	exit
main ENDP
END main