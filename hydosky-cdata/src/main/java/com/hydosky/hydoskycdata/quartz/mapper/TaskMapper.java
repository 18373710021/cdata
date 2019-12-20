package com.hydosky.hydoskycdata.quartz.mapper;

import com.hydosky.hydoskycdata.quartz.bean.TaskEntity;

import java.util.List;

public interface TaskMapper {
    List<TaskEntity> findTaskList(TaskEntity taskEntity);
}
