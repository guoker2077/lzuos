#include <sbi.h>

void sbi_set_timer(uint64_t stime_value)
{
    register uint64_t a0 asm("a0") = stime_value;
    register uint64_t a6 asm("a6") = 0;
    register uint64_t a7 asm("a7") = TIMER_EXTENTION;
    __asm__ __volatile__("ecall \n\t"
                 : /* empty output list */
                 : "r"(a0), "r"(a6), "r"(a7)
                 : "memory");
}

void sbi_console_putchar(char ch)
{
    //define a 64bit var as a0, then associated it with register a0 using 'asm("a0")'.It is used to store the 'ch',cause register a0 is uesd to pass arguments in system call.
    register uint64_t a0 asm("a0") = ch;
    
    //define a 64bit var a6 which is assigned to zero, then associated it with register a6 using 'asm("a6")'.In RISCV, register a6 is used to keep the system call number, and zero stands for the exact number of system call(when it happens in Linux, it's called sys_call )
    register uint64_t a6 asm("a6") = 0;
    
    //define a 64bit var a7 which is assigned to 1, then associated it with register a7 using 'asm("a7")'.In RISCV, register a7 is used to keep the system call argument. It's set to 1, indicating the system call to perform a 'write' operation.
    register uint64_t a7 asm("a7") = 1;
    
    //the '__asm__volatile__' key word indicates this is an inline assembly instruction.And __volatile tells the complier not to optimize this assembly code.
    //ecall is a special RISCV instruction used to trigger a system call.
    //the 'empty output list' after colon indicates there is no output list in this case,so it's empty.
    //': "r"(a0), "r"(a6), "r"(a7)': these are input arguments,specifying the input register for the ecall. r(a0) stands for the value of resiter a0, and a6,a7 are the same as a0.
    // : "memory": this tells the compiler that this assembly code may modify the memory, so it need to ensure memory is updated correctly. In programmer's case, they often use it to tell complier not to swtich the sequence in this assembly code(if it has context), it's another way to tell complier not to optimize the code.
    __asm__ __volatile__("ecall \n\t"
                 : /* empty output list */
                 : "r"(a0), "r"(a6), "r"(a7)
                 : "memory");
}

char sbi_console_getchar()
{
    register uint64_t a6 asm("a6") = 0;
    register uint64_t a7 asm("a7") = 2;
    register uint64_t ret asm("a0");
    __asm__ __volatile__("ecall \n\t"
                 : "+r"(ret)
                 : "r"(a6), "r"(a7)
                 : "memory");
    return ret;
}

struct sbiret sbi_get_spec_version()
{
    register uint64_t a7 asm("a7") = BASE_EXTENSTION;
    register uint32_t a6 asm("a6") = 0;
    register uint64_t error asm("a0");
    register uint64_t value asm("a1");
    __asm__ __volatile__("ecall \n\t"
                 : "=r"(error), "=r"(value)
                 : "r"(a6), "r"(a7)
                 : "memory");
    return (struct sbiret){ error, value };
}

struct sbiret sbi_get_impl_id()
{
    register uint64_t a7 asm("a7") = BASE_EXTENSTION;
    register uint32_t a6 asm("a6") = 1;
    register uint64_t error asm("a0");
    register uint64_t value asm("a1");
    __asm__ __volatile__("ecall \n\t"
                 : "=r"(error), "=r"(value)
                 : "r"(a6), "r"(a7)
                 : "memory");
    return (struct sbiret){ error, value };
}

struct sbiret sbi_get_impl_version()
{
    register uint64_t a7 asm("a7") = BASE_EXTENSTION;
    register uint32_t a6 asm("a6") = 2;
    register uint64_t error asm("a0");
    register uint64_t value asm("a1");
    __asm__ __volatile__("ecall \n\t"
                 : "=r"(error), "=r"(value)
                 : "r"(a6), "r"(a7)
                 : "memory");
    return (struct sbiret){ error, value };
}

struct sbiret sbi_get_mvendorid()
{
    register uint64_t a7 asm("a7") = BASE_EXTENSTION;
    register uint32_t a6 asm("a6") = 4;
    register uint64_t error asm("a0");
    register uint64_t value asm("a1");
    __asm__ __volatile__("ecall \n\t"
                 : "=r"(error), "=r"(value)
                 : "r"(a6), "r"(a7)
                 : "memory");
    return (struct sbiret){ error, value };
}

struct sbiret sbi_probe_extension(long extension_id)
{
    register uint64_t a7 asm("a7") = BASE_EXTENSTION;
    register uint64_t a6 asm("a6") = 3;
    register uint64_t error asm("a0") = (uint64_t)extension_id;
    register uint64_t value asm("a1");
    __asm__ __volatile__("ecall \n\t"
                 : "+r"(error), "=r"(value)
                 : "r"(a6), "r"(a7)
                 : "memory");
    return (struct sbiret){ error, value };
}

void sbi_shutdown()
{
    register uint64_t a0 asm("a0") = 0;
    register uint64_t a1 asm("a1") = 0;
    register uint64_t a7 asm("a7") = RESET_EXTENTION;
    register uint64_t a6 asm("a6") = 0;
    __asm__ __volatile__("ecall \n\t"
                 : /* empty output list */
                 : "r"(a0), "r"(a1), "r"(a6), "r"(a7)
                 : "memory");
}
