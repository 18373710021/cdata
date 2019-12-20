package com.hydosky.hydoskycdata.service;

import com.hydosky.hydoskycdata.entity.ShoppingMallStat;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

public interface IShoppingMallStatService extends IService<ShoppingMallStat> {

    /**
     * 根据商城id添加数据
     * @param shoppingMallId
     */
    void insert(Integer shoppingMallId);

    /**
     * 增量
     *
     * @param cargoNumber    货物量
     * @param freightNumber  运费
     * @param orderNumber    订单数
     * @param shoppingMallId 商城id
     */
    void addNumber(Long cargoNumber, Long freightNumber, Long orderNumber, Integer shoppingMallId);


    /**
     * 今年城市货运金额统计
     * @return
     */
    List<Map<String,Object>> toYearCityFreightAmountStatistics();

    /**
     * 根据年份查询城市货运金额统计
     * @param year 年份
     * @return
     */
    List<Map<String,Object>> cityFreightAmountStatisticsByYear(String year);

    /**
     * 今年城市货物数量统计
     * @return
     */
    List<Map<String,Object>> toYearCityCargoQuantityStatisticsByYear();

    /**
     * 根据年份查询城市货物数量统计
     * @param year 年份
     * @return
     */
    List<Map<String,Object>> cityCargoQuantityStatisticsByYear(String year);
}
