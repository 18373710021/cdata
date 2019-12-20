package com.hydosky.hydoskycdata.quartz.config;


import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import java.io.IOException;
import java.util.Properties;

@Configuration
public class QuartzConfiguration {

    @Autowired
    private MyJobFactory myJobFactory;

    @Bean
    public Scheduler scheduler() throws IOException, SchedulerException {
        Scheduler scheduler = schedulerFactoryBean().getScheduler();
        return scheduler;
    }

    @Bean //将一个方法产生为Bean并交给Spring容器管理(@Bean只能用在方法上)
    public SchedulerFactoryBean schedulerFactoryBean()
            throws IOException {
        //Spring提供SchedulerFactoryBean为Scheduler提供配置信息,并被Spring容器管理其生命周期
        SchedulerFactoryBean factory = new SchedulerFactoryBean();
        //启动时更新己存在的Job，这样就不用每次修改targetObject后删除qrtz_job_details表对应记录了
        //factory.setOverwriteExistingJobs(true);
        // 延时启动(秒)
        //factory.setStartupDelay(20);
        //设置quartz的配置文件
        Properties QuartzPropertie = quartzProperties();
        factory.setQuartzProperties(QuartzPropertie);

        //设置数据源(使用系统的主数据源，覆盖propertis文件的dataSource配置)
//        factory.setDataSource(dataSource);

        //设置自定义Job Factory，用于Spring管理Job bean
        factory.setJobFactory(myJobFactory);
        return factory;
    }

    @Bean
    public Properties quartzProperties() throws IOException {
        PropertiesFactoryBean propertiesFactoryBean = new PropertiesFactoryBean();
        propertiesFactoryBean.setLocation(new ClassPathResource("/quartz.properties"));
        propertiesFactoryBean.afterPropertiesSet();
        return propertiesFactoryBean.getObject();
    }


}
