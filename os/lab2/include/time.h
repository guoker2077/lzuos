typedef struct {
    int year;
    int month;
    int day;
    int hour;
    int minute;
    int second;
} date_t;

#include <kdebug.h>
#define SECONDS_PER_YEAR 31536000
#define SECONDS_PER_DAY 86400
#define SECONDS_PER_HOUR 3600
#define SECONDS_PER_MINUTE 60
#define BEIJING_TIME_OFFSET 8

int days_per_month[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

int is_leap_year(int year) {
    if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
        return 1;
    } else {
        return 0;
    }
}

uint64_t ns_to_sec(uint64_t ns) {
    return ns / 1000000000;
}

date_t sec_to_date(uint64_t sec) {
    date_t date;
    sec += BEIJING_TIME_OFFSET * SECONDS_PER_HOUR; // 转换为北京时间
    date.year = 1970 + sec / SECONDS_PER_YEAR; // 计算年份
    sec %= SECONDS_PER_YEAR; // 计算剩余的秒数
    if (is_leap_year(date.year)) { // 判断是否是闰年
        days_per_month[1] = 29; // 闰年二月有29天
    } else {
        days_per_month[1] = 28; // 平年二月有28天
    }
    date.day = 1 + sec / SECONDS_PER_DAY; // 计算天数
    sec %= SECONDS_PER_DAY; // 计算剩余的秒数
    date.month = 0; // 从一月开始
    while (date.day > days_per_month[date.month]) { // 计算月份
        date.day -= days_per_month[date.month]; // 减去当前月的天数
        date.month++; // 进入下一个月
    }
    date.month++; // 月份从1开始
    date.hour = sec / SECONDS_PER_HOUR; // 计算小时
    sec %= SECONDS_PER_HOUR; // 计算剩余的秒数
    date.minute = sec / SECONDS_PER_MINUTE; // 计算分钟
    date.second = sec % SECONDS_PER_MINUTE; // 计算秒钟
    return date;
}

void date_to_string(date_t date) {
    kprintf("Beijing Time: %u-%u-%u %u:%u:%u\n", date.year, date.month, date.day, date.hour, date.minute, date.second);
}

void date_func()
{
	uint64_t ns = goldfish_rtc_read_time();
    uint64_t sec = ns_to_sec(ns); // 将纳秒转换为秒
    date_t date = sec_to_date(sec); // 将秒转换为日期结构体
    date_to_string(date); // 将日期结构体转换为字符串并打印
}
