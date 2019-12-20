package com.hydosky.hydoskycdata.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hydosky.hydoskycdata.entity.SystemSetting;
import org.apache.ibatis.annotations.Param;

import java.time.LocalTime;

public interface SystemSettingMapper extends BaseMapper<SystemSetting> {

    /**
     * 获取配置信息，修改时间最新的一条数据
     * @return
     */
    SystemSetting getSystemSetting();

    /**
     * 修改上下班时间
     * @param businessHours 上班时间
     * @param closingTime 下班时间
     * @param id
     */
    void updatebusinessHours(@Param("businessHours") String businessHours,@Param("closingTime") String closingTime,@Param("id") Integer id);

}