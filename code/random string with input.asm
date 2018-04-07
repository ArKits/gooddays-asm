; Random String with Input

INCLUDE Irvine32.inc

.data

str1 BYTE "HOW LONG STRING YOU WANT??? "
randStrHere BYTE 80 DUP(?)
strLen DWORD ?

.code
    main PROC
        call Clrscr                 ; Clear screen

		mov edx, OFFSET str1	
		call WriteString		    ; Print string	
		call ReadInt                ; Input string length

		mov strLen, eax             ; Save string length

        mov esi, offset randStrHere     ; Set array
        mov ecx, 20                     ; Set counter
        L1:
            call RandoStringu           ; Call RSG
        Loop L1
        exit
    main ENDP

    RandoStringu PROC USES ecx   
        mov ecx, strLen
        L2:
            mov eax, 26             
            call RandomRange
            add eax, 65
            mov [esi], eax
            call WriteChar       
        loop L2       
        call Crlf
        ret
    RandoStringu ENDP

END main