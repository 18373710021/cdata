package com.hydosky.hydoskycdata.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hydosky.hydoskycdata.entity.DayOrderStats;
import com.hydosky.hydoskycdata.mapper.DayOrderStatsMapper;
import com.hydosky.hydoskycdata.service.IDayOrderStatsService;
import com.hydosky.hydoskycdata.util.LocalDateTimeUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Service
@Transactional(rollbackFor = Exception.class)
@Slf4j
public class DayOrderStatsServiceImpl extends ServiceImpl<DayOrderStatsMapper, DayOrderStats> implements IDayOrderStatsService {

    private Set<String> daySet;

    @Override
    public DayOrderStats selectByDate(String date) {
        if (StringUtils.isBlank(date)) {
            return null;
        }
        return baseMapper.selectByDate(date);
    }

    @Override
    public void insert(String date, Long cargoNumber, Long freightNumber, Long orderNumber) {
        log.info("日期：{}/总货物量：{}/总运费：{}/总订单数：{}", date, cargoNumber, freightNumber, orderNumber);
        baseMapper.insert(date, cargoNumber, freightNumber, orderNumber);
    }

    @Override
    public Map<String, String> allOrderStats() {
        return baseMapper.allOrderStats();
    }

    @Override
    public List<Map<String, Object>> recentOrderFreightStatistics(Integer days) {
        LocalDate today = LocalDate.now();
        String endDate = LocalDateTimeUtil.localDateConvertDateStr(today);
        LocalDate otherDay = today.minusDays(days.longValue());
        String startDate = LocalDateTimeUtil.localDateConvertDateStr(otherDay);
        List<Map<String, String>> dataList = baseMapper.timeSlotFreight(startDate, endDate);
        List<Map<String, Object>> list = new ArrayList<>();
        List<String> daySet = LocalDateTimeUtil.splitDayStrToTimeSlot(otherDay, today);
        for (Map<String, String> data : dataList) {
            String date = String.valueOf(data.get("date"));
            Long freight = Long.valueOf(String.valueOf(data.get("freight_count")));
            daySet.remove(date);
            LocalDate localDate = LocalDateTimeUtil.dateStrConvertLocalDate(date);
            DateTimeFormatter df = DateTimeFormatter.ofPattern("MM.dd");
            String x = localDate.format(df);
            Map<String, Object> map = new HashMap<>();
            map.put("x", x);
            map.put("y", freight);
            map.put("s", 1);
            list.add(map);
        }
        if (daySet.size() > 0) {
            replenish(list, daySet);
        }
        return list;
    }

    @Override
    public List<String> selectDateByDateScope(LocalDate startDate, LocalDate endDate) {
        String startDateStr = LocalDateTimeUtil.localDateConvertDateStr(startDate);
        String endDateStr = LocalDateTimeUtil.localDateConvertDateStr(endDate);
        List<String> list = baseMapper.selectDateByDateScope(startDateStr, endDateStr);
        if (CollectionUtils.isEmpty(list)) {
            return new ArrayList<>();
        }
        return list;
    }

    /**
     * 补充缺失数据的日期
     *
     * @param list   数据集合
     * @param daySet 缺失数据的日期集合
     */
    private void replenish(List<Map<String, Object>> list, List<String> daySet) {
        Iterator<String> iterator = daySet.iterator();
        while (iterator.hasNext()) {
            String dateStr = iterator.next();
            LocalDate localDate = LocalDateTimeUtil.dateStrConvertLocalDate(dateStr);
            DateTimeFormatter df = DateTimeFormatter.ofPattern("MM.dd");
            String x = localDate.format(df);
            Map<String, Object> map = new HashMap<>();
            map.put("x", x);
            map.put("y", 0L);
            map.put("s", 1);
            list.add(map);
        }
    }

}
