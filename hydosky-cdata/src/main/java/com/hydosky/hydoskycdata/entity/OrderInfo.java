package com.hydosky.hydoskycdata.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
@TableName(value = "t_order_info")
public class OrderInfo implements Serializable {

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
     * 一级货物品类
     */
    @TableField(value = "one_level_cargo_breakdown")
    private Integer oneLevelCargoBreakdown;

    /**
     * 二级货物品类
     */
    @TableField(value = "two_level_cargo_breakdown")
    private Integer twoLevelCargoBreakdown;

    /**
     * 货物数量
     */
    @TableField(value = "cargo_number")
    private Integer cargoNumber;

    /**
     * 运费
     */
    @TableField(value = "freight")
    private Long freight;

    /**
     * 所属商城
     */
    @TableField(value = "shopping_mall_id")
    private Integer shoppingMallId;

    private static final long serialVersionUID = 1L;

    public static final String COL_ID = "id";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_LATEST_UPDATE_TIME = "latest_update_time";

    public static final String COL_ONE_LEVEL_CARGO_BREAKDOWN = "one_level_cargo_breakdown";

    public static final String COL_TWO_LEVEL_CARGO_BREAKDOWN = "two_level_cargo_breakdown";

    public static final String COL_CARGO_NUMBER = "cargo_number";

    public static final String COL_FREIGHT = "freight";

    public static final String COL_SHOPPING_MALL_ID = "shopping_mall_id";
}