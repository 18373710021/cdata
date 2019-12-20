package com.hydosky.hydoskycdata.service.impl;

import com.hydosky.hydoskycdata.service.IShoppingMallStatService;
import com.hydosky.hydoskycdata.util.RandomUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.ImportAutoConfiguration;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hydosky.hydoskycdata.mapper.ShoppingMallMapper;
import com.hydosky.hydoskycdata.entity.ShoppingMall;
import com.hydosky.hydoskycdata.service.IShoppingMallService;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ShoppingMallServiceImpl extends ServiceImpl<ShoppingMallMapper, ShoppingMall> implements IShoppingMallService {

    @Autowired
    IShoppingMallStatService shoppingMallStatService;

    @Override
    public List<ShoppingMall> randomAccessShoppingMallList(int number) {
        if (number == 0) {
            return new ArrayList<>();
        }
        List<ShoppingMall> allList = this.list();
        if (CollectionUtils.isEmpty(allList)) {
            return new ArrayList<>();
        }
        allList.sort((s1, s2) -> s2.getParameter().compareTo(s1.getParameter()));
        Long count = 0L;
        for (ShoppingMall shoppingMall : allList) {
            count += shoppingMall.getParameter();
            shoppingMall.setParameterValue(count);
            shoppingMallStatService.insert(shoppingMall.getId());
        }
        List<ShoppingMall> resultList = new ArrayList<>();
        for (int i = 0; i < number; i++) {
            Long rand = RandomUtil.getLong(0L, count);
            for (ShoppingMall shoppingMall : allList) {
                if (rand.compareTo(shoppingMall.getParameterValue()) < 0) {
                    resultList.add(shoppingMall);
                    break;
                }
            }
        }
        return resultList;
    }

    @Override
    public List<Map<String, Object>> todayRealTimeHot() {
        return baseMapper.todayRealTimeHot();
    }
}
