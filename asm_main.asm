;
; file: asm_main.asm
; description: this function will do the following.
; 	1.   provide a function that will take 3 parameters:
;		The base address of a word (16 bit) array
; 		The length of the array
; 		An integer -- a scalar
;The function will iterate over the array and will multiply the scalar by each element in the array.  Each element of the array will then be changed to the scalar multiple.
; author:Natsuki Nagaya
; email: natsukn8988@student.vvc.edu
; date: 11/7/2019

%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data
        syswrite: equ 4
        stdout: equ 1
        exit: equ 1
        SUCCESS: equ 0
        kernelcall: equ 80h

; define array of 10 words initialized to 1,2,3,...,10
a1	 dd	 1 ,2, 3, 4, 5, 6, 7, 8, 9, 10	  ;  array of words
Message1 db	"Enter an integer(a scalar): ", 0
Message2 db	"The result would be ", 0
Message3 db	", ", 0


; uninitialized data is put in the .bss segment
;
segment .bss

scalar	resd 1


;
; code is put in the .text segment
;
segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
; *********** Start  Assignment Code *******************
	mov     eax,a1
        push    eax
        mov     eax,10
        push    eax
        mov     eax,5
        push    eax
        call    scalar_mult
        add     esp,12

	popa
        mov     eax, 0            ; return back to C
        leave
        ret

scalar_mult:
        enter   0,0               ;setup routine
        pusha 

	mov	eax, Message1
	call	print_string
	call	read_int
	mov	[scalar], eax

	mov	eax, [a1]		  ; al = a1[0] +4 goes to the next number
	imul	eax, [scalar]	  		  ; ebx =  eax*scalar
	mov	[a1], eax

	mov     eax, [a1+4]  
        imul    eax, [scalar]
        mov     [a1+4], eax

	mov     eax, [a1+8]  
        imul    eax, [scalar]
        mov     [a1+8], eax

	mov     eax, [a1+12]
        imul    eax, [scalar]
        mov     [a1+12], eax

	mov     eax, [a1+16] 
        imul    eax, [scalar]
        mov     [a1+16], eax

	mov     eax, [a1+20] 
        imul    eax, [scalar]
        mov     [a1+20], eax

        mov     eax, [a1+24]
        imul    eax, [scalar]
        mov     [a1+24], eax

        mov     eax, [a1+28]
        imul    eax, [scalar]
        mov     [a1+28], eax

        mov     eax, [a1+32]
        imul    eax, [scalar]
        mov     [a1+32], eax

        mov     eax, [a1+36]
        imul    eax, [scalar]
        mov     [a1+36], eax

	mov	eax, Message2
	call	print_string

	mov	eax, [a1]
	call	print_int
	mov	eax, Message3
	call	print_string
	
	mov     eax, [a1+4]
        call    print_int
        mov     eax, Message3
        call    print_string

	mov     eax, [a1+8]
        call    print_int
        mov     eax, Message3
        call    print_string

	mov     eax, [a1+12]
        call    print_int
        mov     eax, Message3
        call    print_string

	mov     eax, [a1+16]
        call    print_int
	mov     eax, Message3
        call    print_string
	
	mov     eax, [a1+20]
        call    print_int
        mov     eax, Message3
        call    print_string

        mov     eax, [a1+24]
        call    print_int
        mov     eax, Message3
        call    print_string

        mov     eax, [a1+28]
        call    print_int
        mov     eax, Message3
        call    print_string

        mov     eax, [a1+32]
        call    print_int
        mov     eax, Message3
        call    print_string

        mov     eax, [a1+36]
        call    print_int

	call	print_nl
; *********** End Assignment Code **********************

        popa
        mov     eax, SUCCESS       ; return back to the C program
        leave                     
        ret


