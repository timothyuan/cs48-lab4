# MedianNumbers.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data

	prompt:	.asciiz "Enter the next number:\n"

	median:	.asciiz "Median: "


#Text Area (i.e. instructions)
.text

main:

	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t0, $v0	

	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t2, $v0

	li $v0, 4
	la $a0, median
	syscall

	blt $t0, $t1, compare
	blt $t2, $t0, larger
	#if this point is reached, $t0 is median

	li $v0, 1
	move $a0, $t0
	syscall
	b exit

exit:
	li $v0, 10
	syscall

compare:
	blt $t0, $t2, smaller
	li $v0, 1
	move $a0, $t0
	syscall
	b exit

larger:
	blt $t2, $t1, middle
	li $v0, 1
        move $a0, $t2
        syscall
        b exit

smaller:
	blt $t1, $t2, middle
	li $v0, 1
        move $a0, $t2
        syscall
        b exit
	
middle:
	li $v0, 1
        move $a0, $t1
        syscall
        b exit

