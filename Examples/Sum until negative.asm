.ORIG x3000
    AND R2, R2, #0      ; Use R2 as sum register and clear it
    LEA R1, NUMBERS     ; Load address of first number
    
LOOP
    LDR R3, R1, #0      ; Load number at current address
    ADD R4, R3, #0
    BRn DONE
    
    ADD R2, R2, R3      ; Add current number to sum
    
    ADD R1, R1, #1      ; Point to next number
    BRnzp LOOP          ; Continue loop
                        
DONE
    ST R2, RESULT       ; Store final sum
    HALT


NUMBERS .FILL #5        ; First number
        .FILL #3        ; Second number
        .FILL #7        ; Third number
        .FILL #-1       ; Stop when we hit this
        
RESULT .BLKW 1          ; Space for result
.END
