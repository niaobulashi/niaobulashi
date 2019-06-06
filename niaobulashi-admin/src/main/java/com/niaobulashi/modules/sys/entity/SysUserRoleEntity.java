package com.niaobulashi.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @program: niaobulashi
 * @description: 用户与角色对应关系表
 * @author: hulang
 * @create: 2019-06-06 16:56
 */
@Data
@TableName("sys_user_role")
public class SysUserRoleEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId
    private Long id;

    // 用户Id
    private Long userId;

    // 角色Id
    private Long roleId;

    // 删除标志 0：未删除 1：已删除
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

