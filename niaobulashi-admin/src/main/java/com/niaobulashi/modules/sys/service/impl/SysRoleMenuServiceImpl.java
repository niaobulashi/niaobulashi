package com.niaobulashi.modules.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.niaobulashi.common.utils.Constant;
import com.niaobulashi.modules.sys.dao.SysRoleMenuDao;
import com.niaobulashi.modules.sys.entity.SysRoleMenuEntity;
import com.niaobulashi.modules.sys.service.SysRoleMenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: niaobulashi
 * @description: 角色与菜单对应关系
 * @author: hu lang
 * @create: 2019-06-11 23:50
 */
@Service("sysRoleMenuService")
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuDao, SysRoleMenuEntity> implements SysRoleMenuService {

    private static final Logger logger = LoggerFactory.getLogger(SysRoleMenuServiceImpl.class);

    /**
     * 更新并保存数据，角色与菜单
     */
    @Override
    public void saveOrUpdate(Long roleId, List<Long> menuIdList) {
        logger.info("先删除角色与菜单关系");
        deleteBatch(new Long[]{roleId});

        if (menuIdList == null) {
            return;
        }

        logger.info("保存角色与菜单关系");
        for (Long menuId : menuIdList) {
            SysRoleMenuEntity sysRoleMenuEntity = new SysRoleMenuEntity();
            sysRoleMenuEntity.setRoleId(roleId);
            sysRoleMenuEntity.setMenuId(menuId);
            this.save(sysRoleMenuEntity);
        }
    }

    /**
     * 根据角色ID，获取菜单ID列表
     */
    @Override
    public List<Long> queryMenuIdList(Long roleId, String deleteFlag) {
        return baseMapper.queryMenuIdList(roleId, Constant.CODE_DELETE_NO);
    }

    /**
     * 根据角色ID数组，批量删除
     */
    @Override
    public int deleteBatch(Long[] roleIds) {
        return baseMapper.deleteBatch(roleIds, Constant.CODE_DELETE_NO);
    }
}
