.text
.globl e_euler_entiere

e_euler_entiere:
push %ebp
mov %esp, %ebp
push %ebx
mov 8(%ebp), %ecx  #nombre iterations

mov $1, %eax       #numerateur
mov $1, %ebx       #denominateur
mov $0, %edx       #somme
mov $0, %edi       #compteur

iteration0:        #pour 1/0!
    cmp $0, %ecx
    jz end
    add $1, %edx
    dec %ecx
    jz end

approximation_e:
    inc %edi
    mov %ebx, %eax
    push %edx
    mull %edi
    pop %edx
    mov %eax, %ebx
    mov $1, %eax
    push %edx
    xor %edx, %edx
    div %ebx
    pop %edx
    add %eax, %edx
    loop approximation_e

end:
    mov %edx, %eax
    pop %ebx
    pop %ebp
    ret

#Q3.2.2
#On remarque qu'après 2 itérations, on a ajouté 1 deux fois '1',
#mais ensuite, on ajoute des valeurs inférieurs à '1', et puisqu'on
#travaille avec des nombre entiers, on ajoute en fait '0'. On remarque
#donc qu'après 2 itérations, en faire davantage ne change pas le résultat
#final, qui est '2'.
