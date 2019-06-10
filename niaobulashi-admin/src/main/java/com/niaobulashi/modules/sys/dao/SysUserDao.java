package com.niaobulashi.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.niaobulashi.modules.sys.entity.SysUserEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: niaobulashi
 * @description: 系统用户
 * @author: hulang
 * @create: 2019-06-10 10:41
 */
@Mapper
public interface SysUserDao extends BaseMapper<SysUserEntity> {

    /**
     * 查询用户的所有权限
     * @param userId    用户ID
     * @return
     */
    List<String> queryAllPerms(Long userId, String deleteFlag);

    /**
     * 查询用户的所有菜单ID
     * @param userId    用户ID
     * @return
     */
    List<Long> queryAllMenuId(Long userId);
}
