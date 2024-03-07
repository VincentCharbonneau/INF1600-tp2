.text
.globl e_euler_entiere

e_euler_entiere:

 
push %ebp
mov %esp,%ebp
push %ebx

movl $1, %eax         # Initialiser le numérateur à 1
movl $1, %ebx         # Initialiser le dénominateur à 1
movl $1, %ecx         # Initialiser le résultat à 1
movl $1, %edi         # Initialiser le compteur à 1
movl $10, %edx        # Nombre d'itérations

approximation_e:
    mul %edi          # Multiplier le compteur par le résultat
    div %ebx          # Diviser le résultat par le dénominateur
    incl %edi          # Augmenter le compteur
    mul %edi          # Multiplier le dénominateur par le compteur
    cmp $10, %edi      # Vérifier si nous avons atteint 10 itérations
    je end             # Si oui, sortir de la boucle
    loop approximation_e
    
pop %ebx
pop %ebp
ret