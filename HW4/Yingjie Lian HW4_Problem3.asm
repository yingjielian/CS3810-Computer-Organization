.data
#Author:Yingjie Lian
message01: .ascii "Provide an input of less than 40 characters: \n"
message02: .ascii "The decompressed string is: \n"

C: .asciiz "C"
G: .asciiz "G"
A: .asciiz "A"
T: .asciiz "T"

input: .space 40
sorted_string: .space 100


.text
# INITIALIZATION
li $s1, 35
li $s2, 36
li $s3, 37
li $s4, 38
la $t0, sorted_string
move $a1, $a0

# JUMP TO THE NEEDED FUNCTIONS
jal print_message01
jal return_string
jal print_message02

# READING THE STRING
loop:
	move $a1, $a0
	lb $t1, 0($a0) #Load byte
	beqz $t1,loop_end # Check if branch equal to zero
	beq $t1,$s1,symbol1# Check if branch equal to symbol1 function
	beq $t1,$s2,symbol2
	beq $t1,$s3,symbol3
	beq $t1,$s4,symbol4
	sb $t1, 0($a0) #Store byte
	li $v0,11 #print character out
	move $a0,$t1
	syscall
	move $a0,$a1
	addi $a0,$a0,1 #INITIALIZE LOOP FROM i=1
	
	j loop #JUMP TO LOOP
	li $v0,10 #EXIT
	syscall
	
return_string:
	li $v0,8
	la $a0,input
	li $a1,40
	syscall
	jr $ra


loop1:
	beqz $t3,symbol_end
	move $a1,$a0
	la $t5,A
	li $v0,11
	lb $a0,($t5)
	syscall
	move $a0,$a1
	addi $t3,$t3,-1
	j loop1

loop2:
	beqz $t3,symbol_end
	move $a1,$a0
	la $t5,C
	li $v0,11
	lb $a0,($t5)
	syscall
	move $a0,$a1
	addi $t3,$t3,-1
	j loop2
	
loop3:
	beqz $t3,symbol_end
	move $a1,$a0
	la $t5,G
	li $v0,11
	lb $a0,($t5)
	syscall
	move $a0,$a1
	addi $t3,$t3,-1
	j loop3
	
loop4:
	beqz $t3,symbol_end
	move $a1,$a0
	la $t5,T
	li $v0,11
	lb $a0,($t5)
	syscall
	move $a0,$a1
	addi $t3,$t3,-1
	j loop4
	
space_situation:
	move $a1,$a0
	li $v0,11
	lb $a0,($a0)
	syscall
	move $a0,$a1
	addi $a0, $a0,2
	jr $ra
	
symbol1:
	li $t4,0
	move $a1,$a0
	lb $t2,0($a2)
	subi $t3,$t2,32
	beq $t3,$zero space_situation
	move $a0, $a2
	addi $a0,$a0,1
	j loop1
	jr $ra
	
symbol2:
	li $t4,0
	move $a1,$a0
	addi $a2,$a0,1
	lb $t2,0($a2)
	subi $t3,$t2,32
	beq $t3,$zero space_situation
	move $a0, $a2
	addi $a0,$a0,1
	j loop2
	jr $ra
	
symbol3:
	li $t4,0
	move $a1,$a0
	addi $a2,$a0,1
	lb $t2,0($a2)
	subi $t3,$t2,32
	beq $t3,$zero space_situation
	move $a0, $a2
	addi $a0,$a0,1
	j loop3
	jr $ra
	
symbol4:
	li $t4,0
	move $a1,$a0
	addi $a2,$a0,1
	lb $t2,0($a2)
	subi $t3,$t2,32
	beq $t3,$zero space_situation
	move $a0, $a2
	addi $a0,$a0,1
	j loop4
	jr $ra	
	
#PRINT OUT MESSAGE TO REMIND USERS
print_message01:
	li $v0,4 # print string
	la $a0,message01
	syscall
	jr $ra
	
print_message02:
	move $a1, $a0
	li $v0,4
	la $a0,message02 #Load address
	syscall
	move $a0,$a1
	jr $ra # Jump register

loop_end:
	li $v0,10 #EXIT
	syscall
	
symbol_end:
jr $ra
	
	
	
	
	
	
