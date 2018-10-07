.data
#Author:Yingjie Lian
prompt1: .asciiz "Please enter an integer N: \n"
prompt2: .asciiz "Please enter N^2: \n"
prompt3: .asciiz "You entered an Integer N: "
prompt4: .asciiz "You input is less than 0, so this program is about to stop.\n"

.text
main:
# prompt user for integer N
li $v0,4
la $a0, prompt1
syscall 

# read in integer for N
li $v0,5
syscall
addi    $s0,$v0,0           # $v0 contains the integer we read

# prompt user for N^2
li $v0, 4
la $a0, prompt2
syscall

li $v0, 5
syscall
addi    $s1,$v1,0   

# Print the values of N and N^2
print_values:
li $v0,4
la $a0,prompt3
syscall
