package com.niaobulashi.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @program: niaobulashi
 * @description: 角色与菜单对应关系
 * @author: hulang
 * @create: 2019-06-11 10:05
 */
@Data
@TableName("sys_role_menu")
public class SysRoleMenuEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId
    private Long id;

    // 角色ID
    private Long roleId;

    // 菜单Id
    private Long menuId;
}

