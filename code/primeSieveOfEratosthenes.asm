; Finds Prime Numbers using Sieve of Eratosthenes technique

INCLUDE Irvine32.inc

.386

.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
prime_array DWORD 1000 DUP(0)			; Store primes

.code

main PROC

mov ecx, 1000					; Counter till 1000					
mov eax, 1

init_array:					; Initaliazes array from 1 to 1000
mov esi, OFFSET prime_array				
mov [esi + eax * 4], eax 
inc eax
loop init_array

mov ecx, 1000					; Counter till 1000
mov eax, 2					; Start from 2, because we don't care about 1
	

L2:
	push ecx				; Save counter
	push eax				; Save eax

	mov ebx, eax				; We make the current number the number we want to check against
	mov ecx, 1000				; Counter till 1000		
	mov eax, 2				; Start from 2, because we don't care about 1

	L1:
	push eax				; Save eax
	push ebx				; Save ebx
	mul ebx					; Multiply eax * ebx
	cmp eax, 1000				; If multiple is greater than 1000
	jg next					; Skip it...
	mov ebx, 0				; Else make number 0
	mov [esi + eax * 4], ebx
	next:
	pop ebx
	pop eax
	inc eax
	loop L1

	pop eax
	pop ecx
	inc eax
loop L2

mov ecx, 1000							
mov eax, 1	
mov esi, OFFSET prime_array		

print_prime:					; Print the array
	push eax
	mov ebx, prime_array[eax*4]
	mov eax, ebx
	cmp eax, 0				; Skip the zeros
	je skip_print
	call WriteDec
	call crlf
	skip_print:
	pop eax
	inc eax
loop print_prime

INVOKE ExitProcess,0

main ENDP

END main
