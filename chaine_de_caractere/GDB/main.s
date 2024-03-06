.data
strings:
.asciz "Allo Hi"
num:
.asciz "Allo\n"
den:
.asciz "Hi\n"
.text
.globl main


main : 
push %ebp
mov %esp,%ebp
push %ebx

mask:
xor %eax, %eax          
xor %ecx, %ecx
xor %ebx, %ebx

setup:
movl $strings, %esi     

n_c:
lodsb                  

d:              
cmp $0x20, %al
je n_c2
cmp $0x41, %al
jb n_c2
cmp $0x5A, %al
jb a
cmp $0x61, %al
jb n_c2
cmp $0x7A, %al 
jbe a

a:       
addl %eax, %ecx
jmp n_c

n_c2:
lodsb

d2:
cmp $0,%al
jz r
cmp $0x41, %al
jb n_c2
cmp $0x5A, %al
jb a_2
cmp $0x61, %al
jb n_c2
cmp $0x7A, %al 
jbe a_2

a_2:
addl %eax, %ebx
jmp n_c2

r:
movl %ecx, %eax

movl $0, %edx
divl %ebx
test %eax, %eax
jnz e_d
cmp $0x00, %eax 
je e_d              
jmp e_n
             

e_n:
push $num
call printf
addl $8, %esp
jmp bye

e_d:
push $den
call printf
addl $8, %esp
jmp bye

bye:
popl %ebx
popl %ebp
ret
