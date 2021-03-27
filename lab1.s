#                                           ICS 51, Lab #1
# 
#                                          IMPORTATNT NOTES:
# 
#                       Write your assembly code only in the marked blocks.
# 
#                       DO NOT change anything outside the marked blocks.
# 
#
j main
###############################################################
#                           Data Section
.data
# 


new_line: .asciiz "\n"
space: .asciiz " "
double_range_lbl: .asciiz "\nDouble range (Decimal Values) \nExpected output:\n1200 -690 104\nObtained output:\n"
swap_bits_lbl: .asciiz "\nSwap bits (Hexadecimal Values)\nExpected output:\n75757575 FD5775DF 064B9A83\nObtained output:\n"
count_bits_lbl: .asciiz "\nCount bits \nExpected output:\n20 24 13\nObtained output:\n"

swap_bits_test_data:  .word 0xBABABABA, 0xFEABBAEF, 0x09876543
swap_bits_expected_data:  .word 0x75757575, 0xFD5775DF, 0x064B9A83

double_range_test_data: .word 945, -345, 0, -3, 55
double_range_expected_data: .word 1200, -6, 104

hex_digits: .byte '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'

###############################################################
#                           Text Section
.text
# Utility function to print hexadecimal numbers
print_hex:
move $t0, $a0
li $t1, 8 # digits
lui $t2, 0xf000 # mask
mask_and_print:
# print last hex digit
and $t4, $t0, $t2 
srl $t4, $t4, 28
la    $t3, hex_digits  
add   $t3, $t3, $t4 
lb    $a0, 0($t3)            
li    $v0, 11                
syscall 
# shift 4 times
sll $t0, $t0, 4
addi $t1, $t1, -1
bgtz $t1, mask_and_print
exit:
jr $ra
###############################################################
###############################################################
###############################################################
#                            PART 1 (Count Bits)
# 
# You are given an 32-bits integer stored in $t0. Count the number of 1's
#in the given number. For example: 1111 0000 should return 4
count_bits:
move $t0, $a0 
############################## Part 1: your code begins here ##
li $t1, 2147483648 #10000... in binary
li $t9, 0
and $t2, $t0, $t1
blez $t2, next1
#blt  $t0,$t1, next1
add $t9,$t9,1

next1:
li $t1, 1073741824
and $t2, $t0, $t1 
blez $t2, next2
add $t9,$t9,1

next2:
li $t1, 536870912
and $t2, $t0, $t1 
blez $t2, next3
add $t9,$t9,1

next3:
li $t1, 268435456
and $t2, $t0, $t1 
blez $t2, next4
add $t9,$t9,1

next4:
li $t1, 134217728
and $t2, $t0, $t1 
blez $t2, next5
add $t9,$t9,1

next5:
li $t1, 67108864
and $t2, $t0, $t1 
blez $t2, next6
add $t9,$t9,1

next6:
li $t1, 33554432
and $t2, $t0, $t1 
blez $t2, next7
add $t9,$t9,1

next7:
li $t1, 16777216
and $t2, $t0, $t1 
blez $t2, next8
add $t9,$t9,1

next8:
li $t1, 8388608
and $t2, $t0, $t1 
blez $t2, next9
add $t9,$t9,1

next9:
li $t1, 4194304
and $t2, $t0, $t1
blez $t2, next10
add $t9,$t9,1

next10:
li $t1, 2097152
and $t2, $t0, $t1
blez $t2, next11
add $t9,$t9,1

next11:
li $t1, 1048576
and $t2, $t0, $t1
blez $t2, next12
add $t9,$t9,1

next12:
li $t1, 524288
and $t2, $t0, $t1
blez $t2, next13
add $t9,$t9,1

next13:
li $t1, 262144
and $t2, $t0, $t1
blez $t2, next14
add $t9,$t9,1

next14:
li $t1, 131072
and $t2, $t0, $t1 
blez $t2, next15
add $t9,$t9,1

next15:
li $t1, 65536
and $t2, $t0, $t1 
blez $t2, next16
add $t9,$t9,1

next16:
li $t1, 32768
and $t2, $t0, $t1 
blez $t2, next17
add $t9,$t9,1

next17:
li $t1, 16384
and $t2, $t0, $t1 
blez $t2, next18
add $t9,$t9,1

next18:
li $t1, 8192
and $t2, $t0, $t1 
blez $t2, next19
add $t9,$t9,1

next19:
li $t1, 4096
and $t2, $t0, $t1 
blez $t2, next20
add $t9,$t9,1

next20:
li $t1, 2048
and $t2, $t0, $t1 
blez $t2, next21
add $t9,$t9,1

next21:
li $t1, 1096
and $t2, $t0, $t1 
blez $t2, next22
add $t9,$t9,1

next22:
li $t1, 512
and $t2, $t0, $t1 
blez $t2, next23
add $t9,$t9,1

next23:
li $t1, 256
and $t2, $t0, $t1 
blez $t2, next24
add $t9,$t9,1

next24:
li $t1, 128
and $t2, $t0, $t1 
blez $t2, next25
add $t9,$t9,1

next25:
li $t1, 64
and $t2, $t0, $t1 
blez $t2, next26
add $t9,$t9,1

next26:
li $t1, 32
and $t2, $t0, $t1 
blez $t2, next27
add $t9,$t9,1

next27:
li $t1, 16
and $t2, $t0, $t1 
blez $t2, next28
add $t9,$t9,1

next28:
li $t1, 8
and $t2, $t0, $t1 
blez $t2, next29
add $t9,$t9,1

next29:
li $t1, 4
and $t2, $t0, $t1 
blez $t2, next30
add $t9,$t9,1

next30:
li $t1, 2
and $t2, $t0, $t1 
blez $t2, next31
add $t9,$t9,1

next31:
li $t1, 1
and $t2, $t0, $t1 
blez $t2,end
add $t9,$t9,1
end:
add $t0, $t9,0








############################## Part 1: your code ends here ###
move $v0, $t0
jr $ra

###############################################################
###############################################################
###############################################################
###############################################################
###############################################################
###############################################################
#                            PART 2 (Swap Bits)
# 
# You are given an 32-bits integer stored in $t0. You need swap the bits
# at odd and even positions. i.e. b31 <-> b30, b29 <-> b28, ... , b1 <-> b0
# The result must be stored inside $t0 as well.
swap_bits:
move $t0, $a0 
############################## Part 2: your code begins here ###

li $t1, 2863311530 #alternating 1's in even places
li $t2, 1431655765 #alternating in odd
and $t1, $t0, $t1 #grab evens
and $t2, $t0, $t2 #grab odds
srl $t1, $t1, 1 #shift evens right
sll $t2, $t2, 1 #shift odds left
or $t0, $t1, $t2 #add them back together 





############################## Part 2: your code ends here ###
move $v0, $t0
jr $ra

###############################################################
###############################################################
###############################################################
#                           PART 3
# 
# You are given three integers. You need to find the smallest 
# one and the largest one and multiply their sum by two and return it.
# 
# Implementation details:
# The three integers are stored in registers $t0, $t1, and $t2. You 
# need to store the answer into register $t0. It will be returned by the
# function to the caller.

double_range:
move $t0, $a0
move $t1, $a1
move $t2, $a2
############################### Part 3: your code begins here ##

move $t4, $t0 #minimum
move $t5, $t0 #maximum
blt $t4, $t1, check2
move $t4, $t1

check2:
blt $t4,$t2, check3
move $t4, $t2

check3:
bgt $t5,$t1, check4
move $t5,$t1

check4:
bgt $t5,$t2, math
move $t5,$t2

math:
add $t1,$t4,$t5
mul $t0, $t1, 2



       
############################### Part 3: your code ends here  ##
move $v0, $t0
jr $ra

###############################################################
###############################################################
###############################################################
#                          Main Function 
main:

li $v0, 4
la $a0, new_line
syscall
la $a0, count_bits_lbl
syscall

# Testing part 2
li $s0, 3 # num of test cases
li $s1, 0
la $s2, swap_bits_test_data

test_p1:
add $s4, $s2, $s1
# Pass input parameter
lw $a0, 0($s4)
jal count_bits

move $a0, $v0        # $integer to print
li $v0, 1
syscall

li $v0, 4
la $a0, space
syscall

addi $s1, $s1, 4
addi $s0, $s0, -1
bgtz $s0, test_p1

li $v0, 4
la $a0, new_line
syscall
la $a0, swap_bits_lbl
syscall

# Testing part 2
li $s0, 3 # num of test cases
li $s1, 0
la $s2, swap_bits_test_data

test_p2:
add $s4, $s2, $s1
# Pass input parameter
lw $a0, 0($s4)
jal swap_bits

move $a0, $v0
jal print_hex
li $v0, 4
la $a0, space
syscall

addi $s1, $s1, 4
addi $s0, $s0, -1
bgtz $s0, test_p2

li $v0, 4
la $a0, new_line
syscall
la $a0, double_range_lbl
syscall


# Testing part 3
li $s0, 3 # num of test cases
li $s1, 0
la $s2, double_range_test_data

test_p3:
add $s4, $s2, $s1
# Pass input parameter
lw $a0, 0($s4)
lw $a1, 4($s4)
lw $a2, 8($s4)
jal double_range

move $a0, $v0        # $integer to print
li $v0, 1
syscall

li $v0, 4
la $a0, space
syscall

addi $s1, $s1, 4
addi $s0, $s0, -1
bgtz $s0, test_p3

_end:
# end program
li $v0, 10
syscall

