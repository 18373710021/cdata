package com.hydosky.hydoskycdata.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hydosky.hydoskycdata.entity.CargoBreakdownOrderStats;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CargoBreakdownOrderStatsMapper extends BaseMapper<CargoBreakdownOrderStats> {

    /**
     * 增量
     *
     * @param cargoNumber            货物量
     * @param freightNumber          运费
     * @param orderNumber            订单数
     * @param twoLevelCargoBreakdown 第二级货物品类
     */
    void addNumber(@Param("cargoNumber") Long cargoNumber, @Param("freightNumber") Long freightNumber, @Param("orderNumber") Long orderNumber,
                   @Param("twoLevelCargoBreakdown") Integer twoLevelCargoBreakdown);

    /**
     * 初始化数据
     * @param oneLevelCargoBreakdown
     * @param twoLevelCargoBreakdown
     */
    void initData(@Param("oneLevelCargoBreakdown") Integer oneLevelCargoBreakdown, @Param("twoLevelCargoBreakdown") Integer twoLevelCargoBreakdown);

    /**
     * 一级货物品类统计（水平柱图）
     * @return
     */
    List<Map<String, Object>> oneLevelCargoBreakdownStatsBar();
}