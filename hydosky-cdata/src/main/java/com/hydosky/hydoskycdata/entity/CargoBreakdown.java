package com.hydosky.hydoskycdata.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
@TableName(value = "t_cargo_breakdown")
public class CargoBreakdown implements Serializable {
    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 创建时间

     */
    @TableField(value = "create_time")
    private LocalDateTime createTime;

    /**
     * 最近的修改时间
     */
    @TableField(value = "latest_update_time")
    private LocalDateTime latestUpdateTime;

    /**
     * 品类名称
     */
    @TableField(value = "cargo_breakdown_name")
    private String cargoBreakdownName;

    /**
     * 级别
     */
    @TableField(value = "level")
    private Integer level;

    /**
     * 上级品类
     */
    @TableField(value = "parent_cargo_breakdown_id")
    private Integer parentCargoBreakdownId;

    /**
     * 最低价
     */
    @TableField(value = "min_price")
    private Integer minPrice;

    /**
     * 最高价
     */
    @TableField(value = "max_price")
    private Integer maxPrice;

    private static final long serialVersionUID = 1L;

    public static final String COL_ID = "id";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_LATEST_UPDATE_TIME = "latest_update_time";

    public static final String COL_CARGO_BREAKDOWN_NAME = "cargo_breakdown_name";

    public static final String COL_LEVEL = "level";

    public static final String COL_PARENT_CARGO_BREAKDOWN_ID = "parent_cargo_breakdown_id";

    public static final String COL_MIN_PRICE = "min_price";

    public static final String COL_MAX_PRICE = "max_price";
}