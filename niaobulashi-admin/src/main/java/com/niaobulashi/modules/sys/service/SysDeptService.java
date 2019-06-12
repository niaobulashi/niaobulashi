package com.niaobulashi.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.niaobulashi.modules.sys.entity.SysDeptEntity;

import java.util.List;
import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 部门管理
 * @author: hulang  hulang6666@qq.com
 * @create: 2019-06-12 20:20
 */
public interface SysDeptService extends IService<SysDeptEntity> {

    List<SysDeptEntity> queryList(Map<String, Object> map);

    /**
     * 查询子部门ID列表
     * @param parentId  上级部门ID
     */
    List<Long> queryDetpIdList(Long parentId);

    /**
     * 获取子部门ID，用于数据过滤
     */
    List<Long> getSubDeptIdList(Long deptId);

}
