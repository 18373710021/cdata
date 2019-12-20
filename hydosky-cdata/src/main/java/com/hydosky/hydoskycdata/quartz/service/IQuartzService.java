package com.hydosky.hydoskycdata.quartz.service;

import com.hydosky.hydoskycdata.quartz.common.JobEnum;

public interface IQuartzService {

    /**
     * 新增一个定时任务
     *
     * @param jName   任务名称
     * @param jGroup  任务组
     * @param tName   触发器名称
     * @param tGroup  触发器组
     * @param cron    cron表达式
     * @param jobEnum 任务对象
     */
    void addJob(String jName, String jGroup, String tName, String tGroup, String cron, JobEnum jobEnum);

    /**
     * 暂停定时任务
     *
     * @param jName  任务名
     * @param jGroup 任务组
     */
    void pauseJob(String jName, String jGroup);

    /**
     * 继续定时任务
     *
     * @param jName  任务名
     * @param jGroup 任务组
     */
    void resumeJob(String jName, String jGroup);

    /**
     * 删除定时任务
     *
     * @param jName  任务名
     * @param jGroup 任务组
     */
    void deleteJob(String jName, String jGroup);

    /**
     * 定时任务是否存在
     *
     * @param jName  任务名
     * @param jGroup 任务组
     * @return
     */
    boolean jobExist(String jName, String jGroup);

}
