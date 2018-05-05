; Prime Numbers from 5 to 1000

INCLUDE Irvine32.inc

.386

.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
prime_array DWORD 1000 DUP(0)			; Store primes
NumOfFactors DWORD 0					; Store number of factors
checkMe DWORD 0							; Store the number to check	

.code

main PROC

mov ecx, 1000							; Count till 1000 number	
mov eax, 1							; Start from 5
mov esi, OFFSET prime_array				; Offset array

L1:
mov checkMe, eax						; Set the number to check
push ecx								; Save counter

	mov ecx, checkMe					; Set counter to checking number
	mov NumOfFactors, 0					; Reset NumOfFactors

	L2:
	xor edx, edx
	mov eax, checkMe
	div ecx								; Divide checkMe by counter

	.if edx == 0						; If no remainder, increment NumOfFactors
	inc NumOfFactors
	.endif

	loop L2

	pop ecx								; Revert to original loop counter

	.if NumOfFactors == 2				
	mov eax, checkMe					; Add to array
	mov [esi + ecx * 4], eax 
	.endif

	inc eax
	loop L1

INVOKE ExitProcess,0

main ENDP

END main
