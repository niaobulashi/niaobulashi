package com.niaobulashi.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.niaobulashi.modules.sys.entity.SysRoleDeptEntity;

import java.util.List;

/**
 * @program: niaobulashi
 * @description: 角色与部门对应关系
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
public interface SysRoleDeptService extends IService<SysRoleDeptEntity> {
	
	void saveOrUpdate(Long roleId, List<Long> deptIdList);
	
	/**
	 * 根据角色ID，获取部门ID列表
	 */
	List<Long> queryDeptIdList(Long[] roleIds) ;

	/**
	 * 根据角色ID数组，批量删除
	 */
	int deleteBatch(Long[] roleIds);
}
