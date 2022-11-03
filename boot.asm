[org 0x7c00]
[bits 16]

reset:
    mov bl, 0

start:
    mov ah, 0Bh
    mov bh, 00h 
    int 0x10

    call peg
    
    inc bl
    cmp bl, 16
    je reset
    jmp start

peg:
    mov ah, 0eh
    mov al, 'P'
    int 0x10
    mov al, 'E'
    int 0x10
    mov al, 'G'
    int 0x10
    int 0x10
    mov al, 'I'
    int 0x10
    mov al, 'N'
    int 0x10
    mov al, 'G'
    int 0x10
    mov al, ' '
    int 0x10
    ret

times 510-($-$$) db 0 ; Loop enough times so it fills the 510 bytes
db 0x55, 0xaa ; Magic ending bytes for a bootloader

