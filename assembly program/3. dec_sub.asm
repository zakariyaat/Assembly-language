.model small
.stack 100h
.code

main proc
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,1
    int 21h
    mov bh,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    sub bl,bh   ;bl = bl-bh
    
    mov ah,2
    add bl,48
    mov dl,bl
    ;sub dl,48   ;show output
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main