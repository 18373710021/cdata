package com.hydosky.hydoskycdata.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.LocalTime;

import lombok.Data;

@Data
@TableName(value = "t_system_setting")
public class SystemSetting implements Serializable {
    /**
     * 主键id自增
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 创建时间默认当前时间
     */
    @TableField(value = "create_time")
    private LocalDateTime createTime;

    /**
     * 最近的修改时间根据操作自动更新时间
     */
    @TableField(value = "latest_update_time")
    private LocalDateTime latestUpdateTime;

    /**
     * 上班时间
     */
    @TableField(value = "business_hours")
    private LocalTime businessHours;

    /**
     * 下班时间
     */
    @TableField(value = "closing_time")
    private LocalTime closingTime;

    /**
     * 最小订单数
     */
    @TableField(value = "min_order_num")
    private Long minOrderNum;

    /**
     * 最大订单数
     */
    @TableField(value = "max_order_num")
    private Long maxOrderNum;

    /**
     * 控制数
     */
    @TableField(value = "control_number")
    private Integer controlNumber;

    /**
     * 控制基数
     */
    @TableField(value = "control_base")
    private Integer controlBase;


    /**
     * 每次生成最大订单数 （0,generateOrderNum）
     */
    @TableField(value = "generate_order_num")
    private Integer generateOrderNum;

    /**
     * 每次生成最大货物数 （0,generateCargoNum）
     */
    @TableField(value = "generate_cargo_num")
    private Integer generateCargoNum;

    /**
     * 每次生成订单间隔时长（单位：秒，最大59秒）
     */
    @TableField(value = "interval_time")
    private Integer  intervalTime;

    private static final long serialVersionUID = 1L;

    public static final String COL_ID = "id";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_LATEST_UPDATE_TIME = "latest_update_time";

    public static final String COL_BUSINESS_HOURS = "business_hours";

    public static final String COL_CLOSING_TIME = "closing_time";

    public static final String COL_MIN_ORDER_NUM = "min_order_num";

    public static final String COL_MAX_ORDER_NUM = "max_order_num";
}