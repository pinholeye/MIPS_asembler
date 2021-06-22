# input: list of elements in with the same type
# Algorithm: 
# 1. sorting the list: if empty or len(elements) = 1 ===> already sorted
# 2. find the max element and swap wot the first element
# 3. Repeat without first element
# Test the recursion

.data

list: 		.word 1, 2

newline:	.asciiz "\n"
empty: 		.asciiz " "

.text
main:		la $a0, list
		la $a1, 4($a0)

		li $v0, 1
		lw $a0, 0($a0)
		syscall
		
		li $v0, 4
		la $a0, empty
		syscall

		li $v0, 1
		lw $a0, 0($a1)
		syscall

		li $v0, 4
		la $a0, newline
		syscall

		la $a0, list
		
		jal swap
		j end

	
swap: 	addi 	$sp, $sp, -20
		sw	$fp, 20($sp)
		sw	$ra, 16($sp)
		sw	$s0, 12($sp)
		sw	$s1, 8($sp)		
		addi	$fp, $sp, 20		

		lw	$s0, 0($a0)
		lw	$s1, 0($a1)
		sw	$s1, 0($a0)
		sw	$s0, 0($a1)
		
		lw	 $s1, 8($sp)
		lw	 $s0, 12($sp)
		lw	 $ra, 16($sp)
		lw	 $fp, 20($sp)
		
		addi	$sp, $sp, 20
		jr 	$ra



end:


		li $v0, 1
		lw $a0, ($a0)
		syscall
		
		li $v0, 4
		la $a0, empty
		syscall

		li $v0, 1
		lw $a0, ($a1)
		syscall

		li $v0, 10		#end
		syscall


