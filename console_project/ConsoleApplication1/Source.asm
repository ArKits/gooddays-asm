INCLUDE Irvine32.inc


.data
charVal    BYTE 'A'

rowCol LABEL WORD
column BYTE 0
row    BYTE 0

.code
main PROC

mov  ecx,10	; loop 6 times

L0:	push ecx		; save loop counter
	mov  rowCol,0	; initialize row/column variable
	mov  dx,0		; set cursor at 0,0
	call Gotoxy

	mov  eax,0		; starting color: black on black
	mov  ecx,2		; 16 possible background colors

L1:	push ecx		; save loop counter
	mov  dx,rowCol	; get ready for a new row
	call Gotoxy
	mov  ecx,2		; 16 possible foreground colors

L2:	call SetTextColor	; set the color
	push eax
	mov  al,charVal		; character to be displayed
	call WriteChar		; write it to the console
	pop  eax
	inc  al			; next foreground color
	loop L2			; finished with the row

; The first time this line is reached, the color byte equals 10h,
; which gives us the next background color (and resets the foreground
; to black)

	inc  row	; go to next row
	pop  ecx	; restore loop counter
	loop L1

	mov  eax, 1000 ; delay for a while
	call Delay
	inc  charVal	; next character
	pop  ecx	; restore loop counter
	loop L0	; go to next character

	mov  eax,lightGray	; restore screen to normal color
	call SetTextColor

	exit
main ENDP
END main