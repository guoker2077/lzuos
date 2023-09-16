#first step, func $subst(FROM,TO,TEXT) :substitute FROM with TO in TEXT, then return the subtituted text
#second step,func $foreach(VAR,TEXT,COMMAND): for each unit separated by space do COMMAND,then return the list separated by space after all commands
#third step, func $wildcard( PATTERN...):enable pattern matching,return matched files
#finally, ifneq  judges whether the expression value is 0,then decide to jump to which branch

#this block is to check whether you have the 'riscv64-linux-gnu tool chain,
#and if doesn't exist, then use 'riscv64-unknown-elf' as tool chain
ifneq ($(wildcard $(foreach p,$(subst :, ,$(PATH)),$(p)/riscv64-linux-gnu-*)),)
	PREFIX := riscv64-linux-gnu
else
	PREFIX := riscv64-unknown-elf
endif

CC := $(PREFIX)-gcc		#declare complier
LD := $(PREFIX)-ld		#linker
AR := $(PREFIX)-ar		#archive library
OBJCOPY := $(PREFIX)-objcopy	#copy and convert binary file
OBJDUMP := $(PREFIX)-objdump	#disassebler
READELF := $(PREFIX)-readelf	#read elf file
NM := $(PREFIX)-nm		#symbol table,shared library
AS := $(PREFIX)-as		#assembler
TMUX := tmux			#divide screen tool
QEMU := qemu-system-riscv64	#riscv64 arch, running on qemu system emulator
GDB := riscv64-unknown-elf-gdb	#debugger

KERN_IMG := kernel.img	#the kernel iso , include bios
KERN_BIN := kernel.bin	#the kernel ios(binary)
KERN_MAP := kernel.map	#include symbol table(func,var), and address of these table
KERN_SYM := kernel.sym  #symbol table of kernel
KERN_ASM := kernel.asm	#assemble language of kernel

#$1: memeory model = medany(handle medium scale memory)
#$2: enable warning messages
#$3: generate debugging info with level O3
#$4: not use built-in funcs
#$5: disable stack protector
#$6: disable strict aliasing rules
#$7: not include standard library headers
#$8: refers to including file, and look for headers in current directory
#all these options form CFLAGS(compile flags)
CFLAGS := -mcmodel=medany -Wall -g3 -fno-builtin -fno-stack-protector -fno-strict-aliasing -nostdinc -I . 

#search for all .c files and substitute it with .o file, then generate the target objects
objects := $(patsubst %.c, %.o, $(wildcard *.c)) entry.o

#these are make command, do not track them
.PHONY : all build run run-gui symbol debug clean disassembly

all: build

build : $(KERN_BIN)	#generate kernel.bin, with given kernel.map,kernel.img and all objects
					
$(KERN_BIN) : $(objects)
	$(LD) -T linker.ld -Map=$(KERN_MAP) -o $(KERN_BIN) $^
	$(OBJCOPY) $(KERN_BIN) --strip-all -O binary $(KERN_IMG)

#run non-graphic qemu system,use kernel.img as kernel,init address at 0x80200000
run : build
	@$(QEMU) \
    		-machine virt \
    		-nographic \
    		-bios fw_jump.bin \
    		-device loader,file=$(KERN_IMG),addr=0x80200000
			 
#run graphic terminal,same as above
run-gui : build
	@$(QEMU) \
    		-machine virt \
    		-bios fw_jump.bin \
    		-device loader,file=$(KERN_IMG),addr=0x80200000 
#run debug mode with tmux
debug :
	$(TMUX) new -s debug -d "$(QEMU) \
    			-machine virt \
				-s -S \
				-serial mon:stdio \
				-nographic \
				-bios fw_jump.bin \
				-device loader,file=$(KERN_IMG),addr=0x80200000" && $(TMUX) split-window -h "$(GDB) -q -x gdbinit"
	$(TMUX) attach-session -t debug

#create file kernel.sym which includes kernel symbol infos
symbol : $(KERN_BIN)
	$(NM) -s $(KERN_BIN) > $(KERN_SYM)

#create file kernel.asm which include asm forms of kernel
disassembly: $(KERN_BIN)
	$(OBJDUMP) -d $(KERN_BIN) > $(KERN_ASM)


clean:	#clean all the files that make build
	-rm -f *.o $(KERN_BIN) $(KERN_IMG) $(KERN_SYM) $(KERN_ASM)
