package com.niaobulashi.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.niaobulashi.modules.sys.entity.SysMenuEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: niaobulashi
 * @description: 菜单管理
 * @author: hulang
 * @create: 2019-06-10 11:01
 */
@Mapper
public interface SysMenuDao extends BaseMapper<SysMenuEntity> {

    /**
     * 根据父菜单，查询子菜单
     * @param parentId
     * @return
     */
    List<SysMenuEntity> queryListParentId(Long parentId, String deleteFlag);

    /**
     * 获取不包含按钮的菜单列表
     * @return
     */
    List<SysMenuEntity> queryNotButtonList();
}
