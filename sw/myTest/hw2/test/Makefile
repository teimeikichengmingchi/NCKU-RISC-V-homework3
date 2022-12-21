.PHONY: clean

include ../../mk/toolchain.mk

ASFLAGS = -march=rv32i -mabi=ilp32
LDFLAGS = --oformat=elf32-littleriscv

%.o: %.S
	$(CROSS_COMPILE)as -R $(ASFLAGS) -o $@ $<

all: test.elf

test.elf: test.o
	 $(CROSS_COMPILE)ld -o $@ -T test.ld $(LDFLAGS) $<

clean:
	$(RM) test.elf test.o
