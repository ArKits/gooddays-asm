; Salary program
; Takes input of user_id and returns current salary and increased salary.
; Handles invalid input.

INCLUDE Irvine32.inc

.data
user_id dword 0001, 0002, 0003, 0004, 0005, 0006, 0007
salary dword 1000, 2000, 3000, 4000, 5000, 6000, 7000

id_prompt byte "Enter your ID: ", 0
increased_prompt byte "Your increased salary is: ", 0
salary_prompt byte "Your salary is: ", 0
invalid_prompt byte "Invalid ID! Please enter your ID again! ", 0

.code
main PROC

	mov edx, OFFSET id_prompt
	call WriteString
	jmp L2

	re_input:
	mov edx, OFFSET invalid_prompt
	call WriteString

	L2:
	call readdec

	mov ecx, lengthof user_id
	mov esi, 0

	L1:
	cmp eax, user_id[esi*type dword]
	je find_it
	inc esi
	loop esi

	loop L1
	jmp re_input
	find_it:
	mov edx, OFFSET salary_prompt
	call WriteString
	mov eax, salary[esi*type dword]
	call WriteDec

	mov edx, OFFSET increased_prompt
	call WriteString

	mov ebx, 108
	mul ebx
	mov edx, 0
	mov ebx, 100
	div ebx, 100
	div ebx
	call WriteDec

	exit

main ENDP

END main