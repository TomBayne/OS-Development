; This is the smallest possible OS. It simply loads and moves the number 0xCAFEBABE into the eax register and loops.
; We can't write this in C because we don't have stack yet.

global loader      ; This is the entry symbol for ELF

MAGIC_NUMBER equ 0x1BADB002 ; The magic number constant
FLAGS         equ 0x0 ; multiboot flags
CHECKSUM     equ -MAGIC_NUMBER ; Calculate the checksum (magic number + checksum + flags should equal 0)

section .text: ; start of the text (code) section
align 4 ; the code must be 4 byte aligned
    dd MAGIC_NUMBER ; Write the magic number to machine code
    dd FLAGS ; and the flags
    dd CHECKSUM ; and the checksum.

loader: ; the loader label (defined as entry point in linker)
    mov eax, 0xCAFEBABE ; Move the number 0xCAFEBABE into the eax register.
.loop:
    jmp .loop ; loop forever.