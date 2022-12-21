.PHONY: clean

include ../mk/toolchain.mk

ASFLAGS = -march=rv32i -mabi=ilp32
LDFLAGS = --oformat=elf32-littleriscv

%.o: %.S
	$(CROSS_COMPILE)as -R $(ASFLAGS) -o $@ $<

all: concatenation_of_array.elf

concatenation_of_array.elf: concatenation_of_array.o
	 $(CROSS_COMPILE)ld -o $@ -T concatenation_of_array.ld $(LDFLAGS) $<

clean:
	$(RM) concatenation_of_array.elf concatenation_of_array.o
