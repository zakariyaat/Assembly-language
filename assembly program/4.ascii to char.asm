.model small
.stack 100
.data 

a db 65
.code

main proc 
    mov ax,@data
    mov ds,ax 
  
    mov ah,2
    mov dl,a
    int 21h
  
    exit:
    mov ah,4ch
    int 21h
    main endp
end main