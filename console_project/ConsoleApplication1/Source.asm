.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
;Mynum byte 40 dup(1)

Mynum byte 1,0,1,0,1,0,1,0,1,0,1,0,1

answer byte ?

.code
main proc

mov esi, offset Mynum
mov eax, 0
mov al, [esi] 

mov ecx, 40

L1:
add al, [esi + 2]
mov answer, al
loop L1

invoke ExitProcess,0

main endp
end main