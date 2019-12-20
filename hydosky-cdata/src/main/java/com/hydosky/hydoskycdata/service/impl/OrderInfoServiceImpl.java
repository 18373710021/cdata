package com.hydosky.hydoskycdata.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hydosky.hydoskycdata.entity.CargoBreakdown;
import com.hydosky.hydoskycdata.entity.OrderInfo;
import com.hydosky.hydoskycdata.mapper.OrderInfoMapper;
import com.hydosky.hydoskycdata.service.*;
import com.hydosky.hydoskycdata.util.LocalDateTimeUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.Map;

@Service
@Transactional(rollbackFor = Exception.class)
@Slf4j
public class OrderInfoServiceImpl extends ServiceImpl<OrderInfoMapper, OrderInfo> implements IOrderInfoService {

    @Autowired
    ICargoBreakdownOrderStatsService cargoBreakdownOrderStatsService;

    @Autowired
    IDayOrderStatsService dayOrderStatsService;

    @Autowired
    IShoppingMallStatService shoppingMallStatService;

    @Autowired
    ISystemSettingService systemSettingService;

    @Override
    public void insert(OrderInfo orderInfo) {
        this.save(orderInfo);
        Long cargoNumber = orderInfo.getCargoNumber().longValue();
        Long freightNumber = orderInfo.getFreight();
        Long orderNumber = 1L;
        Integer twoLevelCargoBreakdown = orderInfo.getTwoLevelCargoBreakdown();
        Integer shoppingMallId = orderInfo.getShoppingMallId();
        cargoBreakdownOrderStatsService.addNumber(cargoNumber, freightNumber, orderNumber, twoLevelCargoBreakdown);
        shoppingMallStatService.addNumber(cargoNumber, freightNumber, orderNumber, shoppingMallId);
    }

    @Override
    public void insert(Integer shoppingMallId, CargoBreakdown cargoBreakdown, Integer cargoNumber, Long freight) {
        OrderInfo orderInfo = new OrderInfo();
        orderInfo.setShoppingMallId(shoppingMallId);
        orderInfo.setOneLevelCargoBreakdown(cargoBreakdown.getParentCargoBreakdownId());
        orderInfo.setTwoLevelCargoBreakdown(cargoBreakdown.getId());
        orderInfo.setCargoNumber(cargoNumber);
        orderInfo.setFreight(freight);
        this.insert(orderInfo);
    }


    @Override
    public int getDayCount() {
        LocalDate currentDate = LocalDate.now();
        LocalDateTime startTime = LocalDateTime.of(currentDate, LocalTime.MIN);
        LocalDateTime endTime = LocalDateTime.of(currentDate, LocalTime.MAX);
        int count = this.count(new QueryWrapper<OrderInfo>().lambda().ge(OrderInfo::getCreateTime, startTime).le(OrderInfo::getCreateTime, endTime));
        return count;
    }

    @Override
    public Map<String, String> toDayOrderStats() {
        LocalDate currentDate = LocalDate.now();
        String dateStr = LocalDateTimeUtil.localDateConvertDateStr(currentDate);
        return this.statisticsByDate(dateStr);
    }

    @Override
    public Map<String, String> statisticsByDate(String dateStr) {
        Map<String, String> countMap = baseMapper.statisticsByDate(dateStr);
        return countMap;
    }

    @Override
    public void deleteByDate(String dateStr) {
        log.info("删除{}的订单", dateStr);
        baseMapper.deleteByDate(dateStr);
    }
}
