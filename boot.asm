[org 0x7c00]
mov bx, startUp

printStartup:
    mov ah,0x0e
    mov al,[bx]

    cmp al,0 ; null character
    je loadSeparator
    int 0x10
    inc bx
    jmp printStartup

loadSeparator:
    mov bx,separator

printSeparator:
    mov ah, 0x0e
    mov al,[bx]

    cmp al,0
    je readkb
    int 0x10
    inc bx
    jmp printSeparator

readkb: ; read and print char
    mov ah,0
    int 0x16

    mov ah,0x0e
    int 0x10

    jmp compareCommands

compareCommands:
    cmp al,'i'
    je loadInfo
    jmp readkb

exit:
    jmp $

loadInfo:
    mov bx,infoText

printInfo:
    mov ah,0x0e
    mov al,[bx]

    cmp al,0 ; null character
    je readkb
    int 0x10
    inc bx
    jmp printInfo

infoText:
    db "version 0.1",0Dh,0Ah,0

startUp:
    db "XkOS loaded :3",0Dh,0Ah,0 
separator:
    db 176,176,176,176,176,176,176,176,176,176,0Dh,0Ah,0

times 510-($-$$) db 0
db 0x55,0xaa