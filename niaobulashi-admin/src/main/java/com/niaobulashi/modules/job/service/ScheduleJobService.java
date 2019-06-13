package com.niaobulashi.modules.job.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.modules.job.entity.ScheduleJobEntity;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 定时任务
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
public interface ScheduleJobService extends IService<ScheduleJobEntity> {

	PageUtils queryPage(Map<String, Object> params);

	/**
	 * 保存定时任务
	 */
	void saveJob(ScheduleJobEntity scheduleJob);
	
	/**
	 * 更新定时任务
	 */
	void update(ScheduleJobEntity scheduleJob);
	
	/**
	 * 批量删除定时任务
	 */
	void deleteBatch(Long[] jobIds);
	
	/**
	 * 批量更新定时任务状态
	 */
	int updateBatch(Long[] jobIds, int status);
	
	/**
	 * 立即执行
	 */
	void run(Long[] jobIds);
	
	/**
	 * 暂停运行
	 */
	void pause(Long[] jobIds);
	
	/**
	 * 恢复运行
	 */
	void resume(Long[] jobIds);
}
