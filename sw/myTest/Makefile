
include ../common/Makefile.common

EXE      = .elf
SRC      = myTest.s
CFLAGS  += -L../common
LDFLAGS += -T ../common/default.ld
TARGET   = myTest
OUTPUT   = $(TARGET)$(EXE)

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(OUTPUT) $(SRC) $(LDFLAGS) -g
	$(OBJCOPY) -j .text -O binary $(OUTPUT) imem.bin
	$(OBJCOPY) -j .data -O binary $(OUTPUT) dmem.bin
	$(OBJCOPY) -O binary $(OUTPUT) memory.bin
	$(OBJDUMP) -d $(OUTPUT) > $(TARGET).dis
	$(READELF) -a $(OUTPUT) > $(TARGET).symbol

clean:
	$(RM) *.o $(OUTPUT) $(TARGET).dis $(TARGET).symbol [id]mem.bin memory.bin






