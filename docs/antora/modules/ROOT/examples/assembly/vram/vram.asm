; 在屏幕上显示字符 A
; 文本模式下的显存：
; 物理地址：B8000 ~ BFFFF，逻辑地址：B800:0000 ~ B800:7FFF
; 编译：nasm vram.asm -o vram.bin -l vram.lst

start:
    mov ax, 0xb800
    mov ds, ax
    ;mov ds, 0xb800 不存在该指令

    mov byte [0x00], 0x41 ;字符 A 的 ASCII 码
    mov byte [0x01], 0x04 ;黑底红字
    mov byte [0x02], 0x41
    mov byte [0x03], 0x04
    mov byte [0x04], 0x41
    mov byte [0x05], 0x04
    jmp 0x0000:0x7c00

current:
    times 510 - (current-start) db 0
    db 0x55, 0xaa
