package com.hydosky.hydoskycdata.quartz.service.impl;

import com.hydosky.hydoskycdata.quartz.common.JobEnum;
import com.hydosky.hydoskycdata.quartz.service.IQuartzService;
import lombok.extern.slf4j.Slf4j;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class QuartzServiceImpl implements IQuartzService {

    @Autowired
    private Scheduler scheduler;

    /**
     * 新增一个定时任务
     *
     * @param jName  任务名称
     * @param jGroup 任务组
     * @param tName  触发器名称
     * @param tGroup 触发器组
     * @param cron   cron表达式
     */
    @Override
    public void addJob(String jName, String jGroup, String tName, String tGroup, String cron, JobEnum jobEnum) {
        try {
            if (jobExist(jName, jGroup)) {
                this.deleteJob(jName, jGroup);
            }
            Class clazz = Class.forName(jobEnum.getJobClazz());
            JobDetail jobDetail = JobBuilder.newJob(clazz)
                    .withIdentity(jName, jGroup)
                    .build();
            CronTrigger trigger = TriggerBuilder.newTrigger()
                    .withIdentity(tName, tGroup)
                    .startNow()
                    .withSchedule(CronScheduleBuilder.cronSchedule(cron))
                    .build();
            scheduler.start();
            scheduler.scheduleJob(jobDetail, trigger);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 暂停定时任务
     *
     * @param jName  任务名
     * @param jGroup 任务组
     */
    @Override
    public void pauseJob(String jName, String jGroup) {
        try {
            if (jobExist(jName, jGroup)) {
                scheduler.pauseJob(JobKey.jobKey(jName, jGroup));
            } else {
                log.error("任务不存在");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 继续定时任务
     *
     * @param jName  任务名
     * @param jGroup 任务组
     */
    @Override
    public void resumeJob(String jName, String jGroup) {
        try {
            if (jobExist(jName, jGroup)) {
                scheduler.resumeJob(JobKey.jobKey(jName, jGroup));
            } else {
                log.error("任务不存在");
            }
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除定时任务
     *
     * @param jName  任务名
     * @param jGroup 任务组
     */
    @Override
    public void deleteJob(String jName, String jGroup) {
        try {
            if (jobExist(jName, jGroup)) {
                scheduler.deleteJob(JobKey.jobKey(jName, jGroup));
            } else {
                log.error("任务不存在");
            }
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean jobExist(String jName, String jGroup) {
        try {
            boolean bool = scheduler.checkExists(JobKey.jobKey(jName, jGroup));
            return bool;
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
        return false;
    }
}
