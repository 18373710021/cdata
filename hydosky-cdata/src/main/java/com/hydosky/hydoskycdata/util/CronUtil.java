package com.hydosky.hydoskycdata.util;

import org.apache.commons.lang3.StringUtils;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * cron表达式工具类
 */
public class CronUtil {

    /**
     * 每天执行一次的cron表达式
     *
     * @param time 每天执行的时间 格式： HH:mm:ss 例如 09:30:00
     * @return
     */
    public static String formatLocalDate(LocalTime time) {
        String format = "ss mm HH * * ? *";
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern(format);
        String cron = null;
        if (time != null) {
            cron = time.format(dtf);
        }
        return cron;
    }

    /**
     * 将秒数转换成cron标识,最大59秒
     * 从0开始到指定的秒数执行一次；
     *
     * @param time 秒数
     * @return
     */
    public static String formatSecond(Integer time) {
        String cronArr[] = {"*", "*", "*", "*", "*", "?", "*"};
        if (time > 59) {
            time = 59;
        }
        cronArr[0] = "0/" + time;
        String cron = StringUtils.join(cronArr, " ");
        return cron;
    }

    /**
     * 将分钟数转换成cron标识,最大59分钟
     * 从0开始到指定的分钟数执行一次；
     *
     * @param time 秒数
     * @return
     */
    public static String formatMinute(Integer time) {
        String cronArr[] = {"0", "*", "*", "*", "*", "?", "*"};
        if (time > 59) {
            time = 59;
        }
        cronArr[1] = "0/" + time;
        String cron = StringUtils.join(cronArr, " ");
        return cron;
    }

}
