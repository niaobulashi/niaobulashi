package com.niaobulashi.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.modules.sys.entity.SysRoleEntity;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 角色管理
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-12 23:22
 */
public interface SysRoleService extends IService<SysRoleEntity> {

    /**
     * 查询
     * @param params
     * @return
     */
    PageUtils queryPage(Map<String, Object> params);

    /**
     * 保存角色
     * @param role
     */
    void saveRole(SysRoleEntity role);

    /**
     * 更新角色
     * @param role
     */
    void update(SysRoleEntity role);

    /**
     * 批量删除
     * @param roleIds
     */
    void deleteBatch(Long[] roleIds);

}
