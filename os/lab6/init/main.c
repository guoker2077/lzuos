#include <sbi.h>
#include <kdebug.h>
#include <mm.h>
#include <trap.h>
#include <sched.h>
#include <clock.h>
#include <syscall.h>
#include <device/loader.h>
#include <fs/vfs.h>
#include <lib/sleep.h>
#include <lib/stdio.h>

int main(const char* args, const struct fdt_header *fdt)
{
    kputs("\nLZU OS STARTING....................");
    print_system_infomation();
    mem_init();
    mem_test();
    malloc_test();
    init_device_table();
    fdt_loader(fdt, driver_list);
    set_stvec();
    vfs_init();
    sched_init();
    clock_init();
    kputs("Hello LZU OS");
    usleep_queue_init();

    enable_interrupt();
    init_task0();

    syscall(NR_fork);    /* task 0 creates task 1 */
    long local = syscall(NR_getpid);
    syscall(NR_test_fork, local);
    if (local) {
        char buffer[64];
        int buffer_p;
        while (1) {
            puts("\033[1;32mroot@lzuoslab\033[0m:");
            puts("\033[1;34m"); puts("test"); puts("\033[0m"); 
            puts("$ ");
            buffer_p = 0;                       
            while (1) {
                buffer[buffer_p] = get_char();
                if (buffer[buffer_p] == '\e') {
                    buffer[buffer_p] = '^';
                    put_char(buffer[buffer_p]);
                    buffer_p += 1;
                    buffer[buffer_p] = '[';
                }
                if (buffer[buffer_p] == '\x7f') {
                    if (buffer_p) {
                        buffer_p -= 1;
                        puts("\b\e[K");
                    }
                    continue;
                }
                if (buffer[buffer_p] == '\r') {
                    buffer[buffer_p] = '\0';
                    put_char('\n');
                    break;
                }
                put_char(buffer[buffer_p]);
                buffer_p++;
            }
            if (!strcmp(buffer, "t")) {
                puts("char dev test\n");
            } else if (!strcmp(buffer, "b")) {
                syscall(NR_block);
            } else if (!strcmp(buffer, "q")) {
                syscall(NR_reset, 0);   // #define SHUTDOWN_FUNCTION 0
            } else if (!strcmp(buffer, "r")) {
                syscall(NR_reset, 1);   // #define REBOOT_FUNCTION 1
            } else {
                char *arg1 = (char *)strchr(buffer, ' ');
                if (arg1) {
                    *arg1 = '\0';
                    arg1 += 1;
                }
                if (!strcmp(buffer, "cat")) {
                    if (!arg1 || !strlen(arg1)) {
                        puts("Usage: cat [FILE]\n");
                        continue;
                    }
                    int fd = syscall(NR_open, arg1);
                    if (fd == -1) {
                        puts("cat: "); puts(arg1); puts(": No such file or directory\n");
                        continue;
                    }
                    struct vfs_stat stat;
                    syscall(NR_stat, fd, &stat);
                    char file_buffer[64];
                    syscall(NR_read, fd, file_buffer, stat.size);
                    puts(arg1); puts(": "); puts(file_buffer);
                    syscall(NR_close, fd);
                    continue;
                }
                if (buffer[0]) {
                    puts(buffer); puts(": command not found\n");
                }
            }
        }
    }
    while (1)
        ; /* infinite loop */
    return 0;
}
