;Kevin Horning
;CSC 3210
;Assignment 7 Problem 2
;Evaluates the factorial of a number inputted from terminal

include irvine32.inc
.386
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	call ReadDec		;puts number inputted from terminal in eax
	push eax			
	call Factorial		
	call WriteDec		;writes eax to terminal

invoke ExitProcess,0
main endp

;Procedure Documentation:
;evaluates the factorial of a number
;requires a number pushed to stack
;returns the factorial in eax
Factorial proc
	push ebp			;saves base pointer
	mov ebp, esp
	mov eax, [ebp + 8]	;moves number to eax
	cmp eax, 0			
	ja Not0				;if eax is not 0, jump to Not0
	mov eax, 1			;else, eax(result) is 1
	jmp L1
	
	Not0: 
	dec eax				
	push eax			;pushes number - 1
	call Factorial		
	mov ebx, [ebp + 8]	;after repeats, number at beginning
	mul ebx				;of procedure is multiplied to result
	L1:
	pop ebp				;fixes ebp
	ret 4		
Factorial endp
end main