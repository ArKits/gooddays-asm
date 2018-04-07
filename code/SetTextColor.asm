; Print a string with SetTextColor

INCLUDE Irvine32.inc

.386

.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
str1 BYTE "Arrey isko hata re" 

.code

main PROC
    mov eax , yellow + (blue * 16)      ; Set blue foreground and yellow text-color
    call SetTextColor                   
    mov edx, OFFSET str1
    call WriteString                    ; Print string
    call Crlf                           ; Newline
    
    INVOKE ExitProcess,0
main ENDP

END main