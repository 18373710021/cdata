package com.hydosky.hydoskycdata.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hydosky.hydoskycdata.entity.CargoBreakdown;
import com.hydosky.hydoskycdata.service.ICargoBreakdownService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hydosky.hydoskycdata.mapper.CargoBreakdownOrderStatsMapper;
import com.hydosky.hydoskycdata.entity.CargoBreakdownOrderStats;
import com.hydosky.hydoskycdata.service.ICargoBreakdownOrderStatsService;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

@Service
@Transactional(rollbackFor = Exception.class)
@Slf4j
public class CargoBreakdownOrderStatsServiceImpl extends ServiceImpl<CargoBreakdownOrderStatsMapper, CargoBreakdownOrderStats> implements ICargoBreakdownOrderStatsService {

    @Autowired
    ICargoBreakdownService cargoBreakdownService;

    @Override
    public void insert(Integer twoLevelCargoBreakdown) {
        List<CargoBreakdownOrderStats> list = this.list(new QueryWrapper<CargoBreakdownOrderStats>()
                .lambda().eq(CargoBreakdownOrderStats::getTwoLevelCargoBreakdown, twoLevelCargoBreakdown));
        if (CollectionUtils.isEmpty(list)) {
            CargoBreakdown cargoBreakdown = cargoBreakdownService.getOneByTwo(twoLevelCargoBreakdown);
            baseMapper.initData(cargoBreakdown.getId(), twoLevelCargoBreakdown);
        }
    }

    @Override
    public void addNumber(Long cargoNumber, Long freightNumber, Long orderNumber, Integer twoLevelCargoBreakdown) {
        List<CargoBreakdownOrderStats> list = this.list(new QueryWrapper<CargoBreakdownOrderStats>()
                .lambda().eq(CargoBreakdownOrderStats::getTwoLevelCargoBreakdown, twoLevelCargoBreakdown));
        if (CollectionUtils.isEmpty(list)) {
            log.info("货物品类统计信息为空");
            return;
        }
        baseMapper.addNumber(cargoNumber, freightNumber, orderNumber, twoLevelCargoBreakdown);
    }

    @Override
    public List<Map<String, Object>> oneLevelCargoBreakdownStatsBar() {
        List<Map<String, Object>> list = baseMapper.oneLevelCargoBreakdownStatsBar();
        if(CollectionUtils.isEmpty(list)){
            return new ArrayList<>();
        }
        return list;
    }
}
