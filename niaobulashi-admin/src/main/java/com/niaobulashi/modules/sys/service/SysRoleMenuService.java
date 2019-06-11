package com.niaobulashi.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.niaobulashi.modules.sys.entity.SysRoleMenuEntity;

import java.util.List;

/**
 * @Auther: hulang
 * @Date: 2019/6/11 23:36
 * @Description: 角色与菜单对应关系
 */
public interface SysRoleMenuService extends IService<SysRoleMenuEntity> {

    /**
     * 保存并更新
     * @param roleId
     * @param menuIdList
     */
    void saveOrUpdate(Long roleId, List<Long> menuIdList);

    /**
     * 根据角色ID，获取菜单ID列表
     * @param roleId
     * @param deleteFlag
     * @return
     */
    List<Long> queryMenuIdList(Long roleId, String deleteFlag);

    /**
     * 根据角色ID数组，批量删除
     * @param roleIds
     * @return
     */
    int deleteBatch(Long[] roleIds);
}
