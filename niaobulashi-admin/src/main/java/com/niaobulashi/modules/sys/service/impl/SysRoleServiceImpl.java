package com.niaobulashi.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.niaobulashi.common.annotation.DataFilter;
import com.niaobulashi.common.utils.Constant;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.common.utils.Query;
import com.niaobulashi.modules.sys.dao.SysRoleDao;
import com.niaobulashi.modules.sys.entity.SysDeptEntity;
import com.niaobulashi.modules.sys.entity.SysRoleEntity;
import com.niaobulashi.modules.sys.service.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 角色管理
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-12 23:22
 */
@Service("sysRoleService")
public class SysRoleServiceImpl extends ServiceImpl<SysRoleDao, SysRoleEntity> implements SysRoleService {

    @Autowired
    private SysRoleMenuService sysRoleMenuService;

    @Autowired
    private SysRoleDeptService sysRoleDeptService;

    @Autowired
    private SysUserRoleService sysUserRoleService;

    @Autowired
    private SysDeptService sysDeptService;

    @Override
    @DataFilter(subDept = true, user = false)
    public PageUtils queryPage(Map<String, Object> params) {
        String roleName = (String) params.get("roleName");

        IPage<SysRoleEntity> page = this.page(
                new Query<SysRoleEntity>().getPage(params),
                new QueryWrapper<SysRoleEntity>()
                        .like(StringUtils.isNotBlank(roleName),"role_name", roleName)
                        .apply(params.get(Constant.SQL_FILTER) != null, (String)params.get(Constant.SQL_FILTER))
        );

        for(SysRoleEntity sysRoleEntity : page.getRecords()){
            SysDeptEntity sysDeptEntity = sysDeptService.getById(sysRoleEntity.getDeptId());
            if(sysDeptEntity != null){
                sysRoleEntity.setDeptName(sysDeptEntity.getName());
            }
        }

        return new PageUtils(page);

    }

    /**
     * 保存角色
     * @param role
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveRole(SysRoleEntity role) {
        role.setCreateTime(new Date());
        this.save(role);

        //保存角色与菜单关系
        sysRoleMenuService.saveOrUpdate(role.getRoleId(), role.getMenuIdList());

        //保存角色与部门关系
        sysRoleDeptService.saveOrUpdate(role.getRoleId(), role.getDeptIdList());

    }

    /**
     * 更新角色
     * @param role
     */
    @Override
    public void update(SysRoleEntity role) {

    }

    /**
     * 批量删除
     * @param roleIds
     */
    @Override
    public void deleteBatch(Long[] roleIds) {

    }
}
