    org     07c00h              ; 告诉编译器程序加载到 7c00 处
    mov     ax, cs              ; ds, es 与 cs 代码段相同
    mov     ds, ax
    mov     es, ax
    call    DispStr             ; 调用显示字符串的子程序
    jmp     $                   ; 无限循环
DispStr:
    mov     ax, BootMessage
    mov     bp, ax              ; ES:BP = 字符串地址
    mov     cx, 16              ; CX = 字符串长度
    mov     ax, 1301h           ; AH = 13; AL = 01H
    mov     bx, 000ch           ; 页号为0(BH = 0)，红底黑字(BL = 0Ch，高亮)
    mov     dl, 0
    int     10h                 ; 10h 号中断
    ret
BootMessage:        db  "Hello, OS world!"
times   510-($-$$)  db  0       ; 填充剩下的空间，使生成的二进制代码恰好为 512 字节
dw      0xaa55                  ; 结束标志
