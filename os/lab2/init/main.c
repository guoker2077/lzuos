#include <riscv.h>
#include <clock.h>
#include <sbi.h>
#include <kdebug.h>
#include <trap.h>
#include <plic.h>
#include <uart.h>
#include <rtc.h>
#include <dtb.h>

void my_ecall()
{
    kprintf("This is you ecall 1 , print a number into stdout:\n");
    int num = 65; // 定义一个整数变量
  __asm__ __volatile__(
    "mv a0, %0\n" // 将整数变量的值移动到a0寄存器中
    "li a7, 1\n" // 设置系统调用编号为1，表示打印整数
    "ecall\n" // 执行ecall指令，请求服务
    : // 输出操作数，无
    : "r"(num) // 输入操作数，指定寄存器
    : "a0", "a7" // 破坏列表，指定使用的寄存器
  );
  
  kprintf("\necall end\n"); 
  return ;
}

void my_illegal_ins()
{
    __asm__ __volatile__(
    "li a0, 0x12345678\n" // 设置a0寄存器为一个非法的指令地址
    "jalr x0, a0, 0\n" // 跳转到a0寄存器指向的地址，并将返回地址保存到x0寄存器（忽略）
  );
  kprintf("This line will not be executed.\n"); // 这一行不会被执行，因为前面的指令会触发异常
  return ;
}

int main(void *nothing, const void *dtb_start)
{
    kputs("\nLZU OS STARTING....................");
    print_system_infomation(); //inspect configuration,protocols,extensions
    kputs("Hello LZU OS");

    set_stvec(); //set interrupt vector table
    clock_init();
    kprintf("complete timer init\n");
    //dtb_start = (const void *)0x82200000;
    unflatten_device_tree(dtb_start);

    plic_init();
    kprintf("complete plic init\n");
    uart_init();
    kprintf("complete uart init\n");

    rtc_init();
    kprintf("timestamp now: %u\n", read_time());
    set_alarm(read_time() + 1000000000);
    kprintf("alarm time: %u\n", read_alarm());

    enable_interrupt(); // 启用 interrupt，sstatus的SSTATUS_SIE位置1

    __asm__ __volatile__("ebreak \n\t");
    //my_illegal_ins();
    //my_ecall();
    kputs("SYSTEM END");

    while (1)
        ; /* infinite loop */
    return 0;
}
