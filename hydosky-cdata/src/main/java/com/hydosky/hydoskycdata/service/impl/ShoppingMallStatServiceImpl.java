package com.hydosky.hydoskycdata.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hydosky.hydoskycdata.entity.ShoppingMallStat;
import com.hydosky.hydoskycdata.mapper.ShoppingMallStatMapper;
import com.hydosky.hydoskycdata.service.IShoppingMallStatService;
import com.hydosky.hydoskycdata.util.LocalDateTimeUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class ShoppingMallStatServiceImpl extends ServiceImpl<ShoppingMallStatMapper, ShoppingMallStat> implements IShoppingMallStatService {


    @Override
    public void insert(Integer shoppingMallId) {
        log.info("线程：{} ---添加商城操作[{}]", Thread.currentThread().getName(), shoppingMallId);
        String year = LocalDateTimeUtil.getCurrentYearStr();
        List<ShoppingMallStat> list = baseMapper.selectByShoppingMallIdAndYear(shoppingMallId, year);
        if (CollectionUtils.isEmpty(list)) {
            log.info("线程：{} ---添加商城[{}]", Thread.currentThread().getName(), shoppingMallId);
            baseMapper.initData(shoppingMallId, year);
        }

    }

    @Override
    public void addNumber(Long cargoNumber, Long freightNumber, Long orderNumber, Integer shoppingMallId) {
        String year = LocalDateTimeUtil.getCurrentYearStr();
        baseMapper.addNumber(cargoNumber, freightNumber, orderNumber, shoppingMallId, year);
    }


    @Override
    public List<Map<String, Object>> toYearCityFreightAmountStatistics() {
        int year = LocalDate.now().getYear();
        return cityFreightAmountStatisticsByYear(String.valueOf(year));
    }

    @Override
    public List<Map<String, Object>> cityFreightAmountStatisticsByYear(String year) {
        return baseMapper.cityFreightAmountStatisticsByYear(year);
    }

    @Override
    public List<Map<String, Object>> toYearCityCargoQuantityStatisticsByYear() {
        int year = LocalDate.now().getYear();
        return cityCargoQuantityStatisticsByYear(String.valueOf(year));
    }

    @Override
    public List<Map<String, Object>> cityCargoQuantityStatisticsByYear(String year) {
        return baseMapper.cityCargoQuantityStatisticsByYear(year);
    }
}
