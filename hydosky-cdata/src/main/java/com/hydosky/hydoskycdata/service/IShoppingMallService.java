package com.hydosky.hydoskycdata.service;

import com.hydosky.hydoskycdata.entity.ShoppingMall;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

public interface IShoppingMallService extends IService<ShoppingMall>{

    /**
     * 随机获取商城列表
     * @param number 获取数
     * @return 商城列表(可重复)
     */
    List<ShoppingMall> randomAccessShoppingMallList(int number);

    /**
     * 今日实时热门城市
     * @return
     */
    List<Map<String, Object>> todayRealTimeHot();


}
