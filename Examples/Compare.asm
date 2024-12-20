.ORIG x3000
    LD R1, NUM1         ;First number loaded in R1
    LD R2, Num2         ;Second number loaded in R2
    
    ; Compare R1 and R2
    Not R3, R2          ; Flip all bits (First step of twos compliment)
    ADD R3, R3, #1      ; Add 1 (Second part of twos compliment)
    ADD R3, R1, R3      ; R3 = R1 + (-R2)
    
    ; Condition codes are set based on R3:
    ; N is set if R1 < R2
    ; Z is set if R1 = R2
    ; P is set if R1 > R2
    
    BRp BIGGER
    BRz EQUAL
    BRn SMALLER

BIGGER
    LEA R0, MSG1        ; Loads message 1
    BRzp DONE
    
EQUAL
    LEA R0, MSG2        ; Loads message 2
    BRnzp DONE
    
SMALLER
    LEA R0, MSG3        ; Loads message 3

DONE
    HALT
    
NUM1 .FILL #10
NUM2 .FILL #5
MSG1 .STRINGZ "First is bigger"
MSG2 .STRINGZ "Numbers are equal"
MSG3 .STRINGZ "Second is bigger"
.END
