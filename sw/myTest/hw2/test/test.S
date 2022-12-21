.data
arr: .word 1, 2, 3 # a[3] = {1, 2, 3}
len1: .word 3 # array length of a is 3
space: .string " " # space

.text
# s1 = arr a base address
# s2 = arr b base address
# s3 = array length of a
# s4 = array length of b
# t0 = i for loopCon1, loopCon2, print

main:
    la s1, arr          # s1 = address of a
    lw s3, len1         # s3 = length of a
    add s4, s3, s3      # s4 = length of b (a*2)
    add t0, x0, x0      # i = 0
    jal ra, loopCon1
    add t0, x0, x0      # i = 0
    jal ra, loopCon2
    add t0, x0, x0      # i = 0
    jal ra, print
    jal ra, exit

loopCon1:
    add t1, t0, x0          # t1 = i
    add t1, t1, t1          # t1 = t1*2
    add t1, t1, t1          # t1 = t1*2 (t1*4)
    add t1, t1, s1          # address of a[i] (base addr. + 4i)
    lw t2, 0(t1)            # t2 = s1 (content of a[i])
    add t1, t0, x0          # t1 = i
    add t1, t1, t1          # t1 = t1*2
    add t1, t1, t1          # t1 = t1*2 (t1*4)
    add t1, t1, s2          # address of b[i] (base addr. + 4i)
    sw t2, 0(t1)            # b[i] = t2 (content of a[i])
    addi t0, t0, 1          # i++
    blt t0, s3, loopCon1    # if i < length, go to loopCon1
    ret                     # else, return to main 

loopCon2:
    add t1, t0, x0          # t1 = i
    add t1 t1 t1            # t1 i*2
    add t1 t1 t1            # t1 i*2 (t1*4)
    add t1 t1 s1            # t1=i*4+base_of_arr
    lw t2 0(t1)             # t2 = s1 (content of a[i])
    add t1 t0 s3            # t1 = i + length
    add t1 t1 t1            # t1 = t1*2
    add t1 t1 t1            # t1 = t1*2 (t1*4)
    add t1 t1 s2            # t1 = address of b[i+length] (base addr. + 4*(i+length))
    sw t2 0(t1)             # t2 = content in arr[n+1]
    addi t0 t0 1            # i++
    blt t0, s3, loopCon2    # if i < length, go to loopCon2
    ret                     # else, return to main

print:
    lw t2 0(s2)             # t2 = content of b[i]
    add a0, t2, x0          # load result of array b
    li a7, 1                # print integer
    ecall                   # systemcall
    la a0, space            # load string - space
    li a7, 4                # print string
    ecall
    addi s2, s2, 4          # address move forward
    addi t0, t0, 1          # i++
    blt t0, s4, print
    ret

exit:
    li a7 10                # end program
    ecall
