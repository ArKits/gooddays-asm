; Print a string with SetTextColor

INCLUDE Irvine32.inc

.386

.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
count = 100
last  = 1445263496
fibo dword 1,1, count dup(0)
str1 BYTE "ITS WORK!", 0
str2 BYTE "NO WORK :(", 0


.code

FiboProco PROC
mov esi, offset fibo
mov eax, 0
mov ecx, count
ret
FiboProco ENDP


main PROC

	call FiboProco

	L1:
	mov eax, [esi]
	add eax, [esi + 4]
	mov [esi + 8], eax
	add esi, TYPE fibo
	loop L1

	mov edx, OFFSET fibo
	call WriteDec
	call Crlf

	mov edx, OFFSET last
	call WriteDec
	call Crlf


	.IF fibo == last
		mov edx, OFFSET str1
		call WriteString
		call Crlf
	.ELSE
		mov edx, OFFSET str2
		call WriteString
		call Crlf
	.ENDIF




    INVOKE ExitProcess,0
main ENDP

END main