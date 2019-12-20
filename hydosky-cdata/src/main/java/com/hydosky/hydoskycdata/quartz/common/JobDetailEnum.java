package com.hydosky.hydoskycdata.quartz.common;

import lombok.Getter;

/**
 * 任务信息
 */
@Getter
public enum JobDetailEnum {
    BE_ON_DUTY_JOB("上班", "beOnDutyGroup", "beOnDutyTrigger", "beOnDutyTriggerGroup"),
    OFF_DUTY_JOB("下班", "offDutyGroup", "offDutyTrigger", "offDutyTriggerGroup"),
    ORDER_JOB("生成订单", "orderGroup", "orderTrigger", "orderTriggerGroup"),
    DAILY_ORDER_STATISTICS_JOB("每日订单统计", "dailyOrderStatisticsGroup", "dailyOrderStatisticsTrigger", "dailyOrderStatisticsTriggerGroup");


    /**
     * 任务名
     */
    private String jobName;
    /**
     * 任务组
     */
    private String jobGroup;
    /**
     * 触发器名称
     */
    private String triggerName;
    /**
     * 触发器组
     */
    private String triggerGroup;

    JobDetailEnum(String jobName, String jobGroup, String triggerName, String triggerGroup) {
        this.jobName = jobName;
        this.jobGroup = jobGroup;
        this.triggerName = triggerName;
        this.triggerGroup = triggerGroup;
    }}
