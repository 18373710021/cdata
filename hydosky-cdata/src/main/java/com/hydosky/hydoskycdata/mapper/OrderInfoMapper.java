package com.hydosky.hydoskycdata.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hydosky.hydoskycdata.entity.OrderInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface OrderInfoMapper extends BaseMapper<OrderInfo> {

    /**
     * 根据日期统计
     *
     * @param date 日期 例如：2019-11-25
     * @return
     */
    Map<String, String> statisticsByDate(@Param("date") String date);

    /**
     * 根据日期删除
     *
     * @param date 日期 例如：2019-11-25
     */
    void deleteByDate(@Param("date") String date);


}