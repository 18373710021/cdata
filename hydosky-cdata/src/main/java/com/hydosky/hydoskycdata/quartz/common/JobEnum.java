package com.hydosky.hydoskycdata.quartz.common;

import com.hydosky.hydoskycdata.quartz.job.BeOnDutyJob;
import com.hydosky.hydoskycdata.quartz.job.DailyOrderStatisticsJob;
import com.hydosky.hydoskycdata.quartz.job.OffDutyJob;
import com.hydosky.hydoskycdata.quartz.job.OrderJob;
import lombok.Getter;

/**
 * 任务信息
 */
@Getter
public enum JobEnum {
    BE_ON_DUTY_JOB("buOnDutyJob", BeOnDutyJob.class.getName()),
    OFF_DUTY_JOB("offDutyJob", OffDutyJob.class.getName()),
    ORDER_JOB("orderJob", OrderJob.class.getName()),
    DAILY_ORDER_STATISTICS_JOB("DailyOrderStatisticsJob", DailyOrderStatisticsJob.class.getName());

    /**
     * 任务名称
     */
    private String jobName;
    /**
     * 任务类全路径
     */
    private String jobClazz;

    JobEnum(String jobName, String jobClazz) {
        this.jobName = jobName;
        this.jobClazz = jobClazz;
    }
}
