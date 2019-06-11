package com.niaobulashi.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.niaobulashi.modules.sys.entity.SysRoleDeptEntity;

import java.util.List;

/**
 * @program: niaobulashi
 * @description: 角色与部门对应关系
 * @author: hulang
 * @create: 2019-06-11 10:36
 */
public interface SysRoleDeptService extends IService<SysRoleDeptEntity> {

    /**
     * 保存并更新
     * @param roleId
     * @param deptIdList
     */
    void saveOrUpdate(Long roleId, List<Long> deptIdList);

    /**
     * 根据角色ID，获取部门ID列表
     * @param roleIds
     * @return
     */
    List<Long> queryDeptIdList(Long[] roleIds);

    /**
     * 根据角色ID数组，批量删除
     * @param roleIds
     * @return
     */
    int deleteBatch(Long[] roleIds);
}
