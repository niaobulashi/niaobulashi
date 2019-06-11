package com.niaobulashi.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @program: niaobulashi
 * @description: 部门管理
 * @author: hulang
 * @create: 2019-06-11 09:34
 */
@Data
@TableName("sys_dept")
public class SysDeptEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    // 部门ID
    @TableId
    private Long deptId;

    // 上级部门ID
    private String parentId;

    // 部门名称
    private String name;

    // 上级部门名称
    @TableField(exist = false)
    private String parentName;

    // 排序
    private String orderNum;

    // ztree属性
    @TableField(exist = false)
    private Boolean open;

    @TableField(exist = false)
    private List<?> list;

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

