;Kevin Horning
;CSC 3210
;Assignment 5 Problem 1
;Defines two 64-bit values and finds the sum of all of
;their DWORDS and explains validity of result 

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	val1 QWORD 0506030704080102h
	val2 QWORD 1122334455667788h
.code
main proc


	mov eax, DWORD PTR val1			;lower half of val1
	mov ebx, DWORD PTR val1 + 4		;upper half of val1
	mov ecx, DWORD PTR val2			;lower half of val2
	mov edx, DWORD PTR val2 + 4		;upper half of val2

	add eax, ecx					;adds 2 lower halves
	add ebx, edx					;adds 2 upper halves
	add eax, ebx					;adds the sums for grand total

;for the task of finding the sum of all the DWORDS in the 
;given QWORDS, the result (stored in eax), is valid

	invoke ExitProcess,0
main endp
end main