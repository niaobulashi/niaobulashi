package com.niaobulashi.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.niaobulashi.modules.sys.entity.SysRoleMenuEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: niaobulashi
 * @description: 角色与菜单对应关系
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@Mapper
public interface SysRoleMenuDao extends BaseMapper<SysRoleMenuEntity> {
	
	/**
	 * 根据角色ID，获取菜单ID列表
	 */
	List<Long> queryMenuIdList(Long roleId);

	/**
	 * 根据角色ID数组，批量删除
	 */
	int deleteBatch(Long[] roleIds);
}
