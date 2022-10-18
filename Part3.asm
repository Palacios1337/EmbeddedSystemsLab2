;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------


main_loop:



	mov.w #0031h,R4 ; all of these sets values
	mov.w #0021h,R5
	mov.w #0001h,R6
	mov.w #0000h,R8
	mov.w #0AE0h,R9
	mov.w #0000h,R10

	and R6,R4 ; and R6 and R4 and stored in R4
	cmp R4,R6 ; compare if same
	jeq R4equaltoR5 ; if same then move on to jump else continues

	and R6,R5 ; and R6 and R5 and store in R5
	cmp R5,R6 ; compare if same
	jeq oneequaltoR6 ; if same then atleast one has LSB 1

	jmp $

R4equaltoR5:

	and R6,R5 ; and R6 and R5 and store into R5
	cmp R5,R6 ; compare if same
	jeq R5equaltoR6 ; if same then jump to the section of when both is equal to eachother
	jmp oneequaltoR6 ; else jump since atleast one register has LSB 1

R5equaltoR6:

	mov.w #0FF0h,R9 ; moves the value into R9 since both have LSB of 1
	jmp oneequaltoR6 ; jumps to atleast one having LSB of 1
	jmp $

oneequaltoR6:

	mov.w R9,R8 ; stores R9 value into R8
	inv R8 ; 1's comp of R8 which has R9 value
	mov.w R8,R10 ; moving R9 1's into R10
	jmp $





                                            

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
