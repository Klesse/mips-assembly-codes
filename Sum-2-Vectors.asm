.data
	A: .word 1, 2, 3, 4, 5, 6, 7, 8
	B: .word 2, 4, 6, 8, 10, 12, 14, 16
	espaco: .asciiz "\n"
	
.text

.globl main

somar:
 	mul $t1, $t0, 4 # Endereço para alternação
 	lw $t2, A($t1)
 	lw $t3, B($t1)
 	add $t4, $t2, $t3
	sw $t4, A($t1)
 	sub $t2, $t2,$t2
 	sub $t3, $t3,$t3
 	sub $t4, $t4,$t4
 	addi $t0, $t0, 1
 	bne $t0, 64, somar
 	addi $t7, $t7, 1
 	j main


 
imprimir:
 li $v0, 1
 lw $a0, A($t0)
 syscall
 li $v0, 4
 la $a0, espaco
 syscall
 addi $t0, $t0, 4
 bne $t0, 32, imprimir
 addi $t7, $t7, 1
 j main

main:
	#sub $t0, $t0,$t0 # t0 = 0 -> t0 contador
	#j somar
	sub $t0, $t0,$t0 # t0 = 0 -> t0 contador
	beq $t7, $zero, somar
	beq $t7, 1, imprimir
	
