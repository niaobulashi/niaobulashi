package com.niaobulashi.modules.sys.controller;

import com.niaobulashi.common.annotation.SysLog;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.common.utils.ResponseVo;
import com.niaobulashi.common.validator.ValidatorUtils;
import com.niaobulashi.modules.sys.entity.SysConfigEntity;
import com.niaobulashi.modules.sys.service.SysConfigService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 系统配置信息
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@RestController
@RequestMapping("/sys/config")
public class SysConfigController extends AbstractController {
	@Autowired
	private SysConfigService sysConfigService;
	
	/**
	 * 所有配置列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:config:list")
	public ResponseVo list(@RequestParam Map<String, Object> params){
		PageUtils page = sysConfigService.queryPage(params);

		return ResponseVo.ok().put("page", page);
	}
	
	
	/**
	 * 配置信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("sys:config:info")
	@ResponseBody
	public ResponseVo info(@PathVariable("id") Long id){
		SysConfigEntity config = sysConfigService.getById(id);
		
		return ResponseVo.ok().put("config", config);
	}
	
	/**
	 * 保存配置
	 */
	@SysLog("保存配置")
	@RequestMapping("/save")
	@RequiresPermissions("sys:config:save")
	public ResponseVo save(@RequestBody SysConfigEntity config){
		ValidatorUtils.validateEntity(config);

		sysConfigService.saveConfig(config);
		
		return ResponseVo.ok();
	}
	
	/**
	 * 修改配置
	 */
	@SysLog("修改配置")
	@RequestMapping("/update")
	@RequiresPermissions("sys:config:update")
	public ResponseVo update(@RequestBody SysConfigEntity config){
		ValidatorUtils.validateEntity(config);
		
		sysConfigService.update(config);
		
		return ResponseVo.ok();
	}
	
	/**
	 * 删除配置
	 */
	@SysLog("删除配置")
	@RequestMapping("/delete")
	@RequiresPermissions("sys:config:delete")
	public ResponseVo delete(@RequestBody Long[] ids){
		sysConfigService.deleteBatch(ids);
		
		return ResponseVo.ok();
	}

}
