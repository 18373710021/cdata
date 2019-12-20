package com.hydosky.hydoskycdata.quartz.job;

import com.hydosky.hydoskycdata.entity.DayOrderStats;
import com.hydosky.hydoskycdata.service.IDayOrderStatsService;
import com.hydosky.hydoskycdata.service.IOrderInfoService;
import com.hydosky.hydoskycdata.util.LocalDateTimeUtil;
import lombok.extern.slf4j.Slf4j;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.Map;

/**
 * 每日订单统计任务(第二日触发)
 */
@Component
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class DailyOrderStatisticsJob implements Job {

    @Autowired
    IOrderInfoService orderInfoService;

    @Autowired
    IDayOrderStatsService orderStatsService;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) {
        try {
            LocalDate yesterday = LocalDate.now().plusDays(-1);
            String dateStr = LocalDateTimeUtil.localDateConvertDateStr(yesterday);
            log.info("统计日期【{}】订单信息", dateStr);
            DayOrderStats dayOrderStats = orderStatsService.selectByDate(dateStr);
            if (dayOrderStats != null) {
                log.info("日期【{}】订单统计信息已存在", dateStr);
                return;
            }
            Map<String, String> statisticsMap = orderInfoService.statisticsByDate(dateStr);
            Long orderCount = Long.parseLong(String.valueOf(statisticsMap.get("order_count")));
            Long cargoCount = Long.parseLong(String.valueOf(statisticsMap.get("cargo_count")));
            Long freightCount = Long.parseLong(String.valueOf(statisticsMap.get("freight_count")));
            orderStatsService.insert(dateStr, cargoCount, freightCount, orderCount);
            orderInfoService.deleteByDate(dateStr);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("每日订单统计生成失败");
        }

    }

}
