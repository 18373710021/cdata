## 使用文档

配置数据库源

application.yaml和quartz.properties两文件中的数据库地址都要修改

![image-20191220183702327](doc\img\image-20191220183702327.png)

![image-20191220183719104](doc\img\image-20191220183719104.png)

配置端口

修改application.yaml文件

![image-20191220183830494](doc\img\image-20191220183830494.png)

启动类

```java
com.hydosky.hydoskycdata.HydoskyCdataApplication
```

### 管理接口文档



### 统计接口文档

---

#### 1\. 当日实时热门货物品类

###### URL
> ```
> /api/todayRealTimeHot
> ```

###### 支持格式
> JSON

###### HTTP请求方式
> GET

###### 请求参数
> |参数|必选|类型|说明|
|:-----  |:-------|:-----|-----                               |
|top    |true    |int|排名前几                          |

###### 返回字段
> |返回字段|字段类型|说明                              |
|:-----   |:------|:-----------------------------   |
|value   |int    |货物量   |
|content  |string | 货物类名                  |

###### 接口示例
> 地址：http://47.106.14.121:666/api/todayRealTimeHot?top=10
``` javascript
[
    {
        "value": 159,
        "content": "水暖五金"
    },
    {
        "value": 154,
        "content": "汽车电器"
    }
]
```

#### 2\. 实时热门货运城市

###### URL
> ```
> /api/todayRealTimeHotShoppingMall
> ```

###### 支持格式
> JSON

###### HTTP请求方式
> GET

###### 请求参数
> 

###### 返回字段
> |返回字段|字段类型|说明                              |
> |:----:   |:-----:|:----------------------------:   |
> |name   |string    |城市   |
> |lng  |double | 经度                |
> |lat |double | 纬度 |
> |value |double | 订单数 |
> |type |string | 类型，默认1 |

###### 接口示例
> 地址：http://47.106.14.121:666/api/todayRealTimeHotShoppingMall
``` javascript
[
    {
        "lng": 104.722408,
        "name": "绵阳",
        "type": "1",
        "value": 545,
        "lat": 31.441036
    },
    {
        "lng": 114.877755,
        "name": "赣州",
        "type": "1",
        "value": 319,
        "lat": 25.758279
    }
]
```

#### 3\. 今日订单统计信息

###### URL
> ```
> /api/todayOrderStats
> ```

###### 支持格式
> JSON

###### HTTP请求方式
> GET

###### 请求参数
> 

###### 返回字段
> 

###### 接口示例
> 地址：http://47.106.14.121:666/api/todayOrderStats
``` javascript
[
    {
        "今日订单总量": "1524笔",
        "今日订单总额": "391261元",
        "今日货物总量": "3763件"
    }
]
```

#### 4\. 历史订单统计信息

###### URL
> ```
> /api/orderTotal
> ```

###### 支持格式
> JSON

###### HTTP请求方式
> GET

###### 请求参数
> 

###### 返回字段
> 

###### 接口示例
> 地址：http://47.106.14.121:666/api/orderTotal
``` javascript
[
    {
        "历史订单总额": "4294308元",
        "历史订单总量": "27190笔",
        "历史货物总量": "67639件"
    }
]
```

#### 5\. 近期订单金额统计

###### URL
> ```
> /api/recentOrderFreightStatistics
> ```

###### 支持格式
> JSON

###### HTTP请求方式
> GET

###### 请求参数
> |参数|必选|类型|说明|
|:-----  |:-------|:-----|-----                               |
|top    |true    |int|前几天                          |

###### 返回字段
> |返回字段|字段类型|说明                              |
|:-----   |:------|:-----------------------------   |
|x   |string    |日期   |
|y  |int | 订单金额              |

###### 接口示例
> 地址：http://47.106.14.121:666/api/recentOrderFreightStatistics?top=7
``` javascript
[
    {
        "s": 1,
        "x": "12.13",
        "y": 416190
    },
    {
        "s": 1,
        "x": "12.14",
        "y": 385512
    }
]
```

#### 6\. 今年城市货运金额统计

###### URL
> ```
> /api/toYearCityFreightAmountStatistics
> ```

###### 支持格式
> JSON

###### HTTP请求方式
> GET

###### 请求参数
> 

###### 返回字段
> |返回字段|字段类型|说明                              |
|:-----   |:------|:-----------------------------   |
|x   |string    |城市   |
|y  |int | 货运金额              |

###### 接口示例
> 地址：http://47.106.14.121:666/api/toYearCityFreightAmountStatistics
``` javascript
[
    {
        "x": "兰州",
        "y": 562118
    },
    {
        "x": "柳州",
        "y": 505403
    }
]
```

#### 7\. 今年城市货物数量统计

###### URL
> ```
> /api/toYearCityCargoQuantityStatistics
> ```

###### 支持格式
> JSON

###### HTTP请求方式
> GET

###### 请求参数
> 

###### 返回字段
> |返回字段|字段类型|说明                              |
|:-----   |:------|:-----------------------------   |
|x   |String    |城市   |
|y  |int | 货物量              |

###### 接口示例
> 地址：http://47.106.14.121:666/api/toYearCityCargoQuantityStatistics
``` javascript
[
    {
        "x": "兰州",
        "y": 8883
    },
    {
        "x": "柳州",
        "y": 7948
    }
]
```

#### 8\. 全网货运品类排行

###### URL
> ```
> /api/cargoCategoryRanking
> ```

###### 支持格式
> JSON

###### HTTP请求方式
> GET

###### 请求参数
> 

###### 返回字段
> |返回字段|字段类型|说明                              |
|:-----   |:------|:-----------------------------   |
|x   |string    |一级货物品类   |
|y  |int | 货物量               |

###### 接口示例
> 地址：http://47.106.14.121:666/api/todayRealTimeHot?top=10
``` javascript
[
    {
        "x": "日用百货",
        "y": 1102318
    },
    {
        "x": "建材家居",
        "y": 988727
    }
]
```