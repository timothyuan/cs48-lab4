# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly (NON-RECURSIVE) version of:
#   int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#
.data

	first: .asciiz "Enter a number: \n"
	second: .asciiz "Factorial of "
	third: .asciiz " is: \n"

#Text Area (i.e. instructions)
.text
main:
	li $t0, 1
	li $v0, 4
	la $a0, first
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
        la $a0, second
        syscall
	
	li $v0, 1
        move $a0, $t1
        syscall

	li $v0, 4
        la $a0, third
        syscall

	j loop

loop:
	beq $t1, $zero, exit_loop
	mult $t0, $t1
	mflo $t0
	addi, $t1, $t1, -1
	j loop

exit_loop:
	li $v0, 1
        move $a0, $t0
        syscall

exit:
	li $v0, 10
        syscall
