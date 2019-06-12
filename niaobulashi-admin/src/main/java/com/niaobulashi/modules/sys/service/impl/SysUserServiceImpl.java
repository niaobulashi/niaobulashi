package com.niaobulashi.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.niaobulashi.common.annotation.DataFilter;
import com.niaobulashi.common.utils.Constant;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.common.utils.Query;
import com.niaobulashi.modules.sys.dao.SysUserDao;
import com.niaobulashi.modules.sys.entity.SysDeptEntity;
import com.niaobulashi.modules.sys.entity.SysUserEntity;
import com.niaobulashi.modules.sys.entity.SysUserRoleEntity;
import com.niaobulashi.modules.sys.service.SysDeptService;
import com.niaobulashi.modules.sys.service.SysRoleDeptService;
import com.niaobulashi.modules.sys.service.SysUserRoleService;
import com.niaobulashi.modules.sys.service.SysUserService;
import com.niaobulashi.modules.sys.shrio.ShiroUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 用户管理
 * @author: hulang
 * @create: 2019-06-12 19:14
 */
@Service("sysUserService")
public class SysUserServiceImpl extends ServiceImpl<SysUserDao, SysUserEntity> implements SysUserService {

    private static final Logger logger = LoggerFactory.getLogger(SysUserServiceImpl.class);

    @Autowired
    private SysUserRoleService sysUserRoleService;

    @Autowired
    private SysDeptService sysDeptService;

    /**
     * 查询
     * @param params
     * @return
     */
    @Override
    @DataFilter(subDept = true, user = false)
    public PageUtils queryPage(Map<String, Object> params) {
        String username = (String) params.get("username");

        IPage<SysUserEntity> page = this.page(
                new Query<SysUserEntity>().getPage(params),
                new QueryWrapper<SysUserEntity>()
                        .like(StringUtils.isNotBlank(username), "username", username)
                        .apply(params.get(Constant.SQL_FILTER) != null, (String)params.get(Constant.SQL_FILTER))
        );

        for (SysUserEntity sysUserEntity : page.getRecords()) {
            SysDeptEntity sysDeptEntity = sysDeptService.getById(sysUserEntity.getDeptId());
            sysUserEntity.setDeptName(sysDeptEntity.getName());
        }

        return new PageUtils(page);
    }

    /**
     * 查询用户的所有菜单ID
     * @param userId
     * @return
     */
    @Override
    public List<Long> queryAllMenuId(Long userId) {
        return baseMapper.queryAllMenuId(userId, Constant.CODE_DELETE_NO);
    }

    /**
     * 保存用户
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveUser(SysUserEntity user) {
        user.setCreateTime(new Date());
        // sha256加密
        String salt = RandomStringUtils.randomAlphanumeric(20);
        user.setSalt(salt);
        user.setPassword(ShiroUtils.sha256(user.getPassword(), user.getSalt()));
        this.save(user);

        // 保存用户与角色关系
        sysUserRoleService.saveOrUpdate(user.getUserId(), user.getRoleIdList());
    }

    /**
     * 更新用户
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(SysUserEntity user) {
        if (StringUtils.isBlank(user.getPassword())) {
            user.setPassword(null);
        } else {
            SysUserEntity userEntity = this.getById(user.getUserId());
            user.setPassword(ShiroUtils.sha256(user.getPassword(), userEntity.getSalt()));
        }
        this.updateById(user);

        // 保存用户与角色关系
        sysUserRoleService.saveOrUpdate(user.getUserId(), user.getRoleIdList());
    }

    /**
     * 更改密码
     */
    @Override
    public boolean updatePassword(Long userId, String password, String newPassword) {
        SysUserEntity sysUserEntity = new SysUserEntity();
        sysUserEntity.setPassword(newPassword);
        return this.update(sysUserEntity,
                new QueryWrapper<SysUserEntity>().eq("user_id", userId).eq("password", password));
    }
}

