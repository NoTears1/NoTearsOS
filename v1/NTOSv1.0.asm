; NoTear-os
; TAB=4

; 标准FAT12格式软盘专用代码

    DB  0xeb, 0x4e, 0x90
    DB  "HINOTEAR"      ; 启动区名称（任意8字节字符串）
    DW  512             ; 每个扇区的大小（必须为512B）
    DB  1
    DW  1               ; FAT的起始位置（一般从第一个扇区开始）
    DB  2               ; FAT的个数（必须为2）
    DW  224             ; 根目录的大小（一般为224）
    DW  2880            ; 该磁盘的大小（必须是2880扇区）
    DB  0xf0            ; 磁盘的种类（必须是0xf0）
    DW  9               ; FAT的长度（必须是9扇区）
    DW  18              ; 1个磁道有几个扇区（必须是18）
    DW  2               ; 磁头数
    DD  0               ; 不使用分区，必须是0
    DD  2880            ; 重写一次磁盘大小
    DB  0, 0, 0x29      ; 意义不明，固定
    DD  0xffffffff      ; (可能是）卷标号码
    DB  "HELLONOTEAR"   ; 磁盘的名称（11字节）
    DB  "FAT12   "      ; 磁盘格式名称（8字节）
    RESB 18

; 程序主体

    DB 0xb8, 0x00, 0x00, 0x8e, 0xd0, 0xbc, 0x00, 0x7c
    DB 0x8e, 0xd8, 0x8e, 0xc0, 0xbe, 0x73, 0x7c, 0x8a
    DB 0x04, 0x83, 0xc6, 0x01, 0x3c, 0x00, 0x74, 0x09
    DB 0xb4, 0x0e, 0xbb, 0x0f, 0x00, 0xcd, 0x10, 0xeb
    DB 0xee, 0xf4, 0xeb, 0xfd

; 信息显示部分

    DB 0x0a, 0x0a       ; 2个换行
    DB "Hello, world!"
    DB 0x0a             ; 换行
    DB 0

    RESB 0x1fe-($-$$)        ; 填写到0x00, 直到0x001fe
    DB 0x55, 0xaa

; 以下是启动区以外部分的输出

    DB 0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
    RESB 4600
    DB 0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
    RESB 1469432