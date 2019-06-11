package com.niaobulashi.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @program: niaobulashi
 * @description: 角色与部门对应关系
 * @author: hulang
 * @create: 2019-06-11 10:07
 */
@Data
@TableName("sys_role_dept")
public class SysRoleDeptEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId
    private Long id;

    // 角色ID
    private Long roleId;

    // 部门ID
    private Long deptId;
}

