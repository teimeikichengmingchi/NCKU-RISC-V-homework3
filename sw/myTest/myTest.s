  

#.text
#.global main

#main:
#    addi sp, sp, -4    # main will called by _start
#    sw ra, 0(sp)

#    li x25, 100
#    li t0, 0
#    li t1, 1000
#for:
#    bge t0, t1, end
#    addi t0, t0, 1
#    j for
    
#end:
#    lw ra, 0(sp)
#    addi sp, sp, 4
#    ret






#.text
#.global main

#main:
#    addi sp, sp, -4    # main will called by _start
#    sw ra, 0(sp)

#    li t0, -1
#    li t1, 1000
#for:
#    addi t0, t0, 1
#    blt t0, t1, for
   
#    lw ra, 0(sp)
#    addi sp, sp, 4
#    ret

