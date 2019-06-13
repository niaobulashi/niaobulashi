package com.niaobulashi.modules.job.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.common.utils.Query;
import com.niaobulashi.modules.job.dao.ScheduleJobLogDao;
import com.niaobulashi.modules.job.entity.ScheduleJobLogEntity;
import com.niaobulashi.modules.job.service.ScheduleJobLogService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 定时任务日志
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@Service("scheduleJobLogService")
public class ScheduleJobLogServiceImpl extends ServiceImpl<ScheduleJobLogDao, ScheduleJobLogEntity> implements ScheduleJobLogService {

	@Override
	public PageUtils queryPage(Map<String, Object> params) {
		String jobId = (String)params.get("jobId");

		IPage<ScheduleJobLogEntity> page = this.page(
			new Query<ScheduleJobLogEntity>().getPage(params),
			new QueryWrapper<ScheduleJobLogEntity>().like(StringUtils.isNotBlank(jobId),"job_id", jobId)
		);

		return new PageUtils(page);
	}

}
