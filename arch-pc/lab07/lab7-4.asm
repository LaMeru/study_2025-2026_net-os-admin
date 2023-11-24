%include 'in_out.asm'
section .data
msg1 db 'Введите X: ',0h
msg2 db 'Введите A: ',0h
msg3 db "Значение функции: ",0h
section .bss
x resb 10
a resb 10
result resd 1
section .text
global _start
_start:

; ---------- Вывод сообщения 'Введите x: '
mov eax,msg1 ;в переменную пишем msg1
call sprint
; ---------- Ввод 'x'
mov ecx,x
mov edx,10
call sread

; ---------- Преобразование 'x' из символа в число
mov eax,x
call atoi ; Вызов подпрограммы перевода символа в число
mov [x],eax ; запись преобразованного числа в 'x'





; ---------- Вывод сообщения 'Введите a: '
mov eax, msg2
call sprint
; ---------- Ввод 'a'
mov ecx, a
mov edx,10
call sread

; ---------- Преобразование 'a' из символа в число
mov eax, a
call atoi ; Вызов подпрограммы перевода символа в число
mov [a], eax ; запись преобразованного числа в 'a'





; ---------- Сравниваем 'x' и 'a' (как символы)
mov eax, [x]
cmp eax, [a] ; Сравниваем 'x' и 'a'
jge make_X ; если 'x>a', то переход на 'fin',

mov eax, 5 ; иначе 'ecx = B'
call iprintLF
call quit

; ----------
make_X:
mov eax, [x]
sub eax, [a]
mov [result], eax

; ---------- Вывод результата
print_result:

mov eax, msg3
call sprint ; Вывод сообщения 'Наибольшее число: '

mov eax, [result]
call iprintLF ; Вывод 'max(A,B,C)'
call quit ; Выход
