;Kevin Horning
;CSC 3210
;Assignment 5 Problem 2
;Uses loop and indirect addressing to reverse elements 
;in an list in place

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	list WORD 2,1,4,3,6,5,8,7
.code
main proc
	mov ecx, LENGTHOF list
	L1:
		mov eax, 0				;gives new index (edx)
		mov ax, TYPE list
		mov ebx, LENGTHOF list
		sub ebx, ecx
		mul ebx
		mov edx, eax

		mov ax, list[edx]		;makes ax and bx the next 2 elements
		add dl, TYPE list		
		mov bx, list[edx]	
		XCHG ax, bx				
					
		mov list[edx], bx		;switches the two elements in the list
		sub dl, TYPE list
		mov list[edx], ax

		dec cl					;makes counter to decrease by 2 (2 elements)
		LOOP L1	

	mov ax, list[0]				;testing
	mov bx, list[2]
	mov cx, list[4]
	mov dx, list[6]

	invoke ExitProcess,0
main endp
end main