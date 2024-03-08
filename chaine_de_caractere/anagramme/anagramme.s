.data
string1:
.asciz  "chien" 
lenght1:
.int 5
string2:
.asciz  "niche"
lenght2:
.int 5
result1:
.int 0
result2:
.int 0

.text
.globl anagramme



computeResult:
    movl $0, %eax
    movl $0, %ecx
    movl $0, %ebx
    jmp test1

    loop1:
    add $1, %ecx    
    add %eax, %ebx  

    test1:  
    movb 0(%edx, %ecx), %al 
    cmpb $0, %al
    jne loop1
    ret 

anagramme: 
    push %ebp
    mov %esp, %ebp
    push %ebx

    movl lenght1, %eax
    movl lenght2, %ebx
    cmpl %eax, %ebx
    jne diffrentLenght

    lea string1, %edx  
    call computeResult     
    movl %ebx, result1     

    lea string2, %edx   
    call computeResult   
    movl %ebx, result2     


    #Division des sommes par la longueur des mots

    movl result1, %eax
    movl $0, %edx
    divl lenght1
    movl %eax, result1

    movl result2, %eax
    movl $0, %edx
    divl lenght2
    movl %eax, result2

    movl result1, %eax
    cmpl result2, %eax
    je areAnagrammes
    jmp notAnagrammesSameLenght


areAnagrammes:
    movl $0, %eax
    jmp bye

diffrentLenght:
    movl $1, %eax
    jmp bye

notAnagrammesSameLenght:
    movl $255, %eax
    jmp bye


bye:
    popl %ebx
    popl %ebp
    ret


#REPONSE
#Une solution possible serait de verifier si la valeur de chaque char est en dessous 
#ou egale a 90. Si c'est le cas, on pourrais ajouter 32 a la valeur pour obtenir
#la meme lettre, mais version minuscule. Ensuite on pourrais comparer les deux chaines.
#On assume que les chaine de charactere sont constitier uniquement le charactere de l'alphabet.

