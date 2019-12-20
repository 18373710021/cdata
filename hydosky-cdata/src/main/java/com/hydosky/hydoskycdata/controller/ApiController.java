package com.hydosky.hydoskycdata.controller;

import com.hydosky.hydoskycdata.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * api接口
 */
@RestController
@RequestMapping("/api")
public class ApiController {

    @Autowired
    ISystemSettingService systemSettingService;

    @Autowired
    ICargoBreakdownService cargoBreakdownService;

    @Autowired
    IShoppingMallService shoppingMallService;

    @Autowired
    IOrderInfoService orderInfoService;

    @Autowired
    IDayOrderStatsService dayOrderStatsService;

    @Autowired
    IShoppingMallStatService shoppingMallStatService;

    @Autowired
    ICargoBreakdownOrderStatsService cargoBreakdownOrderStatsService;

    //当日实时热门货物品类
    @GetMapping(value = "todayRealTimeHot")
    public List<Map<String, Object>> todayRealTimeHot(int top) {
        if (top < 1) {
            top = 10;
        }
        List<Map<String, Object>> data = cargoBreakdownService.todayRealTimeHot(top);
        return data;
    }

    /**
     * 实时热门货运城市
     *
     * @return
     */
    @GetMapping(value = "todayRealTimeHotShoppingMall")
    public List<Map<String, Object>> todayRealTimeHotShoppingMall() {
        List<Map<String, Object>> data = shoppingMallService.todayRealTimeHot();
        return data;
    }

    /**
     * 今日订单统计
     *
     * @return
     */
    @GetMapping(value = "todayOrderStats")
    public List<Map<String, String>> todayOrderStats() {
        List<Map<String, String>> list = new ArrayList<>();
        Map<String, String> statisticsMap = orderInfoService.toDayOrderStats();
        Map<String, String> map = new HashMap<>();
        String orderCountStr = String.valueOf(statisticsMap.get("order_count")) + "笔";
        String cargoCountStr = String.valueOf(statisticsMap.get("cargo_count")) + "件";
        String freightCountStr = String.valueOf(statisticsMap.get("freight_count")) + "元";
        map.put("今日订单总量", orderCountStr);
        map.put("今日订单总额", freightCountStr);
        map.put("今日货物总量", cargoCountStr);
        list.add(map);
        return list;
    }

    /**
     * 所有订单统计(历史订单总量、历史订单总额、历史货物总量)
     *
     * @return
     */
    @GetMapping(value = "orderTotal")
    public List<Map<String, String>> orderTotal() {
        //今天的所有订单统计
        Map<String, String> toDayMap = orderInfoService.toDayOrderStats();
        Long orderCount = Long.valueOf(String.valueOf(toDayMap.get("order_count")));
        Long cargoCount = Long.valueOf(String.valueOf(toDayMap.get("cargo_count")));
        Long freightCount = Long.valueOf(String.valueOf(toDayMap.get("freight_count")));
        //今天以前的所有订单统计
        Map<String, String> historyMap = dayOrderStatsService.allOrderStats();
        Long orderTotal = Long.valueOf(String.valueOf(historyMap.get("order_totoal")));
        Long cargoTotal = Long.valueOf(String.valueOf(historyMap.get("cargo_total")));
        Long freightTotal = Long.valueOf(String.valueOf(historyMap.get("freight_total")));
        List<Map<String, String>> list = new ArrayList<>();
        Map<String, String> map = new HashMap<>();
        String orderTotalStr = String.valueOf(orderTotal + orderCount) + "笔";
        String cargoTotalStr = String.valueOf(cargoTotal + cargoCount) + "件";
        String freightTotalStr = String.valueOf(freightTotal + freightCount) + "元";
        map.put("历史订单总量", orderTotalStr);
        map.put("历史订单总额", freightTotalStr);
        map.put("历史货物总量", cargoTotalStr);
        list.add(map);
        return list;
    }

    /**
     * 近期订单金额统计
     *
     * @param top 天数，往前几天
     */
    @GetMapping(value = "recentOrderFreightStatistics")
    public List<Map<String, Object>> recentOrderFreightStatistics(int top) {
        if (top < 1) {
            top = 7;
        }
        List<Map<String, Object>> list = dayOrderStatsService.recentOrderFreightStatistics(top);
        return list;
    }

    /**
     * 今年城市货运金额统计
     *
     * @return
     */
    @GetMapping(value = "toYearCityFreightAmountStatistics")
    public List<Map<String, Object>> toYearCityFreightAmountStatistics() {
        List<Map<String, Object>> list = shoppingMallStatService.toYearCityFreightAmountStatistics();
        return list;
    }

    /**
     * 今年城市货物数量统计
     *
     * @return
     */
    @GetMapping(value = "toYearCityCargoQuantityStatistics")
    public List<Map<String, Object>> toYearCityCargoQuantityStatistics() {
        List<Map<String, Object>> list = shoppingMallStatService.toYearCityCargoQuantityStatisticsByYear();
        return list;
    }

    /**
     * 全网货运品类排行
     *
     * @return
     */
    @GetMapping(value = "cargoCategoryRanking")
    public List<Map<String, Object>> cargoCategoryRanking() {
        List<Map<String, Object>> list = cargoBreakdownOrderStatsService.oneLevelCargoBreakdownStatsBar();
        return list;
    }


}
