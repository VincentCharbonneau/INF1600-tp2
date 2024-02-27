.data
caisse:
.int 25, 10, 5, 1

formated_string25: .asciz "Le nombre de billets de 25$ est: %d\n"
formated_string10: .asciz "Le nombre de billets de 10$ est: %d\n"
formated_string5: .asciz "Le nombre de billets de 5$ est: %d\n"
formated_string1: .asciz "Le nombre de billets de 1$ est: %d\n"

amount: 
.int 1000

.text
.globl main
main :   
push %ebp
mov %esp,%ebp
push %ebx

movl amount, %eax
movl $0, %ebx

movl caisse(,%ebx,4), %ecx
movl $0, %edx
divl %ecx
pushl %edx
pushl %eax
pushl $formated_string25
call printf
addl $8, %esp
popl %eax

addl $1, %ebx

movl caisse(,%ebx,4), %ecx
movl $0, %edx
divl %ecx
pushl %edx
pushl %eax
pushl $formated_string10
call printf
addl $8, %esp
popl %eax

addl $1, %ebx

movl caisse(,%ebx,4), %ecx
movl $0, %edx
divl %ecx
pushl %edx
pushl %eax
pushl $formated_string5
call printf
addl $8, %esp
popl %eax

addl $1, %ebx

movl caisse(,%ebx,4), %ecx
movl $0, %edx
divl %ecx
pushl %edx
pushl %eax
pushl $formated_string1
call printf
addl $8, %esp
popl %eax

end:
popl %ebx
popl %ebp
ret
