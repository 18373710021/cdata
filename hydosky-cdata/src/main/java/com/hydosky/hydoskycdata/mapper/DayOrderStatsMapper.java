package com.hydosky.hydoskycdata.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hydosky.hydoskycdata.entity.DayOrderStats;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public interface DayOrderStatsMapper extends BaseMapper<DayOrderStats> {

    /**
     * 根据日期查询
     *
     * @param date 日期
     * @return
     */
    DayOrderStats selectByDate(@Param("date") String date);

    /**
     * 新增数据
     *
     * @param date          日期
     * @param cargoNumber   总货物量
     * @param freightNumber 总运费
     * @param orderNumber   总订单数
     */
    void insert(@Param("date") String date, @Param("cargoNumber") Long cargoNumber, @Param("freightNumber") Long freightNumber, @Param("orderNumber") Long orderNumber);

    /**
     * 所有订单统计
     *
     * @return
     */
    Map<String, String> allOrderStats();

    /**
     * 时间段内的订单每日运费统计
     *
     * @param startDate 开始日期  2019-11-29
     * @param endDate   结束日期  2019-12-05
     * @return
     */
    List<Map<String, String>> timeSlotFreight(@Param("startDate") String startDate, @Param("endDate") String endDate);

    /**
     * 根据查询日期范围内的所有订单日期
     *
     * @param startDate 开始日期  2019-11-29
     * @param endDate   结束日期  2019-12-05
     * @return
     */
    List<String> selectDateByDateScope(@Param("startDate") String startDate, @Param("endDate") String endDate);

}