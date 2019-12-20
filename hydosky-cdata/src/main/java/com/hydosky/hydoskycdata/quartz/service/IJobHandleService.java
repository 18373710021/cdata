package com.hydosky.hydoskycdata.quartz.service;

/**
 * 任务处理
 */
public interface IJobHandleService {

    /**
     * 生成订单任务，如果任务存在就先删除再创建
     */
    void generateOrderJob(String cron);

    /**
     * 生成订单任务，如果任务存在就先删除再创建
     */
    void generateOrderJob();

    /**
     * 删除订单任务
     */
    void deleteOrderJob();

    /**
     * 生成上班任务，如果任务存在就先删除再创建
     */
    void generateBeOnDutyJob(String cron);

    /**
     * 生成下班任务，如果任务存在就先删除再创建
     */
    void generateOffDutyJob(String cron);

    /**
     * 生成每日订单统计任务，如果任务存在就先删除再创建
     */
    void generateDailyOrderStatisticsJob(String cron);

    /**
     * 生成每日订单统计任务，如果任务存在就先删除再创建,默认凌晨1点执行
     */
    void generateDailyOrderStatisticsJob();
}
