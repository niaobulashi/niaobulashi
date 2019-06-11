package com.niaobulashi.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.niaobulashi.modules.sys.entity.SysRoleMenuEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: niaobulashi
 * @description: 角色与菜单对应关系
 * @author: hulang
 * @create: 2019-06-11 10:08
 */
@Mapper
public interface SysRoleMenuDao extends BaseMapper<SysRoleMenuEntity> {

    /**
     * 根据角色ID，获取菜单ID
     * @param roleId
     * @return
     */
    List<Long> queryMenuIdList(Long roleId, String deleteFlag);

    /**
     * 根据角色ID，批量删除
     * @param roleIds
     * @return
     */
    int deleteBatch(Long[] roleIds);
}
