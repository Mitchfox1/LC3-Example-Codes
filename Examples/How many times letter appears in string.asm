LEA R1, STRING    ; R1 = address of first character
        AND R2, R2, #0    ; R2 = 0 (initialize our counter)
LOOP    LDR R3, R1, #0    ; R3 = current character
        ADD R4, R3, #0    ; Check if character is x0000
        BRz DONE          ; If x0000, string is done
        ADD R4, R3, #-108 ; Subtract ASCII 'l' from character
        BRnp NEXT         ; If not 'l', skip increment
        ADD R2, R2, #1    ; Found an 'l', increment counter
NEXT    ADD R1, R1, #1    ; Move to next character
        BR LOOP           ; Repeat for next character
DONE    HALT
STRING  .STRINGZ "Hello World!"  ; Our test string
