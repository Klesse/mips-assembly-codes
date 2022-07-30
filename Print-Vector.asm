.data
	a: .word 1, 65, 3, 4
	b: .word 48
.text

.globl main

 	imprimir:
 	lw $t2, a($t1)
 	lw $t3, b($t1)
 	add $t4, $t2, $t3
	sw $t4, a($t1)
 	sub $t2, $t2,$t2
 	sub $t3, $t3,$t3
 	sub $t4, $t4,$t4
 		
		li $v0, 1
 		lw $a0, a($t1)
 		syscall
 		addi $t1, $t1, 4
 		bne $t1, 4, imprimir
 		addi $t4, $t4, 1
 		j main
	main:
		sub $t0, $t0,$t0
		add $t0, $t0, $0
		addi $t4, $t4, 1
		beq $t4, 1, imprimir
	
