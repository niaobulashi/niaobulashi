package com.niaobulashi.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.niaobulashi.common.validator.group.AddGroup;
import com.niaobulashi.common.validator.group.UpdateGroup;
import lombok.Data;
import lombok.NonNull;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @program: niaobulashi
 * @description: 系统用户表
 * @author: hulang
 * @create: 2019-06-06 15:33
 */
@Data
@TableName("sys_user")
public class SysUserEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    // 用户ID
    @TableId
    private Long userId;

    // 用户名
    @NotBlank(message = "用户名不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String username;

    // 密码
    @NotBlank(message = "密码不能为空", groups = AddGroup.class)
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String password;

    // 盐
    private String salt;

    // 邮箱
    @NotBlank(message = "邮箱不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @Email(message = "邮箱格式不正确", groups = {AddGroup.class, UpdateGroup.class})
    private String email;

    // 性别
    private String gender;

    // 手机号
    private String mobile;

    // 状态   0：禁用   1：正常
    private Integer status;

    // 头像
    private String avatar;

    // 描述
    private String description;

    // 角色ID列表
    @TableField(exist = false)
    private List<Long> roleList;

    // 部门ID
    @NotNull(message = "部门不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private Long deptId;

    // 部门名称
    @TableField(exist = false)
    private String deptName;

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

