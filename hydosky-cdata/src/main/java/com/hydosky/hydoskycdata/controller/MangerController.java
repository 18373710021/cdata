package com.hydosky.hydoskycdata.controller;

import com.hydosky.hydoskycdata.quartz.service.IJobHandleService;
import com.hydosky.hydoskycdata.service.IDayOrderStatsService;
import com.hydosky.hydoskycdata.service.ISystemSettingService;
import com.hydosky.hydoskycdata.util.CronUtil;
import com.hydosky.hydoskycdata.util.LocalDateTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.List;

@RestController
@RequestMapping("manger")
public class MangerController {

    @Autowired
    IJobHandleService jobHandleService;

    @Autowired
    ISystemSettingService systemSettingService;

    @Autowired
    IDayOrderStatsService dayOrderStatsService;

    /**
     * 启动每日订单统计任务
     *
     * @param timeStr 触发时间 例如：01:00:00
     * @return
     */
    @GetMapping("startDailyOrderStatisticsJob")
    public String startDailyOrderStatisticsJob(String timeStr) {
        LocalTime time;
        try {
            time = LocalDateTimeUtil.timeStrConvertLocalTime(timeStr);
        } catch (DateTimeParseException e) {
            return "时间格式错误";
        }
        String cron = CronUtil.formatLocalDate(time);
        jobHandleService.generateDailyOrderStatisticsJob(cron);
        return "启动成功";
    }


    /**
     * 修改营业时间
     *
     * @param bh 上班时间  例如：09:00:00
     * @param ct 下班时间 例如：12:00:00
     * @return
     */
    @RequestMapping(value = "updateHusinessHours")
    public String updateBusinessHours(String bh, String ct) {
        try {
            LocalTime businessHours = LocalDateTimeUtil.timeStrConvertLocalTime(bh);
            LocalTime closingTime = LocalDateTimeUtil.timeStrConvertLocalTime(ct);
            if (businessHours.compareTo(closingTime) >= 0) {
                return "上班时间大于下班时间";
            }
        } catch (DateTimeParseException e) {
            return "时间格式错误";
        }
        systemSettingService.updateBusinessHours(bh, ct);
        return "设置成功";
    }

    /**
     * 初始化数据
     *
     * @param date 开始日期 2019-01-02
     */
    @RequestMapping(value = "initData")
    public String initData(String date) {
        LocalDate localDate = LocalDateTimeUtil.dateStrConvertLocalDate(date);
        LocalDate currentDate = LocalDate.now();
        if (localDate.compareTo(currentDate) >= 0) {
            return "日期大于等于今日";
        }
        List<String> existList = dayOrderStatsService.selectDateByDateScope(localDate, currentDate);
        List<String> allList = LocalDateTimeUtil.splitDayStrToTimeSlot(localDate, currentDate);
        return "操作成功";
    }


}
