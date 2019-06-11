package com.niaobulashi.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @program: niaobulashi
 * @description: 角色表
 * @author: hulang
 * @create: 2019-06-06 16:32
 */
@Data
@TableName("sys_role")
public class SysRoleEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    // 角色ID
    @TableId
    private String roleId;

    // 角色名称
    @NotNull(message = "角色名称不能为空")
    private String roleName;

    // 备注
    private String remark;

    // 部门ID
    @NotNull(message = "部门不能为空")
    private String deptId;

    // 部门名称
    @TableField(exist = false)
    private String deptName;

    // 菜单List
    @TableField(exist = false)
    private List<Long> menuList;

    // 部门List
    @TableField(exist = false)
    private List<Long> deptList;

    // 删除标志 0：未删除 1：已删除
    @TableLogic
    private String deleteFlag;

    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    // 创建人
    private String createUserId;

    // 修改时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;

    // 修改人
    private String updateUserId;
}

