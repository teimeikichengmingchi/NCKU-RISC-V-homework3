.org 0
.global _start

.set STDOUT, 1
.set SYSEXIT,  93
.set SYSWRITE, 64
.set SYSBRK, 214

.data
arr1: .word 1, 2, 3 # a[3] = {1, 2, 3}
len1: .word 3 # array length of a is 3
space: .byte ' ' # space
comma: .byte ','
nline: .byte '\n'

.text
# s1 = arr a base address
# s2 = arr b base address
# s3 = array length of a
# s4 = array length of b
# t0 = i for loopCon1, loopCon2, print

_start:
    addi sp, sp, -24    # allocate space for b
    la s1, arr1
    mv s2, sp           # base address of b
    lw s3, len1
    li t0, 0            # i = 0
    slli t1, s3, 2      # t1 = len(arr) * 4
for1:
    add t2, t0, s1      # t2 = curr address of a
    add t3, t0, s2      # t3 = curr address of b
    add t4, t3, t1      # t4 = curr address of b + len of a
    lw t2, 0(t2)        # t2 = a[i]
    sw t2, 0(t3)        # b[i] = a[i]
    sw t2, 0(t4)        # b[i + len(a)] = a[i]
    addi t0, t0, 4
    blt t0, t1, for1

    li t0, 0
    slli t1, s3, 3      # t1 = len(arr) * 8
    li a7, SYSWRITE     # in forPrint, we only print value so system call argument is setted before
forPrint:
    add t2, s2, t0      # t2 = address of b[i]
    li a0, 0xfff
    mv a1, t2
    li a2, 4
    ecall
    
    li a0, STDOUT
    la a1, space
    li a2, 1
    ecall
    addi t0, t0, 4
    blt t0, t1, forPrint
    j exit

exit:
    li a0, 0
    li a7, SYSEXIT           # end
    ecall

