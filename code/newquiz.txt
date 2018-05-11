; Write an assembly program that finds the numbers that are between 100 and 1000 or less than -100 
; and odd, and it writes them on the console in yellow fonts with a green background.

INCLUDE Irvine32.inc

.data
;Arrary1 dword 40 dup(?)
Array1 dword -111 , 150, 2000

.code
main PROC

	mov ecx,  lengthof  Array1
	mov esi, offset Array1

	; Set Text Color
	mov eax, green*16 + yellow
	call SetTextColor

	L1:

	; Between 100 and 1000
	cmp dword ptr [esi] , 1000
	jge next      
	cmp dword ptr [esi] , 100    
	jg write_value
	
	; Less than -100 and Odd
	cmp dword ptr [esi] , -100
	jge next     
	test dword ptr [esi] , 1
	jz next         
	
	write_value:
	; Printing
	mov eax, [esi]
	call WriteInt
	call crlf

	next:
	; Go next
	add esi, type dword

	loop  L1

	exit
main ENDP

END main