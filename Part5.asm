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

	mov.w #0005h,R4 ; values given
	mov.w #0007h,R5 ; values given

Main_Block: ; main block

	cmp.w R5,R4 ; comparing R4 with R5

	jeq Main_Block ; if equal then foreverloop
	jge R4Greater ; if R4 greater than jumps to greater section
	jl R4Less l; if less than then jumps to less section

R4Greater:
	call #greater_function ; calls sub function
	jmp Main_Block ; jumps back to main

R4Less:
	call #less_function ; calls sub function
	jmp Main_Block ; jumps back to main

less_function:
	mov.w #000Ah, &2000h ; moves 10-6 in each memory location
	mov.w #0009h, &2002h
	mov.w #0008h, &2004h
	mov.w #0007h, &2006h
	mov.w #0006h, &2008h

	add.w #0001h,R4 ; adds 1 to R4
	jmp Main_Block ; jumps back to main block


greater_function:
	mov.w #0001h, &2000h ; moves 1-5 into each memory location
	mov.w #0002h, &2002h
	mov.w #0003h, &2004h
	mov.w #0004h, &2006h
	mov.w #0005h, &2008h

	sub.w #0001h,R4 ; subtracts 1 from R4
	jmp Main_Block ;jumps back to main block

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
            
