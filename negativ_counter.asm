# Return number of negative numbers in the sequence


.data

sequence:	.word 	2 , -5, 3, -90, 300, -54, -23, -35, 120, -54
len: 		.word 	10
leer: 		.asciiz "\n"


.text

main: 	la $t0 , sequence	#load adress from the sequence to t0
	lw $t1 , len		#loop counter gets the length of the sequence 
	li $t2 , 0		#negative counter = 0
l:
	lw 	$s0, 0($t0)	#load adress from register t0 to register s0
	addi	$t2, $t2, 1	#t2+1

p: 	add 	$t0, $t0, 4	#jump one element
	sub 	$t1, $t1, 1	#loop counter - 1
	bgtz 	$t1, l		#jump to l if t1>0
