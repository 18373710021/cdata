package com.hydosky.hydoskycdata.service;

import com.hydosky.hydoskycdata.entity.CargoBreakdown;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ICargoBreakdownService extends IService<CargoBreakdown>{

    /**
     * 根据二级货物品类获取一级货物品类
     * @param id  级货物品类id
     * @return
     */
    CargoBreakdown getOneByTwo(Integer id);

    /**
     * 获取所有二级货物品类
     * @return
     */
    List<CargoBreakdown> getAllTwoLevelCargoBreakdown();

    /**
     * 实时热门
     * @param top  前几
     * @return
     */
    List<Map<String,Object>> todayRealTimeHot(int top);

}
