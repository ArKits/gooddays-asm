INCLUDE Irvine32.inc

.data
gpa_400 = 400
gpa_350 = 350
gpa_250 = 250

credit_24 = 24
credit_16 = 16
credit_12 = 12

gpa_prompt byte 'What is your GPA: ',0
credit_prompt byte 'What is your credit: ',0

gpa_invalid byte 'GPA is invalid! please reinput: ',0
credit_invalid byte 'Credit is invalid! please reinput: ',0

unit_24 byte 'For GPA between 350 to 400, you can take max 24 units.',0
unit_16 byte 'For GPA between 250 to 350, you can take max 16 units.',0

unit_12 byte 'You can take max 12 units.',0
fail_str byte 'Sorry, failed!',0
succ_str byte 'YOU MAY REGISTER!',0

number_gpa dword ?
number_credit dword ?
numOfTrysGpa dword 0
numOfTrysCredit dword 0

.code
main PROC

	mov ecx, 3

	L1:
	call input_gpa
	cmp number_gpa, 0
	je quit_this

	call input_credit
	cmp number_credit, 0
	je quit_this

	mov eax, number_gpa
	mov ebx, number_credit
	
	cmp ax, gpa_350 ;350
	ja r1      
	cmp ax, gpa_250 ; 250
	ja r2   
	

	cmp ebx, credit_12 ; max 12
	jbe L_ok
	mov edx, offset unit_12
	jmp error	
	r1:
	cmp ebx, credit_24 ; max24
	jbe L_ok
	mov edx, offset unit_24
	jmp error
	r2:
	cmp ebx, credit_16 ; max16
	jbe L_ok
	mov edx, offset unit_16

	error:
	call writestring
	call crlf
	loop L1
	mov edx, offset fail_str
	jmp quit
	L_ok:
	mov edx, offset succ_str

	quit:
	call writestring
	call crlf

	quit_this:
	mov eax, 1

	exit
main ENDP

input_gpa proc
	mov edx, offset gpa_prompt
	call writestring
	L1:
	call readint
	cmp eax, 0
	jle error
	cmp eax, gpa_400 ;400
	jl L1_exit

	error:
	inc numOfTrysGpa
	cmp numOfTrysGpa, 3
	jge quit
	call crlf
	mov edx, offset gpa_invalid
	call writestring
	jmp L1

	L1_exit:
	mov number_gpa, eax
	ret

	quit:
	mov number_gpa, 0
	ret
input_gpa endp

input_credit proc
	mov edx, offset credit_prompt
	call writestring
	L1:
	call readint
	cmp eax, 0
	jle error
	cmp eax, credit_24 ; 24
	jle L1_exit

	error:
	inc numOfTrysCredit
	cmp numOfTrysCredit, 1
	jge quit
	call crlf
	mov edx, offset credit_invalid
	call writestring
	jmp L1
	L1_exit:
	mov number_credit, eax
	ret

	quit:
	mov number_gpa, 0
	ret


	ret
input_credit endp

END main
