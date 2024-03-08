.text
.globl e_euler_entiere

e_euler_entiere:

 
push %ebp
mov %esp,%ebp
push %ebx

movl $1, %eax
movl $1, %ebx
movl $1, %ecx
movl $1, %edi
movl $10, %edx

approximation_e:
    mul %edi
    div %ebx
    incl %edi
    mul %edi
    cmp $10, %edi
    je end
    loop approximation_e

pop %ebx
pop %ebp
ret

#Q3.2.2
#On remarque qu'après 2 itérations, on a ajouté 1 deux fois '1',
#mais ensuite, on ajoute des valeurs inférieurs à '1', et puisqu'on
#travaille avec des nombre entiers, on ajoute en fait '0'. On remarque
#donc qu'après 2 itérations, en faire davantage ne change pas le résultat
#final, qui est '2'.