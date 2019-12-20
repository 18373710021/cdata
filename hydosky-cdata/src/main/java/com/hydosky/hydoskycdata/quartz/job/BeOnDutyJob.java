package com.hydosky.hydoskycdata.quartz.job;

import com.hydosky.hydoskycdata.quartz.service.IJobHandleService;
import com.hydosky.hydoskycdata.service.ISystemSettingService;
import lombok.extern.slf4j.Slf4j;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 上班任务处理：创建生成订单的任务
 */
@Component
@Slf4j
public class BeOnDutyJob implements Job {

    @Autowired
    IJobHandleService jobHandleService;

    @Autowired
    ISystemSettingService systemSettingService;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) {
        try{
            jobHandleService.generateOrderJob();
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
