package com.hydosky.hydoskycdata.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.hydosky.hydoskycdata.service.ICargoBreakdownOrderStatsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hydosky.hydoskycdata.entity.CargoBreakdown;
import com.hydosky.hydoskycdata.mapper.CargoBreakdownMapper;
import com.hydosky.hydoskycdata.service.ICargoBreakdownService;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@Transactional(rollbackFor = Exception.class)
@Slf4j
public class CargoBreakdownServiceImpl extends ServiceImpl<CargoBreakdownMapper, CargoBreakdown> implements ICargoBreakdownService {

    @Autowired
    ICargoBreakdownOrderStatsService cargoBreakdownOrderStatsService;

    @Override
    public CargoBreakdown getOneByTwo(Integer id) {
        CargoBreakdown two = this.getById(id);
        if (two == null) {
            throw new RuntimeException("二级货物品类不存在");
        }
        Integer oneId = two.getParentCargoBreakdownId();
        log.info("二级货物品类[{}]的一级货物品类为：{}", id, oneId);
        CargoBreakdown one = this.getById(oneId);
        if (one == null) {
            throw new RuntimeException("一级货物品类不存在");
        }
        return one;
    }

    @Override
    public List<CargoBreakdown> getAllTwoLevelCargoBreakdown() {
        List<CargoBreakdown> list = this.list(new QueryWrapper<CargoBreakdown>().lambda().eq(CargoBreakdown::getLevel, 2));
        if (CollectionUtils.isEmpty(list)) {
            list = new ArrayList();
        }
        for (CargoBreakdown cargoBreakdown : list) {
            cargoBreakdownOrderStatsService.insert(cargoBreakdown.getId());
        }
        return list;
    }

    @Override
    public List<Map<String, Object>> todayRealTimeHot(int top) {
        if (top < 1) {
            return new ArrayList<>();
        }
        return baseMapper.todayRealTimeHot(top);
    }
}
