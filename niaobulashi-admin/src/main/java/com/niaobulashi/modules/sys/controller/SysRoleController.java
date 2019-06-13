package com.niaobulashi.modules.sys.controller;

import com.niaobulashi.common.annotation.SysLog;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.common.utils.ResponseVo;
import com.niaobulashi.common.validator.ValidatorUtils;
import com.niaobulashi.modules.sys.entity.SysRoleEntity;
import com.niaobulashi.modules.sys.service.SysRoleDeptService;
import com.niaobulashi.modules.sys.service.SysRoleMenuService;
import com.niaobulashi.modules.sys.service.SysRoleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 角色管理
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@RestController
@RequestMapping("/sys/role")
public class SysRoleController extends AbstractController {
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysRoleMenuService sysRoleMenuService;
	@Autowired
	private SysRoleDeptService sysRoleDeptService;
	
	/**
	 * 角色列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:role:list")
	public ResponseVo list(@RequestParam Map<String, Object> params){
		PageUtils page = sysRoleService.queryPage(params);

		return ResponseVo.ok().put("page", page);
	}
	
	/**
	 * 角色列表
	 */
	@RequestMapping("/select")
	@RequiresPermissions("sys:role:select")
	public ResponseVo select(){
		List<SysRoleEntity> list = sysRoleService.list();
		
		return ResponseVo.ok().put("list", list);
	}
	
	/**
	 * 角色信息
	 */
	@RequestMapping("/info/{roleId}")
	@RequiresPermissions("sys:role:info")
	public ResponseVo info(@PathVariable("roleId") Long roleId){
		SysRoleEntity role = sysRoleService.getById(roleId);
		
		//查询角色对应的菜单
		List<Long> menuIdList = sysRoleMenuService.queryMenuIdList(roleId);
		role.setMenuIdList(menuIdList);

		//查询角色对应的部门
		List<Long> deptIdList = sysRoleDeptService.queryDeptIdList(new Long[]{roleId});
		role.setDeptIdList(deptIdList);
		
		return ResponseVo.ok().put("role", role);
	}
	
	/**
	 * 保存角色
	 */
	@SysLog("保存角色")
	@RequestMapping("/save")
	@RequiresPermissions("sys:role:save")
	public ResponseVo save(@RequestBody SysRoleEntity role){
		ValidatorUtils.validateEntity(role);
		
		sysRoleService.saveRole(role);
		
		return ResponseVo.ok();
	}
	
	/**
	 * 修改角色
	 */
	@SysLog("修改角色")
	@RequestMapping("/update")
	@RequiresPermissions("sys:role:update")
	public ResponseVo update(@RequestBody SysRoleEntity role){
		ValidatorUtils.validateEntity(role);
		
		sysRoleService.update(role);
		
		return ResponseVo.ok();
	}
	
	/**
	 * 删除角色
	 */
	@SysLog("删除角色")
	@RequestMapping("/delete")
	@RequiresPermissions("sys:role:delete")
	public ResponseVo delete(@RequestBody Long[] roleIds){
		sysRoleService.deleteBatch(roleIds);
		
		return ResponseVo.ok();
	}
}
