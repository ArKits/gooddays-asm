; Color Matrix
; Prints letters in a square with different colors

INCLUDE Irvine32.inc

.data
str1 BYTE "WOW THIS IS COOL!", 0

.code

main PROC
		mov ecx, 10						; Set loop counter
		mov eax, 10						; Set starting colour
		push ecx
		L1:
				call SetTextColor			; Set colour
				push ecx 
				mov ecx, 10
				L2:
					
					call SetTextColor		; Set colour
					mov edx, OFFSET str1		; Setup printing
					call WriteString		; Print String
					call Crlf			; Newline
					inc eax				; Increment to next colour
				loop L2
				pop ecx
		loop L1

       INVOKE ExitProcess,0

main ENDP

END main
