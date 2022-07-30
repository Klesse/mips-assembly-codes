
addi $s0, $s0, 4
main:
move $a0, $s0
jal fat
move $a0, $t1
li $v0, 1
syscall
fat: slti $t0,$a0,2
 beq $t0,$0,else
 li $v0,1
 jr $ra
else: addiu $sp,$sp,-8
 sw $a0,4($sp)
 sw $ra,0($sp)
 addiu $a0,$a0,-1
 jal fat
 lw $a0,4($sp)
 lw $ra,0($sp)
 mul $v0,$a0,$v0
 addi $sp,$sp,8
 jr $ra 
