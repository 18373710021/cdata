package com.hydosky.hydoskycdata.service;

import com.hydosky.hydoskycdata.entity.DayOrderStats;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public interface IDayOrderStatsService extends IService<DayOrderStats> {

    /**
     * 根据日期查询
     * @param date 日期 例如：2019-12-04
     * @return
     */
    DayOrderStats selectByDate(String date);


    /**
     * 新增
     * @param date 日期 例如：2019-12-04
     * @param cargoNumber 货物总量
     * @param freightNumber 运费总额
     * @param orderNumber  订单总量
     */
    void insert(String date, Long cargoNumber, Long freightNumber, Long orderNumber);


    /**
     * 所有订单统计
     * @return
     */
    Map<String,String> allOrderStats();

    /**
     * 近期订单金额统计
     * @param days 天数 往前几天（不包含今日）
     * @return
     */
    List<Map<String,Object>> recentOrderFreightStatistics(Integer days);

    /**
     * 根据查询日期范围内的所有订单日期
     *
     * @param startDate 开始日期  2019-11-29
     * @param endDate   结束日期  2019-12-05
     * @return
     */
    List<String> selectDateByDateScope(LocalDate startDate, LocalDate endDate);

}
