package com.niaobulashi.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.niaobulashi.modules.sys.entity.SysRoleEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * @program: niaobulashi
 * @description: 角色管理
 * @author: hulang
 * @create: 2019-06-11 10:29
 */
@Mapper
public interface SysRoleDao extends BaseMapper<SysRoleEntity> {
}
