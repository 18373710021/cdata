package com.hydosky.hydoskycdata.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hydosky.hydoskycdata.entity.ShoppingMall;

import java.util.List;
import java.util.Map;

public interface ShoppingMallMapper extends BaseMapper<ShoppingMall> {

    /**
     * 今日实时热门城市
     * @return
     */
    List<Map<String, Object>> todayRealTimeHot();

}