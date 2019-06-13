package com.niaobulashi.modules.job.controller;

import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.common.utils.ResponseVo;
import com.niaobulashi.modules.job.entity.ScheduleJobLogEntity;
import com.niaobulashi.modules.job.service.ScheduleJobLogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 定时任务日志
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@RestController
@RequestMapping("/sys/scheduleLog")
public class ScheduleJobLogController {
	@Autowired
	private ScheduleJobLogService scheduleJobLogService;
	
	/**
	 * 定时任务日志列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:schedule:log")
	public ResponseVo list(@RequestParam Map<String, Object> params){
		PageUtils page = scheduleJobLogService.queryPage(params);
		
		return ResponseVo.ok().put("page", page);
	}
	
	/**
	 * 定时任务日志信息
	 */
	@RequestMapping("/info/{logId}")
	public ResponseVo info(@PathVariable("logId") Long logId){
		ScheduleJobLogEntity log = scheduleJobLogService.getById(logId);
		
		return ResponseVo.ok().put("log", log);
	}
}
