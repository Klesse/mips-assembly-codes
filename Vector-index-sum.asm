.data

	A: .word 74, 58, 41, 12
	
.text

	sub $t1, $t1, $t1
	addi $t1, $t1, 4
	lw $t2, A($t1)
	li $v0, 1
	la $a0, ($t2)
	syscall
	