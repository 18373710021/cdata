package com.hydosky.hydoskycdata.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
@TableName(value = "t_shopping_mall")
public class ShoppingMall implements Serializable {
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
     * 商城名称
     */
    @TableField(value = "shopping_mall_name")
    private String shoppingMallName;

    /**
     * 所属省份
     */
    @TableField(value = "province_name")
    private String provinceName;

    /**
     * 所属城市
     */
    @TableField(value = "city_name")
    private String cityName;

    /**
     * 经度
     */
    @TableField(value = "longitude")
    private Double longitude;

    /**
     * 纬度
     */
    @TableField(value = "latitude")
    private Double latitude;

    /**
     * 参数值
     */
    @TableField(value = "parameter")
    private Integer parameter;

    @TableField(exist = false)
    private Long parameterValue;

    private static final long serialVersionUID = 1L;

    public static final String COL_ID = "id";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_LATEST_UPDATE_TIME = "latest_update_time";

    public static final String COL_SHOPPING_MALL_NAME = "shopping_mall_name";

    public static final String COL_PROVINCE_NAME = "province_name";

    public static final String COL_CITY_NAME = "city_name";

    public static final String COL_LONGITUDE = "longitude";

    public static final String COL_LATITUDE = "latitude";

    public static final String COL_PARAMETER = "parameter";
}