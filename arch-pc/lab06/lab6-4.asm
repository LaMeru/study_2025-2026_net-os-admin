%include 'in_out.asm'

SECTION .data
msg: DB 'Введите x: ',0
rem: DB 'Результат: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:

mov eax, msg
call sprintLF

mov ecx, x
mov edx, 80
call sread

mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, `eax=x`

xor ebx,ebx
mov ebx,eax
mul ebx
mul ebx
xor edx,edx
mov ebx,3
div ebx
add eax,21

mov edi, eax

mov eax,rem
call sprint
mov eax,edi
call iprintLF

call quit