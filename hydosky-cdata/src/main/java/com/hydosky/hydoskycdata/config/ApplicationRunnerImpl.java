package com.hydosky.hydoskycdata.config;

import com.hydosky.hydoskycdata.quartz.common.JobDetailEnum;
import com.hydosky.hydoskycdata.quartz.service.IJobHandleService;
import com.hydosky.hydoskycdata.quartz.service.IQuartzService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

/**
 * 服务启动后执行
 */
@Component
@Slf4j
public class ApplicationRunnerImpl implements ApplicationRunner {

    @Autowired
    IQuartzService quartzService;

    @Autowired
    IJobHandleService jobHandleService;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        log.info("服务启动成功===================================");
        //检查每日订单统计任务是否存在
        check(JobDetailEnum.DAILY_ORDER_STATISTICS_JOB);
        //检查每日订单统计任务是否存在
        check(JobDetailEnum.ORDER_JOB);
    }

    /**
     * 检查任务
     *
     * @param jobDetailEnum 任务信息
     */
    private void check(JobDetailEnum jobDetailEnum) {
        log.info("检查{}任务", jobDetailEnum.getJobName());
        boolean exist = quartzService.jobExist(jobDetailEnum.getJobName(), jobDetailEnum.getJobGroup());
        if (exist) {
            log.info("{}任务已存在", jobDetailEnum.getJobName());
        } else {
            if (JobDetailEnum.ORDER_JOB.equals(jobDetailEnum)) {
                jobHandleService.generateOrderJob();
            } else if (JobDetailEnum.DAILY_ORDER_STATISTICS_JOB.equals(jobDetailEnum)) {
                jobHandleService.generateDailyOrderStatisticsJob();
            } else {
                log.error("任务异常，{}", jobDetailEnum);
            }
        }
    }
}
