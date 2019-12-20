package com.hydosky.hydoskycdata.quartz.job;

import com.hydosky.hydoskycdata.quartz.service.IJobHandleService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 下班任务处理
 * 删除订单生成任务
 */
public class OffDutyJob implements Job {

    @Autowired
    IJobHandleService jobHandleService;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) {
        try {
            jobHandleService.deleteOrderJob();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
