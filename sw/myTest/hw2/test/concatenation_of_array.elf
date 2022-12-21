	.file	"concatenation_of_array.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_a2p1_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata
	.align	2
.LC0:
	.string	"%d "
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	li	a5,1
	sw	a5,-32(s0)
	li	a5,2
	sw	a5,-28(s0)
	li	a5,3
	sw	a5,-24(s0)
	sw	zero,-20(s0)
	j	.L2
.L3:
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a4,-16(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	sw	a4,-40(a5)
	lw	a5,-20(s0)
	addi	a3,a5,3
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a4,-16(a5)
	slli	a5,a3,2
	addi	a5,a5,-16
	add	a5,a5,s0
	sw	a4,-40(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a4,-20(s0)
	li	a5,2
	ble	a4,a5,.L3
	sw	zero,-20(s0)
	j	.L4
.L5:
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-40(a5)
	mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L4:
	lw	a4,-20(s0)
	li	a5,5
	ble	a4,a5,.L5
	li	a5,0
	mv	a0,a5
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	main, .-main
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 12.2.0"
