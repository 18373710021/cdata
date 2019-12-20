package com.hydosky.hydoskycdata.service;

import com.hydosky.hydoskycdata.entity.SystemSetting;
import com.baomidou.mybatisplus.extension.service.IService;

import java.time.LocalTime;

public interface ISystemSettingService extends IService<SystemSetting> {

    /**
     * 获取系统配置
     *
     * @return
     */
    SystemSetting getSystemSetting();

    /**
     * 修改营业时间
     * @param businessHours 上班时间
     * @param closingTime 下班时间
     */
    void updateBusinessHours(String businessHours, String closingTime);

}
