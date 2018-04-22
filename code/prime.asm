; Prime Numbers from 5 to 1000

INCLUDE Irvine32.inc

.386

.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
prime_array DWORD 1000 DUP(?)
wow DWORD 0
NumOfFactors DWORD 0
checkMe DWORD 7

.code

main PROC

mov ecx, 100
mov eax, 5
mov esi, OFFSET prime_array 

L1:
mov checkMe, eax
push ecx

	mov ecx, checkMe
	dec ecx
	mov NumOfFactors, 0

	L2:
	xor edx, edx
	mov eax, checkMe
	div ecx

	.if edx == 0
	inc NumOfFactors
	.endif

	loop L2

	.if NumOfFactors == 1
	mov eax, checkMe
	mov wow, eax
	mov prime_array[esi + 4], eax
	.endif


pop ecx
inc eax
loop L1

INVOKE ExitProcess,0

main ENDP

END main