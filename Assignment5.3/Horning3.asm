;Kevin Horning
;CSC 3210
;Assignment 5 Problem 3
;Practice with nested loops, adds the two counters
;and stores the sum in a list for every iteration

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	firstCounter WORD ?
	listIndex WORD 0
	sumList WORD 50 DUP(?)
.code
main proc					
	mov ecx, 4						;moves first counter to ecx
	L1:
		mov firstCounter, cx		;saves first counter
		mov ecx, 5					;changes ecx to second counter
		L2: 
			mov ax, firstCounter
			add ax, cx				;adds 2 counters

			mov bx, listIndex		;offset of list index
			mov [sumList + bx], ax	;moves sum to index
			add listIndex, 2		;increases index
			Loop L2
		mov cx, firstCounter		;restores first counter to ecx
		Loop L1

	invoke ExitProcess,0
main endp
end main