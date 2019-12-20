package com.hydosky.hydoskycdata.service;

import com.hydosky.hydoskycdata.entity.CargoBreakdownOrderStats;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

public interface ICargoBreakdownOrderStatsService extends IService<CargoBreakdownOrderStats> {

    /**
     * 新增数据
     * @param twoLevelCargoBreakdown 第二级货物品类
     */
    void insert(Integer twoLevelCargoBreakdown);

    /**
     * 增量
     * @param cargoNumber 货物量 
     * @param freightNumber 运费
     * @param orderNumber   订单数
     * @param twoLevelCargoBreakdown 第二级货物品类
     */
    void addNumber(Long cargoNumber, Long freightNumber, Long orderNumber,Integer twoLevelCargoBreakdown);

    /**
     * 一级货物品类统计（水平柱图）
     * @return
     */
    List<Map<String, Object>> oneLevelCargoBreakdownStatsBar();


}
