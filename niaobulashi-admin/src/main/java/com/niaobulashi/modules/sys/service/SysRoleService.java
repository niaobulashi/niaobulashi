package com.niaobulashi.modules.sys.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.modules.sys.entity.SysRoleEntity;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 系统配置信息
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
public interface SysRoleService extends IService<SysRoleEntity> {

	PageUtils queryPage(Map<String, Object> params);

	void saveRole(SysRoleEntity role);

	void update(SysRoleEntity role);
	
	void deleteBatch(Long[] roleIds);

}
