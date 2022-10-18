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



	mov.w #0031h,R4
	mov.w #0021h,R5
	mov.w #0001h,R6
	mov.w #0000h,R8
	mov.w #0AE0h,R9
	mov.w #0000h,R10

	and R6,R4
	cmp R4,R6
	jeq R4equaltoR5

	and R6,R5
	cmp R5,R6
	jeq oneequaltoR6

	jmp $

R4equaltoR5:

	and R6,R5
	cmp R5,R6
	jeq R5equaltoR6
	jmp oneequaltoR6

R5equaltoR6:

	mov.w #0FF0h,R9
	jmp oneequaltoR6
	jmp $

oneequaltoR6:

	mov.w R9,R8
	inv R8
	mov.w R8,R10
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
            
