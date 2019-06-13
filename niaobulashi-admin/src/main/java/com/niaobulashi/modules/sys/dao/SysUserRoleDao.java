package com.niaobulashi.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.niaobulashi.modules.sys.entity.SysUserRoleEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: niaobulashi
 * @description: 用户与角色对应关系
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@Mapper
public interface SysUserRoleDao extends BaseMapper<SysUserRoleEntity> {
	
	/**
	 * 根据用户ID，获取角色ID列表
	 */
	List<Long> queryRoleIdList(Long userId);

	/**
	 * 根据角色ID数组，批量删除
	 */
	int deleteBatch(Long[] roleIds);
}
