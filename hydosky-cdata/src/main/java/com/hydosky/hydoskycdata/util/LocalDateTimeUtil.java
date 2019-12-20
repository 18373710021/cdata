package com.hydosky.hydoskycdata.util;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * LocalDateTime工具类
 */
public class LocalDateTimeUtil {

    /**
     * 获取当前年份
     *
     * @return
     */
    public static String getCurrentYearStr() {
        LocalDateTime localDateTime = LocalDateTime.now();
        String str = localDateTime.format(DateTimeFormatter.ofPattern("yyyy"));
        return str;
    }

    /**
     * 根据时间字符串转LocalDateTime （格式：HH:mm:ss）
     *
     * @param str
     * @return
     */
    public static LocalTime timeStrConvertLocalTime(String str) {
        DateTimeFormatter df = DateTimeFormatter.ofPattern("HH:mm:ss");
        LocalTime localTime = LocalTime.parse(str, df);
        return localTime;
    }

    /**
     * LocalDate转字符串 （格式：YYYY-MM-dd）
     *
     * @param date
     * @return
     */
    public static String localDateConvertDateStr(LocalDate date) {
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String str = date.format(df);
        return str;
    }

    /**
     * 字符串转LocalDate （格式：YYYY-MM-dd）
     *
     * @param str
     * @return
     */
    public static LocalDate dateStrConvertLocalDate(String str) {
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.parse(str, df);
        return date;
    }

    /**
     * 根据时间段分割成一天天，不包括结束日期
     *
     * @param startDate 开始日期
     * @param endDate   结束日期
     * @return
     */
    public static List<String> splitDayStrToTimeSlot(LocalDate startDate, LocalDate endDate) {
        List<String> dayList = new ArrayList<>();
        while (startDate.compareTo(endDate) < 0) {
            String dateStr = LocalDateTimeUtil.localDateConvertDateStr(startDate);
            dayList.add(dateStr);
            startDate = startDate.plusDays(1L);
        }
        return dayList;
    }




}
