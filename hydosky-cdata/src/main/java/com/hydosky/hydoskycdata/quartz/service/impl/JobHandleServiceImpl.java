package com.hydosky.hydoskycdata.quartz.service.impl;

import com.hydosky.hydoskycdata.entity.SystemSetting;
import com.hydosky.hydoskycdata.quartz.common.JobDetailEnum;
import com.hydosky.hydoskycdata.quartz.common.JobEnum;
import com.hydosky.hydoskycdata.quartz.service.IJobHandleService;
import com.hydosky.hydoskycdata.quartz.service.IQuartzService;
import com.hydosky.hydoskycdata.service.ISystemSettingService;
import com.hydosky.hydoskycdata.util.CronUtil;
import com.hydosky.hydoskycdata.util.LocalDateTimeUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalTime;
import java.time.format.DateTimeParseException;

@Service
@Slf4j
public class JobHandleServiceImpl implements IJobHandleService {

    @Autowired
    IQuartzService quartzService;

    @Autowired
    ISystemSettingService systemSettingService;

    @Override
    public void generateOrderJob(String cron) {
        try {
            this.generateJob(JobDetailEnum.ORDER_JOB, JobEnum.ORDER_JOB, cron);
        } catch (Exception e) {
            log.error("创建生成订单任务失败");
            e.printStackTrace();
        }
    }

    @Override
    public void generateOrderJob() {
        SystemSetting systemSetting = systemSettingService.getSystemSetting();
        String cron = CronUtil.formatSecond(systemSetting.getIntervalTime());
        this.generateOrderJob(cron);
    }

    @Override
    public void deleteOrderJob() {
        try {
            JobDetailEnum jobDetailEnum = JobDetailEnum.ORDER_JOB;
            quartzService.deleteJob(jobDetailEnum.getJobName(), jobDetailEnum.getJobGroup());
        } catch (Exception e) {
            log.error("删除生成订单任务失败");
            e.printStackTrace();
        }
    }

    @Override
    public void generateBeOnDutyJob(String cron) {
        try {
            this.generateJob(JobDetailEnum.BE_ON_DUTY_JOB, JobEnum.BE_ON_DUTY_JOB, cron);
        } catch (Exception e) {
            log.error("生成上班任务失败");
            e.printStackTrace();
        }
    }

    @Override
    public void generateOffDutyJob(String cron) {
        try {
            this.generateJob(JobDetailEnum.OFF_DUTY_JOB, JobEnum.OFF_DUTY_JOB, cron);
        } catch (Exception e) {
            log.error("生成下班任务失败");
            e.printStackTrace();
        }
    }

    @Override
    public void generateDailyOrderStatisticsJob(String cron) {
        try {
            this.generateJob(JobDetailEnum.DAILY_ORDER_STATISTICS_JOB, JobEnum.DAILY_ORDER_STATISTICS_JOB, cron);
        } catch (Exception e) {
            log.error("生成下班任务失败");
            e.printStackTrace();
        }
    }

    @Override
    public void generateDailyOrderStatisticsJob() {
        LocalTime time = LocalDateTimeUtil.timeStrConvertLocalTime("01:00:00");
        String cron = CronUtil.formatLocalDate(time);
        this.generateDailyOrderStatisticsJob(cron);
    }

    /**
     * 生成任务，如果任务存在就先删除再创建
     *
     * @param jobDetailEnum 任务信息常量
     * @param jobEnum       任务
     * @param cron          cron表达式
     */
    private void generateJob(JobDetailEnum jobDetailEnum, JobEnum jobEnum, String cron) {
        boolean exist = quartzService.jobExist(jobDetailEnum.getJobName(), jobDetailEnum.getJobGroup());
        if (exist) {
            quartzService.deleteJob(jobDetailEnum.getJobName(), jobDetailEnum.getJobGroup());
        }
        quartzService.addJob(jobDetailEnum.getJobName(),
                jobDetailEnum.getJobGroup(), jobDetailEnum.getTriggerName(), jobDetailEnum.getTriggerGroup(), cron, jobEnum);
    }

}
