TITLE Prin stars in a sequence 

;if rows = 5, then output will be:
;--------------------------------------------;
;			*       *	                     ;
;			 *     *                         ;
;			  *   *	                         ;
;			   * *                           ;
;			    *                            ;
;--------------------------------------------;

include irvine32.inc


.data
	
	msg BYTE "Enter rows: ", 0

	rows DWORD ?
	in_spaces DWORD ?
	out_spaces DWORD 0

	spaces DWORD " ", 0
	stars DWORD "*", 0

	ecx_temp DWORD 0

.code
main PROC

	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx



	mov edx, OFFSET msg
	call ReadInt
	mov rows, eax

	add eax, 2
	mov in_spaces, eax


	mov ecx, rows
	l1:
		mov ecx_temp, ecx
		call PrintStar
		mov ecx, ecx_temp
		
	loop l1


    exit
main ENDP

;--------------------PrintStar PROCEDURE STARTS
PrintStar PROC


		mov ecx, out_spaces
		cmp ecx, 0
		je print_one
		
		l2:
			mov edx, OFFSET spaces
			call WriteString
		loop l2
		jmp skip_l2


		print_one:
			mov edx, OFFSET spaces
			call WriteString
		

		skip_l2:
		mov edx, OFFSET stars			;print stars
		call WriteString


		mov ecx, in_spaces				;print inner spaces
		l3:
			mov edx, OFFSET spaces
			call WriteString
		loop l3


		mov edx, OFFSET stars			;print stars
		call WriteString


;------------------------------------------------------------------------OUTER SPACES
		mov ecx, out_spaces
		cmp ecx, 0
		je print_one_row
		
		l4:
			mov edx, OFFSET spaces
			call WriteString
		loop l4
		jmp skip_l4

		print_one_row:
			mov edx, OFFSET spaces
			call WriteString

		skip_l4:
;------------------------------------------------------------------------

		mov eax, in_spaces			;decrement inner spaces
		sub eax, 2
		mov in_spaces, eax

		mov eax, out_spaces			;increment outer spaces
		add eax, 1
		mov out_spaces, eax


		call crlf

	ret
PrintStar ENDP
;--------------------PrinStar PROCEDURE ENDS

end main

