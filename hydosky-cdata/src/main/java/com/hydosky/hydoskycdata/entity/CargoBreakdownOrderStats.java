package com.hydosky.hydoskycdata.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
@TableName(value = "t_cargo_breakdown_order_stats")
public class CargoBreakdownOrderStats implements Serializable {
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
     * 货物总量
     */
    @TableField(value = "cargo_count")
    private Long cargoCount;

    /**
     * 运费总额
     */
    @TableField(value = "freight_count")
    private Long freightCount;

    /**
     * 订单总量
     */
    @TableField(value = "order_count")
    private Long orderCount;

    private static final long serialVersionUID = 1L;

    public static final String COL_ID = "id";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_LATEST_UPDATE_TIME = "latest_update_time";

    public static final String COL_ONE_LEVEL_CARGO_BREAKDOWN = "one_level_cargo_breakdown";

    public static final String COL_TWO_LEVEL_CARGO_BREAKDOWN = "two_level_cargo_breakdown";

    public static final String COL_CARGO_COUNT = "cargo_count";

    public static final String COL_FREIGHT_COUNT = "freight_count";

    public static final String COL_ORDER_COUNT = "order_count";
}