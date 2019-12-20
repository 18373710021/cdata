package com.hydosky.hydoskycdata.quartz.job;

import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.hydosky.hydoskycdata.entity.CargoBreakdown;
import com.hydosky.hydoskycdata.entity.OrderInfo;
import com.hydosky.hydoskycdata.entity.ShoppingMall;
import com.hydosky.hydoskycdata.entity.SystemSetting;
import com.hydosky.hydoskycdata.quartz.service.IJobHandleService;
import com.hydosky.hydoskycdata.quartz.thread.OrderRunable;
import com.hydosky.hydoskycdata.service.ICargoBreakdownService;
import com.hydosky.hydoskycdata.service.IOrderInfoService;
import com.hydosky.hydoskycdata.service.IShoppingMallService;
import com.hydosky.hydoskycdata.service.ISystemSettingService;
import com.hydosky.hydoskycdata.util.RandomUtil;
import lombok.extern.slf4j.Slf4j;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalTime;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 订单任务
 */
@Component
@Slf4j
public class OrderJob implements Job {

    @Autowired
    IShoppingMallService shoppingMallService;

    @Autowired
    ISystemSettingService systemSettingService;

    @Autowired
    IOrderInfoService orderInfoService;

    @Autowired
    ICargoBreakdownService cargoBreakdownService;

    @Autowired
    IJobHandleService jobHandleService;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) {
        SystemSetting systemSetting = systemSettingService.getSystemSetting();
        boolean isContinue = operationCheck(systemSetting);
        if (!isContinue) {
            log.info("不再往下走了");
            return;
        }
        Integer orderNum = RandomUtil.getInt(1, systemSetting.getGenerateOrderNum());
        List<ShoppingMall> shoppingMallList = shoppingMallService.randomAccessShoppingMallList(orderNum);
        if (CollectionUtils.isEmpty(shoppingMallList)) {
            log.info("商城信息集合为空");
            return;
        }
        int shoppingMallSize = shoppingMallList.size();
        List<CargoBreakdown> cargoBreakdownList = cargoBreakdownService.getAllTwoLevelCargoBreakdown();
        if (CollectionUtils.isEmpty(cargoBreakdownList)) {
            log.info("货物品类集合为空");
            return;
        }
        Runnable orderRunable = new OrderRunable(cargoBreakdownList, systemSetting, shoppingMallList);
        ExecutorService executorService = Executors.newFixedThreadPool(3);
        for (int i = 0; i < shoppingMallSize; i++) {
            executorService.submit(orderRunable);
        }
        executorService.shutdown();
    }

    /**
     * 操作检查，根据系统配置检查本次订单生成操作是否往下走
     * 1、配置信息是否为空
     * 2、当前时间是否在上班时间内
     * 3、根据系统配置的控制基数和控制数，
     * 判断本次操作是否往下走【根据控制基数生成随机数，
     * 判断随机数是否小于等于控制数，是往下走，否则到此为止】
     * 4、判断已生成的订单数是否达标【查询当日订单数，根据系统配置中的订单数最大值和最小值来取随机值，
     * 如果当日订单数大于随机值将不再往下走，否则往下走】
     *
     * @param systemSetting
     * @return true 往下走 false 到此为止
     */
    private boolean operationCheck(SystemSetting systemSetting) {
        if (systemSetting == null) {
            log.info("系统配置信息为空");
            return false;
        }
        LocalTime currentTime = LocalTime.now();
        if (currentTime.compareTo(systemSetting.getBusinessHours()) < 0) {
            log.info("当前时间比上班时间早，本次操作到此为止");
            return false;
        }//比上班时间早
        else if (currentTime.compareTo(systemSetting.getClosingTime()) > 0) {
            log.info("当前时间比下班时间晚，本次操作到此为止");
            jobHandleService.deleteOrderJob();
            return false;
        }//比下班时间晚
        Integer cNum = RandomUtil.getInt(systemSetting.getControlBase());
        if (cNum > systemSetting.getControlNumber()) {
            log.info("本次操作到此为止");
            return false;
        }//随机数大于控制数
        //检查订单数是否达标
        int orderNumber = orderInfoService.getDayCount();
        Long randOrderNum = RandomUtil.getLong(systemSetting.getMinOrderNum(), systemSetting.getMaxOrderNum());
        if (orderNumber > randOrderNum) {
            log.info("订单数[{}]已达标准[{}]", orderNumber, randOrderNum);
            jobHandleService.deleteOrderJob();
            return false;
        }//今日订单数生成已达标
        return true;
    }
}
