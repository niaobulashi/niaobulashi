package com.niaobulashi.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.niaobulashi.modules.sys.entity.SysUserEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: niaobulashi
 * @description: 系统用户
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@Mapper
public interface SysUserDao extends BaseMapper<SysUserEntity> {
	
	/**
	 * 查询用户的所有权限
	 * @param userId  用户ID
	 */
	List<String> queryAllPerms(Long userId);
	
	/**
	 * 查询用户的所有菜单ID
	 */
	List<Long> queryAllMenuId(Long userId);

}
