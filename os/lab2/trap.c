/*
发生中断时CPU会干的事情：
- 发生例外的指令的 PC 被存入 sepc 用于恢复，且 PC 被设置为 stvec（存了中断处理程序的地址）。
- scause 根据异常类型设置，stval 被设置成出错的地址或者其它特定异常的信息字。
- 把 sstatus CSR 中的 SIE 置零，屏蔽中断，且 SIE 之前的值被保存在 SPIE 中。
- 发生例外时的权限模式被保存在 sstatus 的 SPP 域，然后设置当前模式为 S 模式。
*/

#include <riscv.h>
#include <trap.h>
#include <clock.h>
#include <sbi.h>

#define TICK_NUM 100
static inline void trap_dispatch(struct trapframe *tf);
static void print_ticks();
void idt_init(void);
void interrupt_handler(struct trapframe *tf);
void exception_handler(struct trapframe *tf);
void print_regs(struct pushregs *gpr);
void print_trapframe(struct trapframe *tf);
static void kputs(const char *msg);

static void
kputs(const char *msg)
{
    for ( ; *msg != '\0'; ++msg )
    {
        sbi_console_putchar(*msg);
    }
    sbi_console_putchar('\n');
}

void idt_init(void)
{
    extern void __alltraps(void);
    /* 设置 sscratch 寄存器为 0, 表示我们正在内核中执行
    * 我们规定：当 CPU 处于 U-Mode 时，sscratch 保存内核栈地址；处于 S-Mode 时，sscratch 为 0 。具体看文档
    */
    //write_csr(CSR_SSCRATCH, 0);
    write_csr(0x140, 0);
    /* 设置中断向量表地址，MODE=00，因为地址的最后两位四字节对齐后必为0，因此不用单独设置MODE */
    //write_csr(CSR_STVEC, &__alltraps);
    write_csr(0x105, &__alltraps);
    // 启用 interrupt，sstatus的SSTATUS_SIE位置1
    set_csr(0x100, SSTATUS_SIE);
}

/* *
 * trap - handles or dispatches an exception/interrupt. if and when trap()
 * returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void trap(struct trapframe *tf)
{
    trap_dispatch(tf);
    // kputs("Trap END");
}

/* trap_dispatch - dispatch based on what type of trap occurred */
static inline void trap_dispatch(struct trapframe *tf)
{
    if ((intptr_t)tf->cause < 0)    // interrupts，外部中断，scause最高位为1
    {
        //kputs("Interrupt Happened!");
        interrupt_handler(tf);
    }
    else    // exceptions，同步异常，scause最高位为0
    {
        kputs("Exception Happened!");
        exception_handler(tf);
    }
}

void interrupt_handler(struct trapframe *tf)
{
    intptr_t cause = (tf->cause << 1) >> 1;
    switch (cause)
    {
    case IRQ_U_SOFT:
        kputs("User software interrupt\n");
        break;
    case IRQ_S_SOFT:
        kputs("Supervisor software interrupt\n");
        break;
    case IRQ_H_SOFT:
        kputs("Hypervisor software interrupt\n");
        break;
    case IRQ_M_SOFT:
        kputs("Machine software interrupt\n");
        break;
    case IRQ_U_TIMER:
        kputs("User timer interrupt\n");
        break;
    case IRQ_S_TIMER:
        // "All bits besides SSIP and USIP in the sip register are
        // read-only." -- privileged spec1.9.1, 4.1.4, p59
        // In fact, Call sbi_set_timer will clear STIP, or you can clear it
        // directly.
        // kputs("Supervisor timer interrupt\n");
        clock_set_next_event();
        if (++ticks % TICK_NUM == 0)
        {
            print_ticks();
        }
        break;
    case IRQ_H_TIMER:
        kputs("Hypervisor timer interrupt\n");
        break;
    case IRQ_M_TIMER:
        kputs("Machine timer interrupt\n");
        break;
    case IRQ_U_EXT:
        kputs("User software interrupt\n");
        break;
    case IRQ_S_EXT:
        kputs("Supervisor external interrupt\n");
        break;
    case IRQ_H_EXT:
        kputs("Hypervisor software interrupt\n");
        break;
    case IRQ_M_EXT:
        kputs("Machine software interrupt\n");
        break;
    default:
        print_trapframe(tf);
        break;
    }
}

void exception_handler(struct trapframe *tf)
{
    switch (tf->cause)
    {
    case CAUSE_MISALIGNED_FETCH:
        kputs("misaligned fetch");
        break;
    case CAUSE_FAULT_FETCH:
        kputs("fault fetch");
        break;
    case CAUSE_ILLEGAL_INSTRUCTION:
        kputs("illegal instruction");
        break;
    case CAUSE_BREAKPOINT:
        kputs("breakpoint");
        tf->epc+=2;
        break;
    case CAUSE_MISALIGNED_LOAD:
        kputs("misaligned load");
        break;
    case CAUSE_FAULT_LOAD:
        kputs("fault load");
        break;
    case CAUSE_MISALIGNED_STORE:
        kputs("misaligned store");
        break;
    case CAUSE_FAULT_STORE:
        kputs("fault store");
        break;
    case CAUSE_USER_ECALL:
        kputs("user_ecall");
        break;
    case CAUSE_SUPERVISOR_ECALL:
        kputs("supervisor_ecall");
        break;
    case CAUSE_HYPERVISOR_ECALL:
        kputs("hypervisor_ecall");
        break;
    case CAUSE_MACHINE_ECALL:
        kputs("machine_ecall");
        break;
    default:
        print_trapframe(tf);
        break;
    }
}

void print_trapframe(struct trapframe *tf) {
    kputs("print_trapframe");
    /*
    cprintf("trapframe at %p\n", tf);
    print_regs(&tf->gpr);
    cprintf("  status   0x%08x\n", tf->status);
    cprintf("  epc      0x%08x\n", tf->epc);
    cprintf("  badvaddr 0x%08x\n", tf->badvaddr);
    cprintf("  cause    0x%08x\n", tf->cause);
    */
}

void print_regs(struct pushregs *gpr) {
    /*
    cprintf("  zero     0x%08x\n", gpr->zero);
    cprintf("  ra       0x%08x\n", gpr->ra);
    cprintf("  sp       0x%08x\n", gpr->sp);
    cprintf("  gp       0x%08x\n", gpr->gp);
    cprintf("  tp       0x%08x\n", gpr->tp);
    cprintf("  t0       0x%08x\n", gpr->t0);
    cprintf("  t1       0x%08x\n", gpr->t1);
    cprintf("  t2       0x%08x\n", gpr->t2);
    cprintf("  s0       0x%08x\n", gpr->s0);
    cprintf("  s1       0x%08x\n", gpr->s1);
    cprintf("  a0       0x%08x\n", gpr->a0);
    cprintf("  a1       0x%08x\n", gpr->a1);
    cprintf("  a2       0x%08x\n", gpr->a2);
    cprintf("  a3       0x%08x\n", gpr->a3);
    cprintf("  a4       0x%08x\n", gpr->a4);
    cprintf("  a5       0x%08x\n", gpr->a5);
    cprintf("  a6       0x%08x\n", gpr->a6);
    cprintf("  a7       0x%08x\n", gpr->a7);
    cprintf("  s2       0x%08x\n", gpr->s2);
    cprintf("  s3       0x%08x\n", gpr->s3);
    cprintf("  s4       0x%08x\n", gpr->s4);
    cprintf("  s5       0x%08x\n", gpr->s5);
    cprintf("  s6       0x%08x\n", gpr->s6);
    cprintf("  s7       0x%08x\n", gpr->s7);
    cprintf("  s8       0x%08x\n", gpr->s8);
    cprintf("  s9       0x%08x\n", gpr->s9);
    cprintf("  s10      0x%08x\n", gpr->s10);
    cprintf("  s11      0x%08x\n", gpr->s11);
    cprintf("  t3       0x%08x\n", gpr->t3);
    cprintf("  t4       0x%08x\n", gpr->t4);
    cprintf("  t5       0x%08x\n", gpr->t5);
    cprintf("  t6       0x%08x\n", gpr->t6);
    */
    kputs("print_regs");
}

/* trap_in_kernel - 检测中断是否发生在内核态，返回1=true，0=false */
int trap_in_kernel(struct trapframe *tf) {
    return (tf->status & SSTATUS_SPP) != 0; // 根据 sstatus.SPP（sstatus的左数第六位）是否为 1 来判断中断前的特权级，1为内核态，0为用户态
}

static void print_ticks() {
    /*
    cprintf("%d ticks\n", TICK_NUM);
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
*/
kputs("print_ticks");
}