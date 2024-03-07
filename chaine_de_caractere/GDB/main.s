.data
strings:
.asciz "Allo Hi"
num:
.asciz "Allo\n"
den:
.asciz "Hi\n"



.text
.globl main

main: 
pushl %ebp
movl %esp,%ebp
pushl %ebx

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
movl $0, %edx     #ERREUR1
divl %ebx 
cmp $0x00, %eax 
ja e_d            #ERREUR2 
jmp e_n


e_n:
pushl $num
call printf
addl $4, %esp   #ERREUR 3
jmp bye

e_d:
pushl $den
call printf
addl $4, %esp   #ERREUR 4


bye:
popl %ebx
popl %ebp
ret
