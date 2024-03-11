.data
iteration:
.int 3
factorial_value:
.float 1
factorial:
.float 0
e:
.float 0
reset:
.float 0
one:
.float 1
.text
.globl e_euler_flottante

e_euler_flottante:
    push %ebp               
    mov %esp,%ebp
    push %ebx

start :
    #verifier si iteration est 0
    mov iteration, %ecx
    cmp $0, %ecx
    jz end

    #ajouter 1 pour 1/0!
    flds e
    flds one
    faddp
    fstps e

    #decrementer iteration et verifier si 0
    dec %ecx
    jz end

approximation_e:
    # incrémenter le compteur de 1
    flds factorial
    flds one
    faddp
    fstps factorial

    # multiplier le denominateur et le compteur pour calculer factorielle
    flds factorial
    flds factorial_value
    fmulp
    fstps factorial_value

    # divison
    flds factorial_value
    flds one
    fdivp

    # ajouter le résultat à la somme
    flds e
    faddp
    fstps e

    loop approximation_e
    
end:
    flds e
    pop %ebx
    pop %ebp
    ret
