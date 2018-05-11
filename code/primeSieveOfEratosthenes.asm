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

mov ecx, 1000							
mov eax, 1	

init_array:
mov esi, OFFSET prime_array				
mov [esi + eax * 4], eax 
inc eax
loop init_array

mov ecx, 1000	
mov eax, 2	
	

L2:
	push ecx
	push eax

	mov ebx, eax
	mov ecx, 1000							
	mov eax, 2	

	L1:
	push eax
	push ebx
	mul ebx
	cmp eax, 1000
	jg next
	mov ebx, 0
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

print_prime:
	push eax
	mov ebx, prime_array[eax*4]
	mov eax, ebx
	cmp eax, 0
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