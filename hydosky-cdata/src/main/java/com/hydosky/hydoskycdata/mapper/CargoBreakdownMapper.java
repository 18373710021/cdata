package com.hydosky.hydoskycdata.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hydosky.hydoskycdata.entity.CargoBreakdown;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CargoBreakdownMapper extends BaseMapper<CargoBreakdown> {


    /**
     * 实时热门
     * @param top  前几
     * @return
     */
    List<Map<String,Object>> todayRealTimeHot(@Param("top") int top);

}