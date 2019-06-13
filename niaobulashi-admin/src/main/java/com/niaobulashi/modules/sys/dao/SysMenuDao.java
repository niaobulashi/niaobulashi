package com.niaobulashi.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.niaobulashi.modules.sys.entity.SysMenuEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: niaobulashi
 * @description: 菜单管理
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
@Mapper
public interface SysMenuDao extends BaseMapper<SysMenuEntity> {
	
	/**
	 * 根据父菜单，查询子菜单
	 * @param parentId 父菜单ID
	 */
	List<SysMenuEntity> queryListParentId(Long parentId);
	
	/**
	 * 获取不包含按钮的菜单列表
	 */
	List<SysMenuEntity> queryNotButtonList();

}
