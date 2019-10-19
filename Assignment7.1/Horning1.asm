;Kevin Horning
;CSC 3210
;Assignment 7 Problem 1
;Solves equation var1 = (var2 + var3) * (var4 / var2) + (var3 * 3)
;using user input via terminal and stack accessing in a procedure

include irvine32.inc
.386
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	var1 sdword ?			;result
	var2 sdword ?
	var3 sdword ?
	var4 sdword ? 
.code
main proc
    lea eax, byte ptr var1
    call Clrscr				;clears terminal
	call ReadInt			;reads and stores 3 inputs
	mov var2, eax 
	call ReadInt
	mov var3, eax
	call ReadInt
	mov var4, eax

	call IntegerArithmeticProc
	mov var1, eax			;moves result to answer
	call WriteInt			;writes eax to terminal

;invoke ExitProcess,0
main endp

;Procedure Documentation:
;solves equation var1 = (var2 + var3) * (var4 / var2) + (var3 * 3)
;requires var2, var3, and var4 be storeed in data already
;returns answer in eax
IntegerArithmeticProc proc
    push ebp		   ;saving base pointer
    mov ebp, esp
	sub ebp, 12
	push var4	       ;pushing variables into stack
	push var3
	push var2
	   
	mov eax, [ebp + 4] ;last parenthesis(2 operand format)
	mov ebx, 3
	imul eax, ebx
	push eax

	mov eax, [ebp + 8] ;second parenthesis
	mov ebx, [ebp]
	mov edx, 0
	idiv ebx
	push eax

	mov eax, [ebp]     ;first parenthesis
	mov ebx, [ebp + 4]
	add eax, ebx
	push eax

	pop eax            ;after parenthesis
	pop ebx
	imul ebx
	pop ecx
	add eax, ecx
		
	add esp, 16		   ;stack and base pointer fixing
	mov ebp, esp
	ret
IntegerArithmeticProc endp

end main