package com.hydosky.hydoskycdata.quartz.thread;

import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.hydosky.hydoskycdata.entity.CargoBreakdown;
import com.hydosky.hydoskycdata.entity.ShoppingMall;
import com.hydosky.hydoskycdata.entity.SystemSetting;
import com.hydosky.hydoskycdata.service.IOrderInfoService;
import com.hydosky.hydoskycdata.service.impl.OrderInfoServiceImpl;
import com.hydosky.hydoskycdata.util.RandomUtil;
import com.hydosky.hydoskycdata.util.SpringUtil;
import lombok.Synchronized;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

/**
 * 订单生成线程
 */
@Slf4j
public class OrderRunable implements Runnable {

    private List<CargoBreakdown> cargoBreakdownList;
    private SystemSetting systemSetting;
    private List<ShoppingMall> shoppingMallList;
    private IOrderInfoService orderInfoService;

    public OrderRunable(List<CargoBreakdown> cargoBreakdownList, SystemSetting systemSetting, List<ShoppingMall> shoppingMallList) {
        this.cargoBreakdownList = cargoBreakdownList;
        this.systemSetting = systemSetting;
        this.shoppingMallList = shoppingMallList;
        this.orderInfoService = SpringUtil.getBean(OrderInfoServiceImpl.class);
    }

    @Override
    public void run() {
        if (CollectionUtils.isEmpty(cargoBreakdownList)) {
            log.error("货物类别信息为空");
            return;
        }
        if (systemSetting == null) {
            log.error("系统配置信息为空");
            return;
        }
        try {
            Integer shoppingMallId = getShoppingMallId();
            log.info("商城id：{}", shoppingMallId);
            if (shoppingMallId < 0) {
                log.info("商城信息集合为空");
                return;
            }
            //随机从货物品类集合中取货物品类
            CargoBreakdown cargoBreakdown = getCargoBreakdown();
            //根据货物品类的最低价和最高价，随机取范围内的值为货物运费单价
            Integer price = RandomUtil.getInt(cargoBreakdown.getMinPrice(), cargoBreakdown.getMaxPrice());
            //根据系统配置的最大货物数，取随机数为货物数量
            Integer cargoNum = RandomUtil.getInt(1, systemSetting.getGenerateCargoNum());
            //订单总运费=货物运费单价*货物量
            Long freight = price.longValue() * cargoNum.longValue();
            orderInfoService.insert(shoppingMallId, cargoBreakdown, cargoNum, freight);
        } catch (Exception e) {
            log.error("订单生成失败");
            e.printStackTrace();
        }
    }


    /**
     * 随机取商城信息集合中的一个商城id
     *
     * @return
     */
    private synchronized Integer getShoppingMallId() {
        if (CollectionUtils.isEmpty(shoppingMallList)) {
            log.info("商城信息为空");
            return -1;
        }
        log.info("商城数量：{}", shoppingMallList.size());
        Integer index = RandomUtil.getInt(shoppingMallList.size());
        ShoppingMall shoppingMall = shoppingMallList.get(index);
        shoppingMallList.remove(index);
        return shoppingMall.getId();
    }

    /**
     * 随机从货物品类集合中取货物品类
     *
     * @return
     */
    private synchronized CargoBreakdown getCargoBreakdown() {
        Integer index = RandomUtil.getInt(cargoBreakdownList.size());
        CargoBreakdown cargoBreakdown = cargoBreakdownList.get(index);
        return cargoBreakdown;
    }

}
