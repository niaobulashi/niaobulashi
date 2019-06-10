package com.niaobulashi.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @program: niaobulashi
 * @description: 菜单管理
 * @author: hulang
 * @create: 2019-06-10 11:01
 */
@Data
@TableName("sys_menu")
public class SysMenuEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    // 菜单ID
    @TableId
    private Long menuId;

    // 父菜单ID
    private Long parentId;

    // 父菜单名称
    @TableField(exist = false)
    private String parentName;

    // 菜单名称
    private String name;

    // 菜单URL
    private String url;

    // 授权（多个逗号分隔，如：user:list,user:create）
    private String perms;

    // 类型 0：目录  1：菜单    2：按钮
    private Integer type;

    // 菜单图标
    private String icon;

    // 排序
    private Integer orderNum;

    // ztree属性
    @TableField(exist = false)
    private Boolean open;

    @TableField(exist = false)
    private List<?> list;

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

