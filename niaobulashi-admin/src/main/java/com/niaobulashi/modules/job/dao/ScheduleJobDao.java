package com.niaobulashi.modules.job.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.niaobulashi.modules.job.entity.ScheduleJobEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 定时任务
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@Mapper
public interface ScheduleJobDao extends BaseMapper<ScheduleJobEntity> {
	
	/**
	 * 批量更新状态
	 */
	int updateBatch(Map<String, Object> map);
}
