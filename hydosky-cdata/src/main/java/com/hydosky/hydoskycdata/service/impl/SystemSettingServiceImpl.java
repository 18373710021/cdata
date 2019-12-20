package com.hydosky.hydoskycdata.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hydosky.hydoskycdata.quartz.service.IJobHandleService;
import com.hydosky.hydoskycdata.util.CronUtil;
import com.hydosky.hydoskycdata.util.LocalDateTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hydosky.hydoskycdata.mapper.SystemSettingMapper;
import com.hydosky.hydoskycdata.entity.SystemSetting;
import com.hydosky.hydoskycdata.service.ISystemSettingService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

@Service
@Transactional(rollbackFor = Exception.class)
public class SystemSettingServiceImpl extends ServiceImpl<SystemSettingMapper, SystemSetting> implements ISystemSettingService {

    @Autowired
    IJobHandleService jobHandleService;

    @Override
    public SystemSetting getSystemSetting() {
        SystemSetting systemSetting = baseMapper.getSystemSetting();
        if (systemSetting == null) {
            log.error("系统配置为空");
            systemSetting = new SystemSetting();
            systemSetting.setBusinessHours(LocalDateTimeUtil.timeStrConvertLocalTime("09:00:00"));
            systemSetting.setClosingTime(LocalDateTimeUtil.timeStrConvertLocalTime("12:30:00"));
            systemSetting.setMinOrderNum(1500L);
            systemSetting.setMaxOrderNum(1700L);
            systemSetting.setControlBase(100);
            systemSetting.setControlNumber(30);
            systemSetting.setGenerateOrderNum(5);
            systemSetting.setGenerateCargoNum(5);
            systemSetting.setIntervalTime(2);
            this.save(systemSetting);
        }
        return systemSetting;
    }

    @Override
    public void updateBusinessHours(String businessHours, String closingTime) {
        SystemSetting systemSetting = this.getSystemSetting();
        baseMapper.updatebusinessHours(businessHours, closingTime, systemSetting.getId());
        LocalTime businessHoursTime = LocalDateTimeUtil.timeStrConvertLocalTime(businessHours);
        LocalTime closingTimeTime = LocalDateTimeUtil.timeStrConvertLocalTime(closingTime);
        String businessHoursCron = CronUtil.formatLocalDate(businessHoursTime);
        String closingTimeCron = CronUtil.formatLocalDate(closingTimeTime);
        jobHandleService.generateBeOnDutyJob(businessHoursCron);
        jobHandleService.generateOffDutyJob(closingTimeCron);
        LocalTime currentTime = LocalTime.now();
        if (currentTime.compareTo(closingTimeTime) >= 0) {
            jobHandleService.deleteOrderJob();
        } else if (currentTime.compareTo(businessHoursTime) > 0) {
            jobHandleService.generateOrderJob();
        }
    }
}
