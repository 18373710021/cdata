package com.hydosky.hydoskycdata.service;

import com.hydosky.hydoskycdata.entity.CargoBreakdown;
import com.hydosky.hydoskycdata.entity.OrderInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.util.Map;

public interface IOrderInfoService extends IService<OrderInfo> {

    /**
     * 新增
     *
     * @param orderInfo
     */
    void insert(OrderInfo orderInfo);

    /**
     * 新增
     *
     * @param shoppingMallId 商城
     * @param cargoBreakdown 二级货物品类
     * @param cargoNumber    货物量
     * @param freight        运费
     */
    void insert(Integer shoppingMallId, CargoBreakdown cargoBreakdown, Integer cargoNumber, Long freight);

    /**
     * 当日订单总数
     *
     * @return
     */
    int getDayCount();

    /**
     * 今日订单统计
     * @return
     */
    Map<String,String> toDayOrderStats();


    /**
     * 根据日期统计信息
     *
     * @param dateStr 日期字符串 例如：2019-12-02
     * @return
     */
    Map<String, String> statisticsByDate(String dateStr);


    /**
     * 根据日期删除
     *
     * @param dateStr 日期字符串 例如：2019-12-02
     */
    void deleteByDate(String dateStr);

}