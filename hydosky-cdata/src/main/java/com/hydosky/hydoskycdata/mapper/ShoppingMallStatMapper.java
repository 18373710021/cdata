package com.hydosky.hydoskycdata.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hydosky.hydoskycdata.entity.ShoppingMallStat;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ShoppingMallStatMapper extends BaseMapper<ShoppingMallStat> {

    /**
     * 根据商城id
     *
     * @param shoppingMallId
     * @param year
     * @return
     */
    List<ShoppingMallStat> selectByShoppingMallIdAndYear(@Param("shoppingMallId") Integer shoppingMallId, @Param("year") String year);

    /**
     * 初始化数据
     *
     * @param shoppingMallId
     * @param year
     */
    void initData(@Param("shoppingMallId") Integer shoppingMallId, @Param("year") String year);

    void addNumber(@Param("cargoNumber") Long cargoNumber, @Param("freightNumber") Long freightNumber,
                   @Param("orderNumber") Long orderNumber, @Param("shoppingMallId") Integer shoppingMallId, @Param("year") String year);


    /**
     * 根据年份查询城市货运金额统计
     *
     * @param year 年份
     * @return
     */
    List<Map<String, Object>> cityFreightAmountStatisticsByYear(@Param("year") String year);

    /**
     * 根据年份查询城市货物数量统计
     *
     * @param year 年份
     * @return
     */
    List<Map<String, Object>> cityCargoQuantityStatisticsByYear(@Param("year") String year);
}