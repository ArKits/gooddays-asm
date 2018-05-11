; Only prints numbers between 100 and 1000, or less than -100 and odd.

INCLUDE Irvine32.inc

.386

.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
;Arrary1 dword 40 dup(?)

Array1 dword 50 , 150, 2000


.code

main PROC

mov ecx, lengthof Array1
mov esi, offset Array1
mov eax, green*16 + yellow
call SetTextColor

L1:

; Between 100 and 1000
cmp dword ptr [esi], 100
jl next
cmp dword ptr [esi], 1000
jg next

test dword ptr [esi], 1         ; Odd Number
jnz next
cmp dword ptr [esi], -100       ; Less than -100
jg next

WriteMe:
mov eax, [esi]
call WriteDec
call crlf

next:
add esi, type Array1

loop L1

INVOKE ExitProcess,0

main ENDP

END main