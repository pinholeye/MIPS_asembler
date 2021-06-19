#Returns the max value of a sequence


.data

array: 		.word 3,-4,45,7,8
end: 		.word 30
erg: 		.word 0

.text

main:		la $t0 array
		la $t1 end
		lw $t3 ($t0)           

loop:		bgt $t0 $t1 endloop 	# if t0 > t1 --> endlopp
		addi $t0 $t0 4          	# next value load into t0
		lw $t2 ($t0)
		blt $t2 $t3 loop		# if t2 < t3 --> loop
		move $t3 $t2            	# else t3 = t2
		j loop

endloop:	sw $a0 $t0	
		li $v0 1
		syscall		
		li $v0 10
		syscall
