; Compare R1 and R2
; 0 in R0 if R1 == R2
; 1 in R0 if R1 > R2
; -1 in R0 if R1 < R2

.ORIG x3000
    AND R0, R0, #0      ; Clear R0
    
    ; Subtract R2 from R1 to compare them
    NOT R2, R2
    ADD R2, R2, #1
    ADD R1, R1, R2
    
    ; Branch based on condition codes
    BRn #2
    BRp #3
    BRnzp #3
    
    ADD R0, R0, #-1
    BRnzp #1
    
    ADD R0, R0, #1

.END
