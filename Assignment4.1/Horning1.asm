;Kevin Horning
;CSC 3210
;Assignment 4 Problem 1
;Calculates the expression EDX = -val2 + 7 - (-val3 + val1)
;for given variable values and types

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data 
	val1 WORD 20
	val2 SWORD 17
	val3 SWORD 3
.code
main proc
    mov eax, 0
	mov ebx, 0
	neg val2	
	add val2, 7	
	mov ax, val2
	neg val3
	mov bx, val3
	add bx, val1
	sub ax, bx

	invoke ExitProcess,0
main endp
end main
