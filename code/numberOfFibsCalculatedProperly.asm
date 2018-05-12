INCLUDE Irvine32.inc

.data
arr DWORD 100 DUP(0)
number_str BYTE "Number of correct fibs is:",0
correct_str BYTE "Number of correct fibs is:" ,0
carry1 DWORD 0

.code 
main PROC
mov arr, 1
mov [arr+TYPE arr],1
mov esi, OFFSET arr
mov ebx, 1
mov ecx, 100
 
L1:
mov eax,[esi]
mov carry1, eax
add esi, TYPE arr
add eax, [esi]
mov [esi+TYPE arr], eax
add carry1, eax
jc skip
inc ebx
skip:
loop L1 

mov edx, OFFSET correct_str
call WriteString
mov eax, ebx
call WriteDec
call crlf

INVOKE ExitProcess, 0
main ENDP
END main
