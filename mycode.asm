.model small 
                       
.data
   
   topic db 10, 13, "Traversal in 8-Bit and 16-Bit Registers$"
   
   subtopic1 db 10, 13, 10, 13, "8-Bit Register: $"
   label1 db 10, 13, "Value in DL: $"   
   
   subtopic2 db 10, 13, 10, 13, "16-Bit Register: $"
   label2 db 10, 13, "Value in DX: $"
   
   val1 db ?
   val2 dw ?
 
.code           

main proc far 
    
   mov ax, @data
   mov ds, ax
   
   lea dx, topic        ; print 'topic'
   mov ah, 09h
   int 21h
   
   lea dx, subtopic1    ; print 'subtopic1'
   mov ah, 09h
   int 21h
   
   TransferEightBit:    ; 8-bit registers
   
   mov val1, 6          ; store 6 to 'val1' 
   add val1, 48         ; add 48 to 'val1'
   
   mov al, val1         ; copy 'val1' to al
   
   mov bl, al           ; copy 'al' to 'bl'
   
   mov cl, bl           ; copy 'bl' to 'cl'
   
   lea dx, label1       ; print 'label1'
   mov ah, 09h
   int 21h 
   
   mov dl, cl           ; copy 'cl' to 'dl'
   
   mov ah, 02h          ; print dl (value)
   int 21h
   
   lea dx, subtopic2    ; print 'subtopic2'
   mov ah, 09h
   int 21h
   
   TransferSixteenBit:  ; 16-bit registers
   
   mov val2, 9          ; store 10 to 'val2' 
   add val2, 48         ; add 48 to 'val2'
   
   mov ax, val2         ; copy 'val2' to ax
   
   mov bx, ax           ; copy 'ax' to 'bx'
   
   mov cx, bx           ; copy 'bx' to 'cx'
   
   lea dx, label2       ; print 'label2'
   mov ah, 09h
   int 21h 
   
   mov dx, cx           ; copy 'cx' to 'dx'
   
   mov ah, 02h          ; print dx (value)
   int 21h  
    
   mov ah, 4ch      ; end program
   int 21h
      
    
endp    

end main