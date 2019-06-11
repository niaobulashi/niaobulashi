package com.niaobulashi.modules.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.niaobulashi.modules.sys.dao.SysRoleDeptDao;
import com.niaobulashi.modules.sys.entity.SysRoleDeptEntity;
import com.niaobulashi.modules.sys.service.SysRoleDeptService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: niaobulashi
 * @description: 角色与部门对应关系
 * @author: hulang
 * @create: 2019-06-11 10:42
 */
public class SysRoleDeptServiceImpl extends ServiceImpl<SysRoleDeptDao, SysRoleDeptEntity> implements SysRoleDeptService {

    private static Logger logger = LoggerFactory.getLogger(SysRoleDeptServiceImpl.class);

    /**
     * 保存并更新
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveOrUpdate(Long roleId, List<Long> deptIdList) {
        // 先删除角色与部门关系
        logger.info("先删除角色与部门关系");
        deleteBatch(new Long[]{roleId});

        if (deptIdList.size() == 0) {
            return;
        }

        logger.info("保存角色与部门关系");
        for (Long deptId : deptIdList) {
            SysRoleDeptEntity sysRoleDeptEntity = new SysRoleDeptEntity();
            sysRoleDeptEntity.setDeptId(deptId);
            sysRoleDeptEntity.setRoleId(roleId);
            this.save(sysRoleDeptEntity);
        }
    }

    /**
     * 根据角色ID，获取部门ID列表
     */
    @Override
    public List<Long> queryDeptIdList(Long[] roleIds) {
        return baseMapper.queryDeptIdList(roleIds);
    }

    /**
     * 根据角色ID数组，批量删除
     */
    @Override
    public int deleteBatch(Long[] roleIds) {
        return baseMapper.deleteBatch(roleIds);
    }
}

