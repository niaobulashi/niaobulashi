package com.niaobulashi.modules.job.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.niaobulashi.modules.job.entity.ScheduleJobLogEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * @program: niaobulashi
 * @description: 定时任务日志
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@Mapper
public interface ScheduleJobLogDao extends BaseMapper<ScheduleJobLogEntity> {
	
}
