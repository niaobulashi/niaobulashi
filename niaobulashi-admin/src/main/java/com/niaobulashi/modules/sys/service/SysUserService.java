package com.niaobulashi.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.modules.sys.entity.SysUserEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 系统用户
 * @author: hulang
 * @create: 2019-06-12 14:48
 */
@Mapper
public interface SysUserService extends IService<SysUserEntity> {

    /**
     * 查询
     * @param params
     * @return
     */
    PageUtils queryPage(Map<String, Object> params);

    /**
     * 查询用户的所有菜单ID
     * @param userId
     * @return
     */
    List<Long> queryAllMenuId(Long userId);

    /**
     * 保存用户
     * @param user
     */
    void saveUser(SysUserEntity user);

    /**
     * 修改用户
     * @param user
     */
    void update(SysUserEntity user);

    /**
     * 修改密码
     * @param userId        用户ID
     * @param password      原密码
     * @param newPassword   新密码
     * @return
     */
    boolean updatePassword(Long userId, String password, String newPassword);
}
