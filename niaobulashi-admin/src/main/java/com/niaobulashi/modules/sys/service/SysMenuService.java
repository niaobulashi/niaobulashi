package com.niaobulashi.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.niaobulashi.modules.sys.entity.SysMenuEntity;

import java.util.List;

/**
 * @program: niaobulashi
 * @description: 系统配置信息
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-13 21:19
 */
public interface SysMenuService extends IService<SysMenuEntity> {

	/**
	 * 根据父菜单，查询子菜单
	 * @param parentId 父菜单ID
	 * @param menuIdList  用户菜单ID
	 */
	List<SysMenuEntity> queryListParentId(Long parentId, List<Long> menuIdList);

	/**
	 * 根据父菜单，查询子菜单
	 * @param parentId 父菜单ID
	 */
	List<SysMenuEntity> queryListParentId(Long parentId);
	
	/**
	 * 获取不包含按钮的菜单列表
	 */
	List<SysMenuEntity> queryNotButtonList();
	
	/**
	 * 获取用户菜单列表
	 */
	List<SysMenuEntity> getUserMenuList(Long userId);

	/**
	 * 删除
	 */
	void delete(Long menuId);
}
