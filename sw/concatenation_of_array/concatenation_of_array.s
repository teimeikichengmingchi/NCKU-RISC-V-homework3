#.global main
#.data
#arr1: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40# a[3] = {1, 2, 3}
#len1: .word 40 # array length of a is 3
#nline: .byte '\n'
#iformat: .string "%d "

#.text

#main:
#    addi sp, sp, -324    # allocate space for b
#    sw ra, 320(sp)
#    la s1, arr1
#    lw s3, len1
#    li t0, 0            # i = 0
#    slli t1, s3, 2      # t1 = len(arr) * 4
#for1:
#    add t2, t0, s1      # t2 = curr address of a
#    add t3, t0, sp      # t3 = curr address of b
#    add t4, t3, t1      # t4 = curr address of b + len of a
#    lw t2, 0(t2)        # t2 = a[i]
#    sw t2, 0(t3)        # b[i] = a[i]
#    sw t2, 0(t4)        # b[i + len(a)] = a[i]
#    addi t0, t0, 4
#    blt t0, t1, for1

#    li s4, 0
#    slli s5, s3, 3      # t1 = len(arr) * 8
#forPrint:
#    la a0, iformat
#    add t2, sp, s4      # t2 = address of b[i]
#    lw a1, 0(t2)
#    call printf
    
#    addi s4, s4, 4
#    blt s4, s5, forPrint
#    la a0, nline
#    call printf

#    lw ra, 320(sp)
#    addi sp, sp, 324
#    li a0, 0            # return 0
#    ret

.global main
.data
arr1: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40# a[3] = {1, 2, 3}
len1: .word 40 # array length of a is 3
nline: .byte '\n'
iformat: .string "%d "



.text

main:
    addi sp, sp, -324    # allocate space for b
    sw ra, 320(sp)
    la s1, arr1
    lw s3, len1
    li t0, 0            # i = 0
    slli t1, s3, 2      # t1 = len(arr) * 4

    andi t2, s3, 0x3# count remainder ( i % 4)
    li t3, 3
    beq t3, t2, three
    li t3, 2
    beq t3, t2, two
    li t3, 1
    beq t3, t2, one
for1:
    add t2, t0, s1      # t2 = curr address of a
    add t3, t0, sp      # t3 = curr address of b
    add t4, t3, t1      # t4 = curr address of b + len of a
    lw t2, 0(t2)        # t2 = a[i]
    sw t2, 0(t3)        # b[i] = a[i]
    sw t2, 0(t4)        # b[i + len(a)] = a[i]
    addi t0, t0, 4
three: # i % 4 == 3
    add t2, t0, s1      # t2 = curr address of a
    add t3, t0, sp      # t3 = curr address of b
    add t4, t3, t1      # t4 = curr address of b + len of a
    lw t2, 0(t2)        # t2 = a[i]
    sw t2, 0(t3)        # b[i] = a[i]
    sw t2, 0(t4)        # b[i + len(a)] = a[i]
    addi t0, t0, 4
two: # i % 4 == 2
    add t2, t0, s1      # t2 = curr address of a
    add t3, t0, sp      # t3 = curr address of b
    add t4, t3, t1      # t4 = curr address of b + len of a
    lw t2, 0(t2)        # t2 = a[i]
    sw t2, 0(t3)        # b[i] = a[i]
    sw t2, 0(t4)        # b[i + len(a)] = a[i]
    addi t0, t0, 4
one: # i % 4 == 1
    add t2, t0, s1      # t2 = curr address of a
    add t3, t0, sp      # t3 = curr address of b
    add t4, t3, t1      # t4 = curr address of b + len of a
    lw t2, 0(t2)        # t2 = a[i]
    sw t2, 0(t3)        # b[i] = a[i]
    sw t2, 0(t4)        # b[i + len(a)] = a[i]
    addi t0, t0, 4
    blt t0, t1, for1

    li s4, 0
    slli s5, s3, 3      # t1 = len(arr) * 8
#forPrint:
#    la a0, iformat
#    add t2, sp, s4      # t2 = address of b[i]
#    lw a1, 0(t2)
#    call printf
    
#    addi s4, s4, 4
#    blt s4, s5, forPrint
#    la a0, nline
#    call printf

    lw ra, 320(sp)
    addi sp, sp, 324
    li a0, 0            # return 0
    ret

