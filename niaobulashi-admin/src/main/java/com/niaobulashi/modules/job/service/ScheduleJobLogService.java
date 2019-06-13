package com.niaobulashi.modules.job.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.modules.job.entity.ScheduleJobLogEntity;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 定时任务日志
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
public interface ScheduleJobLogService extends IService<ScheduleJobLogEntity> {

	PageUtils queryPage(Map<String, Object> params);
	
}
