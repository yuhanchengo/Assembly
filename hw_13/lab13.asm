INCLUDE Irvine32.inc

Str_remove PROTO,pStart:PTR BYTE,nChars:DWORD

main  EQU start@0 ;
.data
target BYTE "104503002ABCDEF",0

.code
main PROC

	mov edi, OFFSET target  ;edi = target�_�l��m
	mov al, '2'  ;al = �Ǹ�2�̫�@�X(�r��)
	mov ecx, LENGTHOF target  ;ecx = target �r�ꪺ����
	cld              ;clear direction flag
    repne scasb      ;repeat searching while not equal
	dec edi         ;�N��쪺�r����m��@
	mov eax, edi  ;eax = target�_�l��m
	sub edi, OFFSET target  ;edi -= target�_�l��m
	call DumpRegs   ;��ܥثe�Ȧs�����p

	mov edx,OFFSET target
	call WriteString
	call Crlf
	INVOKE Str_remove,ADDR target,al 	;�I�s Str_remove
	mov edx,OFFSET target
	call WriteString
	call Crlf
	call WaitMsg
	exit
main ENDP

Str_remove PROC,
	pStart:PTR BYTE,	; �n�������r���Y
	nChars:DWORD		; �N�������r����

	INVOKE Str_length, pStart
	mov	ecx,eax			;ecx = �r�����

	.IF nChars <= ecx	; check range of nChars
	  sub ecx, nChars 	; set counter for REP prefix
	.ENDIF

	mov esi, pStart	;esi = �r��_�l��m
	add esi, nChars	;esi += �n�������r����
	mov edi, pStart	;edi = �r��_�l��m

	cld               ;clear direction flag
	rep movsb	     ;do the move

	mov	BYTE PTR [edi],0	; insert new null byte

Exit_proc:
	ret
Str_remove ENDP
END main
