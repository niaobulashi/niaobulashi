package com.niaobulashi.modules.job.controller;

import com.niaobulashi.common.annotation.SysLog;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.common.utils.ResponseVo;
import com.niaobulashi.common.validator.ValidatorUtils;
import com.niaobulashi.modules.job.entity.ScheduleJobEntity;
import com.niaobulashi.modules.job.service.ScheduleJobService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 定时任务
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@RestController
@RequestMapping("/sys/schedule")
public class ScheduleJobController {
	@Autowired
	private ScheduleJobService scheduleJobService;
	
	/**
	 * 定时任务列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:schedule:list")
	public ResponseVo list(@RequestParam Map<String, Object> params){
		PageUtils page = scheduleJobService.queryPage(params);

		return ResponseVo.ok().put("page", page);
	}
	
	/**
	 * 定时任务信息
	 */
	@RequestMapping("/info/{jobId}")
	@RequiresPermissions("sys:schedule:info")
	public ResponseVo info(@PathVariable("jobId") Long jobId){
		ScheduleJobEntity schedule = scheduleJobService.getById(jobId);
		
		return ResponseVo.ok().put("schedule", schedule);
	}
	
	/**
	 * 保存定时任务
	 */
	@SysLog("保存定时任务")
	@RequestMapping("/save")
	@RequiresPermissions("sys:schedule:save")
	public ResponseVo save(@RequestBody ScheduleJobEntity scheduleJob){
		ValidatorUtils.validateEntity(scheduleJob);
		
		scheduleJobService.save(scheduleJob);
		
		return ResponseVo.ok();
	}
	
	/**
	 * 修改定时任务
	 */
	@SysLog("修改定时任务")
	@RequestMapping("/update")
	@RequiresPermissions("sys:schedule:update")
	public ResponseVo update(@RequestBody ScheduleJobEntity scheduleJob){
		ValidatorUtils.validateEntity(scheduleJob);
				
		scheduleJobService.update(scheduleJob);
		
		return ResponseVo.ok();
	}
	
	/**
	 * 删除定时任务
	 */
	@SysLog("删除定时任务")
	@RequestMapping("/delete")
	@RequiresPermissions("sys:schedule:delete")
	public ResponseVo delete(@RequestBody Long[] jobIds){
		scheduleJobService.deleteBatch(jobIds);
		
		return ResponseVo.ok();
	}
	
	/**
	 * 立即执行任务
	 */
	@SysLog("立即执行任务")
	@RequestMapping("/run")
	@RequiresPermissions("sys:schedule:run")
	public ResponseVo run(@RequestBody Long[] jobIds){
		scheduleJobService.run(jobIds);
		
		return ResponseVo.ok();
	}
	
	/**
	 * 暂停定时任务
	 */
	@SysLog("暂停定时任务")
	@RequestMapping("/pause")
	@RequiresPermissions("sys:schedule:pause")
	public ResponseVo pause(@RequestBody Long[] jobIds){
		scheduleJobService.pause(jobIds);
		
		return ResponseVo.ok();
	}
	
	/**
	 * 恢复定时任务
	 */
	@SysLog("恢复定时任务")
	@RequestMapping("/resume")
	@RequiresPermissions("sys:schedule:resume")
	public ResponseVo resume(@RequestBody Long[] jobIds){
		scheduleJobService.resume(jobIds);
		
		return ResponseVo.ok();
	}

}
